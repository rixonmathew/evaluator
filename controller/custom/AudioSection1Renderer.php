<?php
/**
 * Created by JetBrains PhpStorm.
 * User: rixonmathew
 * Date: 23/11/14
 * Time: 12:03 PM
 * To change this template use File | Settings | File Templates.
 */

class AudioSection1Renderer {

    public function doEvaluate($question) {
        $renderingHTML = <<<RENDER_HTML
        <div id="questionSet" class="row">
            <div class="col-md-5">
                <h4>{$question->getText()}</h4>
                <textarea rows="3" cols="70" name="{$question->getId()}_answer" id="{$question->getId()}_answer" class="form-control" required="true"></textarea>
            </div>
        </div>
RENDER_HTML;
        echo $renderingHTML.PHP_EOL;
    }
}