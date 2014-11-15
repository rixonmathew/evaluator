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
    private $passagesForSection;
    private $questionsForPassage;
    private $answersForQuestion;
    private $dbh;

    public function __construct($testId,$dbh) {
        $this->testId = $testId;
        $this->dbh = $dbh;
        $this->populateTestMetaData();
    }

    private function populateTestMetaData(){
        $this->populateSections();
        $this->populatePassagesPerSection(); //TODO think about sceanarios where questions without passages are there.
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

    private function populatePassagesPerSection() {
        $this->passagesForSection = array();
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
        }
    }

    private function populateQuestionsPerPassage() {
        $this->questionsForPassage = array();
        foreach($this->sections as $section) {
            $passagesForSection = $this->passagesForSection[$section->getId()];
            foreach($passagesForSection as $passage){
                $questionPerPassageQuery = <<<QUERY_QFP
    select q.id,
           q.text,
           q.number
      from question_set qs,
           question q
     where qs.passage_id = {$passage->getId()}
       and q.id = qs.question_id
       order by qs.`order`;
QUERY_QFP;

                $statement = $this->dbh->query($questionPerPassageQuery);
                $questionsPerPassage = $statement->fetchAll(PDO::FETCH_CLASS,"Question");
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

} 