<?php

class Passage {

    private $id;
    private $description;
    private $number;


    /**
     * @return mixed
     */
    public function getDescription()
    {
        if (is_null($this->getNumber()))
            return $this->description;
        else
            return $this->getNumber().")  ".$this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
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
}