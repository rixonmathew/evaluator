<?php

class Section {

    private $id;
    private $name;
    private $type;
    private $timeLimit;
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
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return mixed
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param mixed $type
     */
    public function setType($type)
    {
        $this->type = $type;
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
     * @param mixed $timeLimit
     */
    public function setTimeLimit($timeLimit)
    {
        $this->timeLimit = $timeLimit;
    }

    /**
     * @return mixed
     */
    public function getTimeLimit()
    {
        return $this->timeLimit;
    }


    function __toString()
    {
        return "Section [id=>$this->id,name=>$this->name,type=$this->type]";
    }


} 