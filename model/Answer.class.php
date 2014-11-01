<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 01/11/14
 * Time: 8:57 PM
 */

class Answer {
    private $id;
    private $text;
    private $correct;

    function __construct($correct, $id, $text)
    {
        $this->correct = $correct;
        $this->id = $id;
        $this->text = $text;
    }

    /**
     * @return mixed
     */
    public function getCorrect()
    {
        return $this->correct;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getText()
    {
        return $this->text;
    }




} 