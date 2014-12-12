<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 12/12/14
 * Time: 8:04 AM
 * To change this template use File | Settings | File Templates.
 */

class viewAllTestResultsController extends BaseController {

    function index()
    {
        $this->checkAuthenticated();
        $this->registry->template->testResults = $this->getAllTestResults();
        $this->registry->template->show('viewResults');
    }

    function getAllTestResults(){
        $userId = $_SESSION['userId'];
        $selectQuery = <<<QUERY_QFT
    select id,
           date,
           test_id as testId,
           overall_grade as overallScore,
           communication_grade as communicationScore,
           comprehension_grade as comprehensionScore
      from test_attempt
     where user_id = $userId;
QUERY_QFT;

        $dbh = $this->registry->db;
        $stmt = $dbh->query($selectQuery);
        return $stmt->fetchAll(PDO::FETCH_CLASS,"TestResult");
    }

}