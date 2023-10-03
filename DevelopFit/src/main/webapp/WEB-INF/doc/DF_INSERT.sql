SET DEFINE OFF;

INSERT INTO MEMBER
VALUE(  MEMBER_NUMBER,
        MEMBER_ID,
        MEMBER_PASSWORD,
        MEMBER_NAME,
        MEMBER_EMAIL,
        MEMBER_BIRTH_DATE,
        MEMBER_PHONE_NUMBER,
        MEMBER_MONEY,
        MEMBER_GENDER,
        MEMBER_CREATE_DATE,
        MEMBER_MODIFY_DATE)
VALUES(MEMBER_NUMBER_SEQ.NEXTVAL, 'aa', 'aa', '김용원', 'kimj92@ezen.com', '1992-01-30', '01014351668', 1000, 'M', SYSDATE, SYSDATE);
INSERT INTO MEMBER
VALUES(MEMBER_NUMBER_SEQ.NEXTVAL, 'ss', 'ss', '김태윤', 'rudtj22@ezen.com', '1995-08-22', '01014247683', 10000, 'M', SYSDATE, SYSDATE);
INSERT INTO MEMBER
VALUES(MEMBER_NUMBER_SEQ.NEXTVAL, 'dd', 'dd', '이현수', 'seok2256@ezen.com', '1988-05-19', '01089652256', 10000, 'M', SYSDATE, SYSDATE);
INSERT INTO MEMBER
VALUES(MEMBER_NUMBER_SEQ.NEXTVAL, 'ff', 'ff', '이경준', 'lkj98@ezen.com', '1998-11-08', '01089652256', 10000, 'M', SYSDATE, SYSDATE);
INSERT INTO MEMBER
VALUES(MEMBER_NUMBER_SEQ.NEXTVAL, 'admin', 'admin12', '관리자', 'admin@ezen.com', '1900-01-01', '01014247683', 10000, 'M', SYSDATE, SYSDATE);
INSERT ALL 
	into MEMBER(MEMBER_NUMBER,
                MEMBER_ID,
                MEMBER_PASSWORD,
                MEMBER_NAME,
                MEMBER_EMAIL,
                MEMBER_BIRTH_DATE,
                MEMBER_PHONE_NUMBER,
                MEMBER_MONEY,
                MEMBER_GENDER,
                MEMBER_CREATE_DATE,
                MEMBER_MODIFY_DATE) 
    values (MEMBER_NUMBER_SEQ.NEXTVAL, 'lsw0909', 'tjsdn99!@', '이선우', 'lsw0909@ezen.com', '1999-09-09', '01088460576', 0, 'F', SYSDATE, SYSDATE)
	into PREFER_GENRE(
                        PREFER_GENRE_NUMBER, 
                        PREFER_GENRE_FIRST, 
                        PREFER_GENRE_SECOND, 
                        PREFER_GENRE_THIRD, 
                        MEMBER_NUMBER) 
    values (PREFER_GENRE_NUMBER_SEQ.NEXTVAL, '공포', '코미디', '로맨스', MEMBER_NUMBER_SEQ.NEXTVAL)
select * from dual;
SELECT* FROM MEMBER;


INSERT INTO PREFER_GENRE
VALUE(PREFER_GENRE_NUMBER, PREFER_GENRE_FIRST, PREFER_GENRE_SECOND, PREFER_GENRE_THIRD, MEMBER_NUMBER)
VALUES(PREFER_GENRE_NUMBER_SEQ.NEXTVAL, '공포', '코미디', '로맨스', 1);
INSERT INTO PREFER_GENRE
VALUES(PREFER_GENRE_NUMBER_SEQ.NEXTVAL, '미스터리', '멜로', '뮤지컬', 2);
INSERT INTO PREFER_GENRE
VALUES(PREFER_GENRE_NUMBER_SEQ.NEXTVAL, 'SF', '범죄', '스릴러', 3);
INSERT INTO PREFER_GENRE
VALUES(PREFER_GENRE_NUMBER_SEQ.NEXTVAL, '액션', '스포츠', '전쟁', 4);
SELECT* FROM PREFER_GENRE;


INSERT INTO GENRE
VALUE(GENRE_NUMBER, GENRE_NAME)
VALUES(1, 'SF');
INSERT INTO GENRE
VALUES(2, '공포');
INSERT INTO GENRE
VALUES(3, '로맨스');
INSERT INTO GENRE
VALUES(4, '멜로');
INSERT INTO GENRE
VALUES(5, '뮤지컬');
INSERT INTO GENRE
VALUES(6, '범죄');
INSERT INTO GENRE
VALUES(7, '스릴러');
INSERT INTO GENRE
VALUES(8, '스포츠');
INSERT INTO GENRE
VALUES(9, '액션');
INSERT INTO GENRE
VALUES(10, '음악');
INSERT INTO GENRE
VALUES(11, '전쟁');
INSERT INTO GENRE
VALUES(12, '코미디');
INSERT INTO GENRE
VALUES(13, '판타지');
INSERT INTO GENRE
VALUES(14, '미스터리');
INSERT INTO GENRE
VALUES(15, '드라마');
INSERT INTO GENRE
VALUES(16, '애니메이션');
SELECT* FROM GENRE;


INSERT INTO MOVIE
VALUE(MOVIE_NUMBER, MOVIE_TITLE, MOVIE_SUMMARY, MOVIE_RELEASE_DATE, MOVIE_RUNTIME, MOVIE_PRICE, MOVIE_PREVIEW, MOVIE_RATING, MOVIE_MAIN_POSTER, GENRE_NUMBER)
VALUES(MOVIE_NUMBER_SEQ.NEXTVAL, '잠', '행복한 신혼부부 ‘현수’(이선균)와 ‘수진’(정유미). 어느 날, 옆에 잠든 남편 ‘현수’가 이상한 말을 중얼거린다.', '2023-09-06', 94, 10000, 'https://www.youtube.com/embed/aRxQDCXnfOc', '15세 관람가', 'https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230906_145%2F1693965381891wjuK6_JPEG%2Fmovie_image.jpg', 14);
INSERT INTO MOVIE
VALUES(MOVIE_NUMBER_SEQ.NEXTVAL, '콘크리트 유토피아', '“아파트는 주민의 것” 온 세상을 집어삼킨 대지진, 그리고 하루아침에 폐허가 된 서울. 모든 것이 무너졌지만 오직 황궁 아파트만은 그대로다.', '2023-08-09', 130, 10000, 'https://www.youtube.com/embed/hAO9a1xSo3M?si=QmCb2R7glajd4FGK', '15세 관람가', 'https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230809_114%2F1691559109714F3JPy_JPEG%2Fmovie_image.jpg', 15);
INSERT INTO MOVIE
VALUES(MOVIE_NUMBER_SEQ.NEXTVAL, '엘리멘탈', '불, 물, 공기, 흙 4개의 원소들이 살고 있는 ‘엘리멘트 시티’ 재치 있고 불처럼 열정 넘치는 ‘앰버’', '2023-06-14', 109, 11000, 'https://www.youtube.com/embed/BOqFRHCrN-k?si=PlibcbCbekEBTlBw', '전체 관람가', 'https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230526_154%2F1685060493223yFUCL_JPEG%2Fmovie_image.jpg', 16);
INSERT INTO MOVIE
VALUES(MOVIE_NUMBER_SEQ.NEXTVAL, '타겟', '중고거래로 범죄의 표적이 된 ‘수현’의 일상 속에서 벌어지는 서스펜스를 담은 스릴러', '2023-08-30', 101, 8000, 'https://www.youtube.com/embed/KAALefFwomw', '12세 관람가', 'https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230830_155%2F1693380545549R60c7_JPEG%2Fmovie_image.jpg', 15);
SELECT* FROM MOVIE;

INSERT INTO MOVIE_POSTER
VALUE(MOVIE_POSTER_NUMBER, MOVIE_POSTER_ADDRESS, MOVIE_NUMBER)
VALUES(MOVIE_POSTER_NUMBER_SEQ.NEXTVAL, 'https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230906_44%2F1693966006262nOEWF_JPEG%2Fmovie_image.jpg', 1);

INSERT INTO MOVIE_STILLCUT
VALUE(MOVIE_STILLCUT_NUMBER, MOVIE_STILLCUT_ADDRESS, MOVIE_NUMBER)
VALUES(MOVIE_STILLCUT_NUMBER_SEQ.NEXTVAL, 'https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230809_79%2F1691557475368w6n1s_JPEG%2Fmovie_image.jpg', 1);

-- 게시판 내용 108개----------------------------------------------------------
DECLARE
NUM1 NUMBER :=1;
BEGIN
    LOOP
    INSERT INTO BOARD
    VALUE(BOARD_NUMBER, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_HIT, MEMBER_NUMBER)
    VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '아 집가고싶다', '집에 가고싶은데 팀플 해야해', sysdate, 14, 1);
    INSERT INTO BOARD
    VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '제목 추천 좀', '안녕하세요. 새로 가입했습니다^^', sysdate, 10, 2);
    INSERT INTO BOARD
    VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '점메추', '오늘 점심 추천 받는다', sysdate, 12, 1);
    INSERT INTO BOARD
    VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '등업 신청합니다', 'ㅈㄱㄴ', sysdate, 3, 1);
    INSERT INTO BOARD
    VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '안녕하세요', '브라이튼여의도아파트 [브라이튼 여의도 아파트 vip 안내]', sysdate, 5, 3);
    INSERT INTO BOARD
    VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '무비럽웅', '2023년 36주차 박스 오피스는 정유미, 이선균 주연의 미스터리 공포 영화 <잠>이 차지했다.', sysdate, 5, 2);
    NUM1 := NUM1+1; --NUM = NUM +1
    EXIT WHEN NUM1 >18; --NUM1이 10보다 크면 LOOP종료
    END LOOP;
END;
/
--INSERT INTO BOARD
--VALUE(BOARD_NUMBER, BOARD_TITLE, BOARD_CONTENT, BOARD_CREATE_DATE, BOARD_HIT, MEMBER_NUMBER)
--VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '아 집가고싶다', '집에 가고싶은데 팀플 해야해', sysdate, 14, 1);
--INSERT INTO BOARD
--VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '제목 추천 좀', '안녕하세요. 새로 가입했습니다^^', sysdate, 10, 2);
--INSERT INTO BOARD
--VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '점메추', '오늘 점심 추천 받는다', sysdate, 12, 1);
--INSERT INTO BOARD
--VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '등업 신청합니다', 'ㅈㄱㄴ', sysdate, 3, 1);
--INSERT INTO BOARD
--VALUES(BOARD_NUMBER_SEQ.NEXTVAL, '안녕하세요', '브라이튼여의도아파트 [브라이튼 여의도 아파트 vip 안내]', sysdate, 5, 3);
SELECT* FROM BOARD;


INSERT INTO HEART
VALUE(HEART_NUMBER, HEART_CHECK, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'N', 1, 1);
INSERT INTO HEART
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'N', 2, 2);
INSERT INTO HEART
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'Y', 3, 2);
INSERT INTO HEART
VALUES(HEART_NUMBER_SEQ.NEXTVAL, 'Y', 4, 4);
SELECT* FROM HEART;


INSERT INTO WATCH
VALUE(WATCH_NUMBER, WATCH_CHECK, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'N', 1, 1);
INSERT INTO WATCH
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'Y', 2, 2);
INSERT INTO WATCH
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'N', 2, 2);
INSERT INTO WATCH
VALUES(WATCH_NUMBER_SEQ.NEXTVAL, 'N', 2, 3);
SELECT* FROM WATCH;


INSERT INTO POST_COMMENT
VALUE(POST_COMMENT_NUMBER, POST_COMMENT_CONTENT, POST_COMMENT_DATE, BOARD_NUMBER, MEMBER_NUMBER)
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '나도..', SYSDATE, 1, 2);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '반갑습니다~!!', '2023-09-01', 2, 3);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '국밥 ㄱㄱ', '2023-09-03', 3, 1);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '칼국수 어떰?', '2023-09-10', 3, 3);
INSERT INTO POST_COMMENT
VALUES(POST_COMMENT_NUMBER_SEQ.NEXTVAL, '광고 신고함', SYSDATE, 5, 4);
SELECT* FROM POST_COMMENT;


INSERT INTO ACTOR
VALUE(ACTOR_NUMBER, ACTOR_NAME)
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '박보영');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '이병헌');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '박서준');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '김선영');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '김도윤');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '박지후');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '정유미');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '이선균');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '레아 루이스');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '마무두 아티');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '신혜선');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '김성균');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '임철수');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '이주영');
INSERT INTO ACTOR
VALUES(ACTOR_NUMBER_SEQ.NEXTVAL, '강태오');
SELECT* FROM ACTOR;


INSERT INTO DIRECTOR
VALUE(DIRECTOR_NUMBER, DIRECTOR_NAME, MOVIE_NUMBER)
VALUES(DIRECTOR_NUMBER_SEQ.NEXTVAL, '유재선', 1);
INSERT INTO DIRECTOR
VALUES(DIRECTOR_NUMBER_SEQ.NEXTVAL, '엄태화', 2);
INSERT INTO DIRECTOR
VALUES(DIRECTOR_NUMBER_SEQ.NEXTVAL, '피터손', 3);
INSERT INTO DIRECTOR
VALUES(DIRECTOR_NUMBER_SEQ.NEXTVAL, '박희곤', 4);
SELECT* FROM DIRECTOR;


INSERT INTO CAST_MEMBER
VALUE(CAST_MEMBER_NUMBER, MOVIE_NUMBER, ACTOR_NUMBER)
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 1, 7);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 1, 8);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 2, 1);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 2, 2);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 2, 3);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 2, 4);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 2, 5);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 2, 6);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 3, 9);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 3, 10);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 4, 1);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 4, 2);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 4, 3);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 4, 4);
INSERT INTO CAST_MEMBER
VALUES(CAST_MEMBER_NUMBER_SEQ.NEXTVAL, 4, 5);
SELECT* FROM CAST_MEMBER;


INSERT INTO RATING
VALUE(RATING_NUMBER, RATING_GRADE, MOVIE_NUMBER, MEMBER_NUMBER)
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 3.5, 1, 1);
INSERT INTO RATING
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 4, 1, 2);
INSERT INTO RATING
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 3, 2, 2);
INSERT INTO RATING
VALUES(RATING_NUMBER_SEQ.NEXTVAL, 3.8, 3, 3);
SELECT* FROM RATING;


INSERT INTO LINE_REVIEW
VALUE(LINE_REVIEW_NUMBER, LINE_REVIEW_CONTEXT, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '재밌음', 1, 1);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '좀 무서웠어요', 2, 1);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '추천안함 시간낭비임;;', 2, 2);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '킬링 타임용 영화', 4, 3);
INSERT INTO LINE_REVIEW
VALUES(LINE_REVIEW_NUMBER_SEQ.NEXTVAL, '별로..', 3, 4);
SELECT* FROM LINE_REVIEW;


INSERT INTO BASKET
VALUE(BASKET_NO, MEMBER_NUMBER, MOVIE_NUMBER)
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 1, 1);
INSERT INTO BASKET
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 1, 2);
INSERT INTO BASKET
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 2, 3);
INSERT INTO BASKET
VALUES(BASKET_NUMBER_SEQ.NEXTVAL, 3, 4);
SELECT* FROM BASKET;

-- 주문 내역
INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(33, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 33, 4);
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 33, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(34, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 34, 4);
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 34, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(35, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 35, 3);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(36, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 36, 1);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(37, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 37, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(38, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 38, 3);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(39, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 39, 4);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(40, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 40, 4);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(41, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 41, 3);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(42, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 42, 2);

INSERT INTO ORDER_HISTORY
VALUE(ORDER_HISTORY_NUMBER, ORDER_HISTORY_TIME, ORDER_HISTORY_STATE, MEMBER_NUMBER)
VALUES(43, '2023-09-22', 'Y', 1);
-- 해당 주문 내역의 상품 정보
INSERT INTO ORDER_PRODUCT
VALUE(ORDER_PRODUCT_NUMBER, ORDER_HISTORY_NUMBER, MOVIE_NUMBER)
VALUES(ORDER_PRODUCT_NUMBER_SEQ.NEXTVAL, 43, 1);

COMMIT;