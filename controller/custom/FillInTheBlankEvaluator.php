<?php

class FillInTheBlankEvaluator {
    public function doEvaluate($question,$selectedAnswer,$correctAnswer){
        $wordsMatched = 0;
        $answerArray = explode(",",$selectedAnswer);
        //array of possible words to match to see how many words in the selected answer.
        foreach($correctAnswer as $word){
            if (in_array($word,$answerArray)){
                $wordsMatched++;
            }
        }
        return "$wordsMatched:".sizeof($correctAnswer);
    }
}