/*------------ Model1 프로젝트 DB ------------*/
create database model1Community;
use model1Community;

/* ------------회원 정보 테이블------------ */
CREATE TABLE `model1community`.`member` (
  `num` 		INT 					NOT NULL AUTO_INCREMENT,
  `uId` 			VARCHAR(20) 	NOT NULL,
  `uPw` 		VARCHAR(20) 	NOT NULL,
  `uName` 	VARCHAR(20) 	NOT NULL,
  `gender` 	CHAR(1) 			NOT NULL,
  `uEmail` 	VARCHAR(30) 	NOT NULL,
  `uBirthday` 	CHAR(6) 			NOT NULL,
  `uZipcode` 	CHAR(7) 			NULL,
  `uAddr` 		VARCHAR(60) 	NULL,
  `uHobby` 	CHAR(5) 			NULL,
  `uJob` 		VARCHAR(30) 	NULL,
  PRIMARY KEY (`uId`),
  UNIQUE INDEX `num_UNIQUE` (`num` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

select * from member limit 10;

/* ------------우편번호 테이블------------ */
CREATE TABLE `model1community`.`tblzipcode` (
  `zipcode` CHAR(7) NOT NULL,
  `area1` CHAR(10) NULL,
  `area2` CHAR(20) NULL,
  `area3` CHAR(40) NULL,
  `area4` CHAR(20) NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/* ------------BBS 게시글 테이블------------ */
CREATE TABLE `model1community`.`bbsboard` (
  `bno` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(30) NULL,
  `writer` VARCHAR(20) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NULL,
  `write_date` DATETIME NOT NULL,
  `up_date` DATETIME NOT NULL,
  `view_cnt` INT NULL DEFAULT 0,
  `comment_cnt` INT NULL DEFAULT 0,
  PRIMARY KEY (`bno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;