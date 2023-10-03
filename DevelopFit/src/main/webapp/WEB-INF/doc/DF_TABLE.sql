
/* Drop Tables */

DROP TABLE CAST_MEMBER CASCADE CONSTRAINTS;
DROP TABLE ACTOR CASCADE CONSTRAINTS;
DROP TABLE BASKET CASCADE CONSTRAINTS;
DROP TABLE POST_COMMENT CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE DIRECTOR CASCADE CONSTRAINTS;
DROP TABLE HEART CASCADE CONSTRAINTS;
DROP TABLE LINE_REVIEW CASCADE CONSTRAINTS;
DROP TABLE MOVIE_POSTER CASCADE CONSTRAINTS;
DROP TABLE MOVIE_STILLCUT CASCADE CONSTRAINTS;
DROP TABLE ORDER_PRODUCT CASCADE CONSTRAINTS;
DROP TABLE RATING CASCADE CONSTRAINTS;
DROP TABLE WATCH CASCADE CONSTRAINTS;
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE GENRE CASCADE CONSTRAINTS;
DROP TABLE ORDER_HISTORY CASCADE CONSTRAINTS;
DROP TABLE PREFER_GENRE CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;




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
	BOARD_CONTENT varchar2(3000) NOT NULL,
	BOARD_CREATE_DATE date NOT NULL,
	BOARD_HIT number default 0 NOT NULL,
	MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (BOARD_NUMBER)
);


CREATE TABLE CAST_MEMBER
(
	CAST_MEMBER_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	ACTOR_NUMBER number NOT NULL,
	PRIMARY KEY (CAST_MEMBER_NUMBER)
);


CREATE TABLE DIRECTOR
(
	DIRECTOR_NUMBER number NOT NULL,
	DIRECTOR_NAME varchar2(50) NOT NULL,
	MOVIE_NUMBER number NOT NULL,
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
	HEART_CHECK varchar2(1) DEFAULT 'N' CHECK (HEART_CHECK = 'Y' OR HEART_CHECK = 'N') NOT NULL,
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
	MEMBER_PHONE_NUMBER varchar2(11) NOT NULL,
	MEMBER_MONEY number default 0 NOT NULL,
	MEMBER_GENDER varchar2(1) CHECK (MEMBER_GENDER = 'M' OR MEMBER_GENDER = 'F') NOT NULL,
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
	MOVIE_PREVIEW varchar2(1000) NOT NULL,
	MOVIE_RATING varchar2(30),
	MOVIE_MAIN_POSTER varchar2(200),
	GENRE_NUMBER number NOT NULL,
	PRIMARY KEY (MOVIE_NUMBER)
);


CREATE TABLE MOVIE_POSTER
(
	MOVIE_POSTER_NUMBER number NOT NULL,
	MOVIE_POSTER_ADDRESS varchar2(200),
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (MOVIE_POSTER_NUMBER)
);


CREATE TABLE MOVIE_STILLCUT
(
	MOVIE_STILLCUT_NUMBER number NOT NULL,
	MOVIE_STILLCUT_ADDRESS varchar2(200),
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (MOVIE_STILLCUT_NUMBER)
);


CREATE TABLE ORDER_HISTORY
(
	ORDER_HISTORY_NUMBER number NOT NULL,
	ORDER_HISTORY_TIME date NOT NULL,
    ORDER_HISTORY_STATE varchar2(1) CHECK (ORDER_HISTORY_STATE = 'Y' OR ORDER_HISTORY_STATE = 'R' OR ORDER_HISTORY_STATE = 'N') NOT NULL, -- Y: 구매확정 R: 환불확정 N: 환불가능
	MEMBER_NUMBER number NOT NULL,
	PRIMARY KEY (ORDER_HISTORY_NUMBER)
);


CREATE TABLE ORDER_PRODUCT
(
	ORDER_PRODUCT_NUMBER number NOT NULL,
	ORDER_HISTORY_NUMBER number NOT NULL,
	MOVIE_NUMBER number NOT NULL,
	PRIMARY KEY (ORDER_PRODUCT_NUMBER)
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
	PREFER_GENRE_FIRST varchar2(30),
	PREFER_GENRE_SECOND varchar2(30),
	PREFER_GENRE_THIRD varchar2(30),
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
	WATCH_CHECK varchar2(1) DEFAULT 'N' CHECK (WATCH_CHECK = 'Y' OR WATCH_CHECK = 'N') NOT NULL,
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


ALTER TABLE MOVIE
	ADD FOREIGN KEY (GENRE_NUMBER)
	REFERENCES GENRE (GENRE_NUMBER)
;


ALTER TABLE BASKET
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE HEART
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE LINE_REVIEW
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE ORDER_HISTORY
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE POST_COMMENT
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE PREFER_GENRE
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE RATING
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE WATCH
	ADD FOREIGN KEY (MEMBER_NUMBER)
	REFERENCES MEMBER (MEMBER_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE BASKET
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE CAST_MEMBER
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE DIRECTOR
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE HEART
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE LINE_REVIEW
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE MOVIE_POSTER
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE MOVIE_STILLCUT
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE ORDER_PRODUCT
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE RATING
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE WATCH
	ADD FOREIGN KEY (MOVIE_NUMBER)
	REFERENCES MOVIE (MOVIE_NUMBER)
    ON DELETE CASCADE
;


ALTER TABLE ORDER_PRODUCT
	ADD FOREIGN KEY (ORDER_HISTORY_NUMBER)
	REFERENCES ORDER_HISTORY (ORDER_HISTORY_NUMBER)
;



