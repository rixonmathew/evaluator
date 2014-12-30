<?php

class AudioSection1Renderer {

    public function doEvaluate($question) {
        //TODO add hindi and marathi audio using radio boxes
        $renderingHTML = <<<RENDER_HTML
        <div id="questionSet" class="row">
            <div class="col-md-5">
                <div class="radio">
                   <label class="radio-inline">Select the language for the audio:</label>
                   <label class="radio-inline">
                      <input type="radio" name = "audioLanguage" id="audioLanguage" value="hindi" onclick="flipAudioLanguage('hindi')" checked>Hindi
                   </label>
                   <label class="radio-inline">
                      <input type="radio" name = "audioLanguage" id="audioLanguage" value="marathi" onclick="flipAudioLanguage('marathi')">Marathi
                   </label>
                </div>
                <audio controls id="audio_question_1" name="audio_question_1">
                    <source id="audio_file_1" src="media/audio_hindi.mp3" type="audio/mp3"/>
                    Your browser does not support audio control
                </audio>
                <h4>{$question->getText()}</h4>
                <textarea rows="3" cols="70" name="{$question->getId()}_answer" id="{$question->getId()}_answer" class="form-control" required="true"></textarea>
            </div>
        </div>
RENDER_HTML;
        return $renderingHTML.PHP_EOL;
    }
}