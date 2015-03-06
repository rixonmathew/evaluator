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
            <div class="col-md-9">
                <h4>{$question->getText()}</h4>
                $audioControlHTML
            </div>
RENDER_HTML;
        return $renderingHTML.PHP_EOL;
    }
    private function getHTMLforAudioControls($questionId) {
        $audioControlHTML=<<<AUDIO_HTML
            <div class="col-md-9">
                <div class="button-group">
                    <audio id="audio_question_1" name="audio_question_1" src="media/word1.mp3"></audio>
                    <input type="button" value="Play" onclick="play(1)"/>
                    <input type="text" class="form_control" id="q_{$questionId}_answer_1" name="q_{$questionId}_answer_1"/>
                </div>
            </div>
            <br/>
AUDIO_HTML;

        for ($i=2;$i<=15;$i++) {
        $audioControlHTML.=<<<AUDIO_HTML_LOOP
            <div class="col-md-9">
                <div class="button-group">
                    <audio id="audio_question_{$i}" name="audio_question_{$i}" src="media/word{$i}.mp3"></audio>
                    <input type="button" value="Play" onclick="play({$i})"/>
                    <input type="text" class="form_control" id="q_{$questionId}_answer_{$i}" name="q_{$questionId}_answer_{$i}"/>
                </div>
            </div>
            <br/>
AUDIO_HTML_LOOP;
        }
        return $audioControlHTML;
    }
}