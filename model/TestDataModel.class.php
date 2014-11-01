<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 11:15 PM
 */

class TestDataModel {

    private $user;
    private $testId;
    private $testData;
    private $sections;
    private $passagesForSection;
    private $questionsForPassage;
    private $answersForQuestion;
    private $responses;
    private $timeTaken;

    private function populateTestMetaData(){
        foreach($this->testData as $testRecord) {
            $this->sections[$testRecord->section_id]= $testRecord->section_name;
            $this->questions[$testRecord->question_id]= $testRecord->question_text;
        }
    }


    public function __construct($user,$testId,$testData) {
        $this->user = $user;
        $this->testId = $testId;
        $this->testData=$testData;
        $this->populateTestMetaData();
    }


    public function getNextSection() {

    }

    public function getPassages() {
        $this->passagesForSection = array(
            new Passage("Fatima was very good at studies and always stood first in her class. She and her sisters studied in a government school.
                         She was in class 10 while her younger sisters were in class 7 & class 5. Their school was almost 3 kilometers away from
                         their house but they walked everyday to save on transport money. The sisters were not very good at studies so Fatima requested
                         her parents to send them for extra tuition classes after school hours. Her parents did not earn so much to send all 3 daughters for
                         tuitions so Fatima chose to study on her own. Because of this sacrifice, everyone in the house respected her very much",1),
            new Passage("Some more Test Passage here",2),
            new Passage("Some more Test Passage here",3),
        );
        return $this->passagesForSection;
    }

    public function getQuestionsForPassage($passageId) {
        $this->questionsForPassage = array(
            new Question(1,"How many roads must a man walk down?"),
            new Question(2,"How many roads must a man walk down some more?"),
            new Question(3,"How many roads must a man walk down how more?"),
            new Question(4,"How many roads must a man walk down crazy bithces....?"),
            new Question(4,"How many roads must a man walk down crazy bithces....?")
        );
        return $this->questionsForPassage;
    }

    public function getAnswersForQuestion($questionId) {
        $this->answersForQuestion = array(
            new Answer(0,1,"Answer 1"),
            new Answer(0,2,"Answer 2"),
            new Answer(1,3,"Answer 3"),
            new Answer(0,4,"Answer 4"),
        );
        return $this->answersForQuestion;
    }

} 