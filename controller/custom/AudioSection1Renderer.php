<?php

class AudioSection1Renderer {

    /*
     * html to switch between hindi and marathi
                <div class="radio">
                   <label class="radio-inline">Select the language for the audio:</label>
                   <label class="radio-inline">
                      <input type="radio" name = "audioLanguage" id="audioLanguage" value="hindi" onclick="flipAudioLanguage('hindi')" checked>Hindi
                   </label>
                   <label class="radio-inline">
                      <input type="radio" name = "audioLanguage" id="audioLanguage" value="marathi" onclick="flipAudioLanguage('marathi')">Marathi
                   </label>
                </div>
     */

    public function doEvaluate($question) {
        //TODO add hindi and marathi audio using radio boxes
        $audioControlHTML = $this->getHTMLforAudioControls($question->getId());

        $renderingHTML = <<<RENDER_HTML
        <div id="questionSet" class="row">
            <div class="col-md-5">
                <h4>{$question->getText()}</h4>
                $audioControlHTML
            </div>
        </div>
RENDER_HTML;
        return $renderingHTML.PHP_EOL;
    }

    private function getHTMLforAudioControls($questionId) {
        $audioControlHTML=<<<AUDIO_HTML
        <div class="row">
                <audio controls id="audio_question_1" name="audio_question_1">
                    <source id="audio_file_1" src="media/word1.mp3" type="audio/mp3"/>
                    Your browser does not support audio control
                </audio>
                <input type="text" class="form_control" id="q_{$questionId}_answer_1" name="q_{$questionId}_answer_1"/>
        </div>
AUDIO_HTML;

        for ($i=2;$i<=15;$i++) {
        $audioControlHTML.=<<<AUDIO_HTML_LOOP
        <div class="row">
                <audio controls id="audio_question_$i" name="audio_question_$i">
                    <source id="audio_file_$i" src="media/word$i.mp3" type="audio/mp3"/>
                    Your browser does not support audio control
                </audio>
                <input type="text" class="form_control" id="q_{$questionId}_answer_{$i}" name="q_{$questionId}_answer_{$i}"/>
        </div>
AUDIO_HTML_LOOP;
        }
        return $audioControlHTML;
    }
}