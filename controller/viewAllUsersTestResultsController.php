<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 08/03/15
 * Time: 9:25 PM
 */

class viewAllUsersTestResultsController extends BaseController {

    /**
     * @all controllers must contain an index method
     */
    function index()
    {
        $this->checkAuthenticated();
        $this->registry->template->testResults = $this->getAllTestResults();
        $this->registry->template->show('viewAllUsersResult');
    }

    function getAllTestResults(){
        $selectQuery = <<<QUERY_QFT
    select usr.username as userName,
		   usr.first_name as firstName,
           ta.id as testAttemptId,
           date as testDateAndTime,
           test_id as testId,
           overall_grade as overallScore,
           communication_grade as communicationScore,
           comprehension_grade as comprehensionScore
      from test_attempt ta,
		   user usr
     where usr.id = ta.user_id
     order by date, userName;
QUERY_QFT;

        $dbh = $this->registry->db;
        $stmt = $dbh->query($selectQuery);
        return $stmt->fetchAll(PDO::FETCH_CLASS,"AllUsersTestResult");
    }
}