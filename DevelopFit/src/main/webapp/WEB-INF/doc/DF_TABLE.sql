--사용자 계정 생성 및 계정 비밀번호 변경, 잠금 해제
CREATE USER df IDENTIFIED BY df12 ACCOUNT UNLOCK;

--계정에 접근 가능 권한 부여 (생성한 사용자가 데이터베이스에 접속할 수 있도록 기본적인 시스템 권한 8가지를 부여)
--계정에 객체 생성 권한 설정 (생성한 사용자에 대하여 객체(테이블, 뷰, 인덱스등)을 생성할 수 있도록 시스템 권한을 부여)
GRANT CONNECT, RESOURCE, DBA TO df;


/* Drop Tables */

DROP TABLE CAST_MEMBER CASCADE CONSTRAINTS;
DROP TABLE ACTOR CASCADE CONSTRAINTS;
DROP TABLE BASKET CASCADE CONSTRAINTS;
DROP TABLE POST_COMMENT CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE DIRECTOR CASCADE CONSTRAINTS;
DROP TABLE HEART CASCADE CONSTRAINTS;
DROP TABLE LINE_REVIEW CASCADE CONSTRAINTS;
DROP TABLE ORDER_HISTORY CASCADE CONSTRAINTS;
DROP TABLE RATING CASCADE CONSTRAINTS;
DROP TABLE WATCH CASCADE CONSTRAINTS;
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE GENRE CASCADE CONSTRAINTS;
DROP TABLE PREFER_GENRE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE CAST_MEMBER CASCADE CONSTRAINTS;

COMMIT;

/* Create Tables */

CREATE TABLE ACTOR
(
	ACTOR_NUMBER number NOT NULL,
	ACTOR_NAME varchar2(50) NOT NULL,
	PRIMARY KEY (ACTOR_NUMBER)
);


CREATE TABLE BASKET
(
	BASKET_NO number NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (BASKET_NO)
);


CREATE TABLE BOARD
(
	BOARD_NUMBER number NOT NULL,
	BOARD_TITLE varchar2(100) NOT NULL,
	BOARD_CONTENT varchar2(500) NOT NULL,
	BOARD_CREATE_DATE date NOT NULL,
	BOARD_HIT number DEFAULT 0 NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (BOARD_NUMBER)
);


CREATE TABLE CAST_MEMBER
(
	CAST_MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	ACTOR_NUMBER number NOT NULL,
	DIRECTOR_NUMBER number NOT NULL,
	PRIMARY KEY (CAST_MEMBER_NUMBER)
);


CREATE TABLE DIRECTOR
(
	DIRECTOR_NUMBER number NOT NULL,
	DIRECTOR_NAME varchar2(50) NOT NULL,
	PRIMARY KEY (DIRECTOR_NUMBER)
);


CREATE TABLE GENRE
(
	GENRE_NUMBER number NOT NULL,
	GENRE_NAME varchar2(30) NOT NULL,
	PRIMARY KEY (GENRE_NUMBER)
);


CREATE TABLE HEART
(
	HEART_NUMBER number NOT NULL,
	HEART_CHECK varchar2(1) DEFAULT 'N' CHECK(HEART_CHECK='Y' OR HEART_CHECK='N') NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (HEART_NUMBER)
);


CREATE TABLE LINE_REVIEW
(
	LINE_REVIEW_NUMBER number NOT NULL,
	LINE_REVIEW_CONTEXT varchar2(100) NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (LINE_REVIEW_NUMBER)
);


CREATE TABLE MEMBER
(
	MEMBER_NUMBER number NOT NULL,
	MEMBER_ID varchar2(15) NOT NULL,
	MEMBER_PASSWORD varchar2(20) NOT NULL,
	MEMBER_NAME varchar2(50) NOT NULL,
	MEMBER_EMAIL varchar2(30),
	MEMBER_BIRTH_DATE date NOT NULL,
	MEMBER_PHONE_NUBMER varchar2(11) NOT NULL,
    MEMBER_MONEY number DEFAULT 0 NOT NULL,
	MEMBER_GENDER varchar2(1) NOT NULL,
	MEMBER_CREATE_DATE date NOT NULL,
	MEMBER_MODIFY_DATE date NOT NULL,
	PRIMARY KEY (MEMBER_NUMBER)
);


CREATE TABLE MOVIE
(
	MOVIE_NUMBER number NOT NULL,
	MOVIE_TITLE varchar2(50) NOT NULL,
	MOVIE_SUMMARY varchar2(1000) NOT NULL,
	MOVIE_RELEASE_DATE date NOT NULL,
	MOVIE_RUNTIME varchar2(10) NOT NULL,
	MOVIE_PRICE number NOT NULL,
	MOVIE_POSTER varchar2(1000) NOT NULL,
	MOVIE_PREVIEW varchar2(1000) NOT NULL,
	GENRE_NUMBER number NOT NULL,
	PRIMARY KEY (MOVIE_NUMBER)
);


CREATE TABLE ORDER_HISTORY
(
	ORDER_HISTORY_NUMBER number NOT NULL,
	ORDER_HISTORY_TIME date NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (ORDER_HISTORY_NUMBER)
);


CREATE TABLE ORDER_PRODUCT
(
	ORDER_PRODUCT_NUMBER number NOT NULL,
	ORDER_HISTORY_TIME date NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (ORDER_HISTORY_NUMBER)
);


CREATE TABLE POST_COMMENT
(
	POST_COMMENT_NUMBER number NOT NULL,
	POST_COMMENT_CONTENT varchar2(100) NOT NULL,
	POST_COMMENT_DATE date NOT NULL,
	BOARD_NUMBER number NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (POST_COMMENT_NUMBER)
);


CREATE TABLE PREFER_GENRE
(
	PREFER_GENRE_NUMBER number NOT NULL,
	PREFER_GENRE_FIRST varchar2(30) NOT NULL,
	PREFER_GENRE_SECOND varchar2(30) NOT NULL,
	PREFER_GENRE_THIRD varchar2(30) NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (PREFER_GENRE_NUMBER)
);


CREATE TABLE RATING
(
	RATING_NUMBER number NOT NULL,
	RATING_GRADE number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
    MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (RATING_NUMBER)
);


CREATE TABLE WATCH
(
	WATCH_NUMBER number NOT NULL,
	WATCH_CHECK varchar2(1) DEFAULT 'N' CHECK(WATCH_CHECK='Y' OR WATCH_CHECK='N') NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (WATCH_NUMBER)
);



/* Create Foreign Keys */

ALTER TABLE CAST_MEMBER
	ADD FOREIGN KEY (ACTOR_NUMBER)
	REFERENCES ACTOR (ACTOR_NUMBER)
;


ALTER TABLE POST_COMMENT
	ADD FOREIGN KEY (BOARD_NUMBER)
	REFERENCES BOARD (BOARD_NUMBER)
;


ALTER TABLE CAST_MEMBER
	ADD FOREIGN KEY (DIRECTOR_NUMBER)
	REFERENCES DIRECTOR (DIRECTOR_NUMBER)
;


ALTER TABLE MOVIE
	ADD FOREIGN KEY (GENRE_NUMBER)
	REFERENCES GENRE (GENRE_NUMBER)
;


ALTER TABLE BASKET
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE HEART
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE LINE_REVIEW
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE ORDER_HISTORY
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE POST_COMMENT
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE PREFER_GENRE
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE WATCH
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE BASKET
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;


ALTER TABLE CAST_MEMBER
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;


ALTER TABLE HEART
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;


ALTER TABLE LINE_REVIEW
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;


ALTER TABLE ORDER_HISTORY
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;


ALTER TABLE RATING
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;


ALTER TABLE RATING
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
;


ALTER TABLE WATCH
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
;



