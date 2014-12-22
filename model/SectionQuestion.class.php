<?php
class SectionQuestion {

    private $id;
    private $sectionId;
    private $questionId;
    private $order;
    private $questionSetDefinitionId;

    function __construct()
    {
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
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $order
     */
    public function setOrder($order)
    {
        $this->order = $order;
    }

    /**
     * @return mixed
     */
    public function getOrder()
    {
        return $this->order;
    }

    /**
     * @param mixed $questionId
     */
    public function setQuestionId($questionId)
    {
        $this->questionId = $questionId;
    }

    /**
     * @return mixed
     */
    public function getQuestionId()
    {
        return $this->questionId;
    }

    /**
     * @param mixed $questionSetDefinitionId
     */
    public function setQuestionSetDefinitionId($questionSetDefinitionId)
    {
        $this->questionSetDefinitionId = $questionSetDefinitionId;
    }

    /**
     * @return mixed
     */
    public function getQuestionSetDefinitionId()
    {
        return $this->questionSetDefinitionId;
    }

    /**
     * @param mixed $sectionId
     */
    public function setSectionId($sectionId)
    {
        $this->sectionId = $sectionId;
    }

    /**
     * @return mixed
     */
    public function getSectionId()
    {
        return $this->sectionId;
    }

    public function isQuestionSet(){
        return !is_null($this->getQuestionSetDefinitionId());
    }


}