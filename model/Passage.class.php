<?php
/**
 * Created by PhpStorm.
 * User: rixonmathew
 * Date: 02/11/14
 * Time: 1:40 AM
 */

class Passage {

    private $id;
    private $description;
    private $number;


    /**
     * @return mixed
     */
    public function getDescription()
    {
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