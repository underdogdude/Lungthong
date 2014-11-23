SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `lungthong` DEFAULT CHARACTER SET utf8 ;
USE `lungthong` ;

-- -----------------------------------------------------
-- Table `lungthong`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lungthong`.`member` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `surname` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `tel` VARCHAR(10) NULL DEFAULT NULL,
  `social` VARCHAR(45) NULL DEFAULT NULL,
  `pic` VARCHAR(45) NULL DEFAULT NULL,
  `score` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lungthong`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lungthong`.`post` (
  `post_id` INT(11) NOT NULL AUTO_INCREMENT,
  `head` VARCHAR(45) NULL DEFAULT NULL,
  `pic` VARCHAR(45) NULL DEFAULT NULL,
  `style` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `colour` VARCHAR(45) NULL DEFAULT NULL,
  `size` VARCHAR(45) NULL DEFAULT NULL,
  `minp` INT(11) NULL DEFAULT NULL,
  `maxp` INT(11) NULL DEFAULT NULL,
  `comment` VARCHAR(300) NULL DEFAULT NULL,
  `stat` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_post_member_idx` (`user_id` ASC),
  CONSTRAINT `fk_post_member`
    FOREIGN KEY (`user_id`)
    REFERENCES `lungthong`.`member` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lungthong`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lungthong`.`comment` (
  `com_id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `owner` INT(11) NULL DEFAULT NULL,
  `post_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  INDEX `fk_comment_member1_idx` (`owner` ASC),
  INDEX `fk_comment_post1_idx` (`post_id` ASC),
  CONSTRAINT `fk_comment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `lungthong`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_member1`
    FOREIGN KEY (`owner`)
    REFERENCES `lungthong`.`member` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
