<?php

class AudioSection1Renderer {

    public function doEvaluate($question) {
        //TODO add hindi and marathi audio using radio boxes
        $renderingHTML = <<<RENDER_HTML
        <div id="questionSet" class="row">
            <div class="col-md-5">
                <audio controls>
                    <source src="media/audio_hin.mp3" type="audio/mpeg"/>
                    <source src="media/audio_hin.mp3" type="audio/mpeg"/>
                    <source src="media/audio_hin.mp3" type="audio/mpeg"/>
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