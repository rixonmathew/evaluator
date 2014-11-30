<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 11:15 PM
 */

class TestDataModel {

    private $testId;
    private $sections;
    private $sectionQuestions;
    private $passagesForSection;
    private $passages;
    private $questionsForPassage;
    private $questions;
    private $answersForQuestion;
    private $dbh;

    public function __construct($testId,$dbh) {
        $this->testId = $testId;
        $this->dbh = $dbh;
        $this->populateTestMetaData();
    }

    private function populateTestMetaData(){
        $this->populateSections();
        $this->populateSectionQuestions();
        $this->populatePassagesPerSection();
        $this->populateQuestionsPerPassage();
    }

    private function populateSections() {
        $sectionsQueryForTest = <<<QUERY_QFT
    select s.id,
           s.name,
           s.type
      from section s,
           test_section ts
     where ts.test_id = $this->testId
       and s.id = ts.section_id;
QUERY_QFT;

        $stmt = $this->dbh->query($sectionsQueryForTest);
        $this->sections = $stmt->fetchAll(PDO::FETCH_CLASS,"Section");
    }

    private function populateSectionQuestions() {
        $this->sectionQuestions = array();
        foreach($this->sections as $section){
            $sectionQuestionsQuery = <<<QUERY_SQ
    select sq.id,
		   sq.section_id as sectionId,
           sq.question_id as questionId,
           sq.`order`,
           sq.question_set_definition_id as questionSetDefinitionId
      from section_questions sq
     where sq.section_id = {$section->getId()}
     order by sq.`order`;
QUERY_SQ;

            $statement = $this->dbh->query($sectionQuestionsQuery);
            $sectionQuestions = $statement->fetchAll(PDO::FETCH_CLASS,"SectionQuestion");
            $this->sectionQuestions[$section->getId()] = $sectionQuestions;
        }
    }

    private function populatePassagesPerSection() {
        $this->passagesForSection = array();
        $this->passages = array();
        foreach($this->sections as $section){
            $passagePerSectionQuery =<<<QUERY_PFS
    select p.id,
           p.description,
           p.number
      from section_questions sq,
           question_set_definition qsd,
           question_set qs,
           passage p
     where sq.section_id = {$section->getId()}
       and qsd.id = sq.question_set_definition_id
       and qs.question_set_definition_id = qsd.id
       and p.id = qs.passage_id
     group by p.id,p.description
     order by sq.`order`
QUERY_PFS;
            $statement = $this->dbh->query($passagePerSectionQuery);
            $passagesPerSection = $statement->fetchAll(PDO::FETCH_CLASS,"Passage");
            $this->passagesForSection[$section->getId()]=$passagesPerSection;

            foreach($passagesPerSection as $passage) {
                $this->passages[$passage->getId()] = $passage;
            }
        }
    }

    private function populateQuestionsPerPassage() {
        $this->questionsForPassage = array();
        $this->questions = array();
        foreach($this->sections as $section) {
            $passagesForSection = $this->passagesForSection[$section->getId()];
            foreach($passagesForSection as $passage){
                $questionPerPassageQuery = <<<QUERY_QFP
    select q.id,
           q.text,
           q.number,
           q.type,
           q.evaluating_class as evaluatingClass,
           q.rendering_class as renderingClass
      from question_set qs,
           question q
     where qs.passage_id = {$passage->getId()}
       and q.id = qs.question_id
       order by qs.`order`;
QUERY_QFP;

                $statement = $this->dbh->query($questionPerPassageQuery);
                $questionsPerPassage = $statement->fetchAll(PDO::FETCH_CLASS,"Question");

                foreach($questionsPerPassage as $question){
                    $this->questions[$question->getId()] = $question;
                }
                $this->questionsForPassage[$passage->getId()] = $questionsPerPassage;
                $this->populateAnswersPerQuestion($questionsPerPassage);
            }
        }
    }

    private function populateAnswersPerQuestion($questionsForPassage) {
        foreach ($questionsForPassage as $question) {
            $answersPerQuestionQuery = <<<QUERY_AFQ
        select a.id,
               a.text,
               a.correct,
               a.number
          from answer a
         where a.question_id = {$question->getId()}
           order by a.`order`;
QUERY_AFQ;

            $statement = $this->dbh->query($answersPerQuestionQuery);
            $answers = $statement->fetchAll(PDO::FETCH_CLASS,"Answer");
            $this->answersForQuestion[$question->getId()] = $answers;
        }
    }

    public function getNextSection() {

    }

    public function getPassages($sectionId) {
        return $this->passagesForSection[$sectionId];
    }

    public function getQuestionsForPassage($passageId) {
        return $this->questionsForPassage[$passageId];
    }

    public function getAnswersForQuestion($questionId) {
        return $this->answersForQuestion[$questionId];
    }

    public function getSectionQuestions($sectionId) {
        return $this->sectionQuestions[$sectionId];
    }

    public function getPassage($passageId) {
        return $this->passages[$passageId];
    }

    public function getQuestion($questionId) {
        return $this->questions[$questionId];
    }

}