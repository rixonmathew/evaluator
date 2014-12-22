<?php

class Question {
    private $id;
    private $text;
    private $number;
    private $type;
    private $renderingClass;
    private $evaluatingClass;

    function __construct()
    {
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getText()
    {
        return $this->getNumber().") ".$this->text;
    }

    /**
     * @param mixed $text
     */
    public function setText($text)
    {
        $this->text = $text;
    }

    /**
     * @return mixed
     */
    public function getNumber()
    {
        return $this->number;
    }

    /**
     * @param mixed $number
     */
    public function setNumber($number)
    {
        $this->number = $number;
    }

    /**
     * @param mixed $evaluatingClass
     */
    public function setEvaluatingClass($evaluatingClass)
    {
        $this->evaluatingClass = $evaluatingClass;
    }

    /**
     * @return mixed
     */
    public function getEvaluatingClass()
    {
        return $this->evaluatingClass;
    }

    /**
     * @param mixed $renderingClass
     */
    public function setRenderingClass($renderingClass)
    {
        $this->renderingClass = $renderingClass;
    }

    /**
     * @return mixed
     */
    public function getRenderingClass()
    {
        return $this->renderingClass;
    }

    /**
     * @param mixed $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }
}