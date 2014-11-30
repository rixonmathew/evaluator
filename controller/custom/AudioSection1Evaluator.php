<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 23/11/14
 * Time: 11:58 AM
 * To change this template use File | Settings | File Templates.
 */

class AudioSection1Evaluator {

    public function doEvaluate($question,$selectedAnswer){
        $wordsMatched = 0;
        $possibleWords = array("Hello","World","Language"); //TODO get expected word list also from DB
        $answerArray = explode(",",$selectedAnswer);
        //var_dump($answerArray);
        //array of possible words to match to see how many words in the selected answer.
        foreach($possibleWords as $word){
            if (in_array($word,$answerArray)){
                $wordsMatched++;
            }
        }
        return $wordsMatched/sizeof($possibleWords);
    }
}