<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 8:59 PM
 */

class takeTestController extends BaseController{

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        //get all sections for test.
        //Populate details for Section#1 or next Section
        //show the view
        $testDetailsQuery = "select t.id as test_id,
                                   t.name as test_name,
                                   s.id as section_id,
                                   s.name as section_name,
                                   q.id as question_id,
                                   q.text as question_text,
                                   a.id as answer_id,
                                   a.text as answer_text,
                                   a.correct as is_correct
                              from test t,
                                   test_section ts,
                                   section_questions sq,
                                   section s,
                                   question_set_definition qsd,
                                   question_set qs,
                                   passage p,
                                   question q,
                                   answer a
                             where ts.test_id = t.id
                               and sq.section_id = ts.section_id
                               and qsd.id = sq.question_set_definition_id
                               and qs.question_set_definition_id = qsd.id
                               and s.id = sq.section_id
                               and q.id = qs.question_id
                               and p.id = qs.passage_id
                               and a.question_id = q.id
                             order by ts.`order`,sq.`order`,qs.id;";

        $dbh = $this->registry->db;
        $stmt = $dbh->query($testDetailsQuery);
        $testData = $stmt->fetchAll(PDO::FETCH_OBJ);
        $sections = array();
        foreach($testData as $test){
//            echo "Test id is $test->test_id";
//            echo "Test id is $test->question_text";
            $sections[$test->section_id] = $test->section_name;
        }
        $testDataModel = new TestDataModel("rixon","1",$testData);
        $this->registry->template->testDataModel = $testDataModel;
        $this->registry->template->sections = $sections;
        $this->registry->template->sectionNumber = 1;
        $this->registry->template->show('takeTest');
    }
}