-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema evaluator
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema evaluator
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evaluator` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `evaluator` ;

-- -----------------------------------------------------
-- Table `evaluator`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'This entity will hold all the question that can be part of test';


-- -----------------------------------------------------
-- Table `evaluator`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(100) NOT NULL,
  `correct` TINYINT(1) NOT NULL DEFAULT 0,
  `question_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_answers_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_answers_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `evaluator`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold all the possible answers to a given question and indicate what the correct answer is';


-- -----------------------------------------------------
-- Table `evaluator`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(500) NOT NULL,
  `first_name` VARCHAR(500) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `admin` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'This entity defines the various users in the systems';


-- -----------------------------------------------------
-- Table `evaluator`.`passage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`passage` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '	',
  `description` VARCHAR(5000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'This entity will hold independent passaseges or other media around which questions can be asked';


-- -----------------------------------------------------
-- Table `evaluator`.`question_set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`question_set` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `passage_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  INDEX `fk_question_set_passage1_idx` (`passage_id` ASC),
  INDEX `fk_question_set_question1_idx` (`question_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_question_set_passage1`
    FOREIGN KEY (`passage_id`)
    REFERENCES `evaluator`.`passage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_set_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `evaluator`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'A question_set is used to relate all the questions that run of a passage or a audio clip';


-- -----------------------------------------------------
-- Table `evaluator`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`section` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '	',
  `name` VARCHAR(100) NOT NULL,
  `type` VARCHAR(50) NOT NULL COMMENT 'Type of the section. Fixed implies the questions are picked from defined set',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'A section is group of questions that are related logically';


-- -----------------------------------------------------
-- Table `evaluator`.`test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`test` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(5000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'This entity will be used to define a test ';


-- -----------------------------------------------------
-- Table `evaluator`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_activity_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `evaluator`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will represent an activity done by user ';


-- -----------------------------------------------------
-- Table `evaluator`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `degree` VARCHAR(45) NOT NULL,
  `instituition` VARCHAR(1000) NOT NULL,
  `address` VARCHAR(1000) NULL,
  `url` VARCHAR(1000) NULL,
  `year_obtained` DATE NULL,
  `grade` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_education_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_education_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `evaluator`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold the various educational details of the user';


-- -----------------------------------------------------
-- Table `evaluator`.`certification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`certification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluator`.`test_attempt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`test_attempt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `overall_grade` VARCHAR(100) NOT NULL,
  `user_id` INT NOT NULL,
  `test_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_test_attempt_user1_idx` (`user_id` ASC),
  INDEX `fk_test_attempt_test1_idx` (`test_id` ASC),
  CONSTRAINT `fk_test_attempt_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `evaluator`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_attempt_test1`
    FOREIGN KEY (`test_id`)
    REFERENCES `evaluator`.`test` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold the attempts of a given test by the user';


-- -----------------------------------------------------
-- Table `evaluator`.`question_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`question_attribute` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '	',
  `question_id` INT NOT NULL,
  `atrtribute` VARCHAR(100) NOT NULL,
  `value` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_attribute_question_idx` (`question_id` ASC),
  CONSTRAINT `fk_question_attribute_question`
    FOREIGN KEY (`question_id`)
    REFERENCES `evaluator`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold the various attributes associated with question e.g complexity or tags (like comprehension, grammar, tenses etc.). For adaptive tests this attributes will be looked to get a question in random';


-- -----------------------------------------------------
-- Table `evaluator`.`test_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`test_section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `test_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  `order` INT NOT NULL,
  INDEX `fk_test_has_section_section1_idx` (`section_id` ASC),
  INDEX `fk_test_has_section_test1_idx` (`test_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_test_has_section_test1`
    FOREIGN KEY (`test_id`)
    REFERENCES `evaluator`.`test` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_has_section_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `evaluator`.`section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold all the section for a given test';


-- -----------------------------------------------------
-- Table `evaluator`.`section_questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`section_questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `section_id` INT NOT NULL,
  `question_set_id` INT NULL,
  `question_id` INT NULL,
  `order` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_section_questions_section1_idx` (`section_id` ASC),
  INDEX `fk_section_questions_question_set1_idx` (`question_set_id` ASC),
  INDEX `fk_section_questions_question1_idx` (`question_id` ASC),
  CONSTRAINT `fk_section_questions_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `evaluator`.`section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_questions_question_set1`
    FOREIGN KEY (`question_set_id`)
    REFERENCES `evaluator`.`question_set` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_questions_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `evaluator`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluator`.`test_attempt_analytics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`test_attempt_analytics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `test_attempt_id` INT NOT NULL,
  `test_section_id` INT NOT NULL,
  `attribute` VARCHAR(100) NOT NULL,
  `value` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_test_attempt_analytics_test_attempt1_idx` (`test_attempt_id` ASC),
  INDEX `fk_test_attempt_analytics_test_section1_idx` (`test_section_id` ASC),
  CONSTRAINT `fk_test_attempt_analytics_test_attempt1`
    FOREIGN KEY (`test_attempt_id`)
    REFERENCES `evaluator`.`test_attempt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_attempt_analytics_test_section1`
    FOREIGN KEY (`test_section_id`)
    REFERENCES `evaluator`.`test_section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold the analysis of the test attempts in terms of questions attempted, correct answers areas of improvement etc.';


-- -----------------------------------------------------
-- Table `evaluator`.`administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`administrator` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluator`.`section_attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluator`.`section_attribute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `attribute` VARCHAR(100) NOT NULL,
  `value` VARCHAR(500) NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_section_attribute_section1_idx` (`section_id` ASC),
  CONSTRAINT `fk_section_attribute_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `evaluator`.`section` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This entity will hold the various attributes with regards to a section';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
