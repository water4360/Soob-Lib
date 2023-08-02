CREATE SEQUENCE SEQ_L_REPLY_NO NOCACHE;

DESCRIBE L_REPLY;

SELECT * FROM L_REPLY;
SELECT * FROM L_BOARD;


--게시글 제목[댓글수]  
SELECT NO, TITLE, WRITER, CONTENT, P_REG_DATE regDate
    , ( SELECT COUNT(*)
        FROM L_REPLY
        WHERE NO = B.NO) replyCnt
    FROM L_BOARD B
    ORDER BY NO DESC;

    
INSERT INTO T_REPLY(NO, BOARD_NO, CONTENT, WRITER) 
    VALUES(SEQ_REPLY_NO.NEXTVAL, 23, '테스트 댓글2', 'guest');
COMMIT;



CREATE TABLE L_BOARD(
    NO NUMBER(5)PRIMARY KEY --UNIQUE + NOT NULL
    , WRITER VARCHAR2(30) NOT NULL
    , TITLE VARCHAR2(200) NOT NULL
    , CONTENT CLOB NOT NULL
    , REG_DATE DATE DEFAULT SYSDATE
    , HIT NUMBER(5) DEFAULT 0
    , REF NUMBER(1) DEFAULT 0 --원글
    , LEV NUMBER(1) DEFAULT 0 --원글의 답글/답글의 답글...
    , STEP NUMBER(2) DEFAULT 0 --답글의 순서
);
--DROP TABLE L_BOARD;
SELECT * FROM L_BOARD;
COMMIT;
ROLLBACK;

ALTER TABLE L_BOARD ADD (REF NUMBER(1) DEFAULT 0, LEV NUMBER(1) DEFAULT 0, STEP NUMBER(2) DEFAULT 0);



CREATE SEQUENCE SEQ_L_BOARD_NO NOCACHE;
DROP SEQUENCE SEQ_L_BOARD_NO;

INSERT INTO T_REPLY(NO, BOARD_NO, CONTENT, WRITER) 
    VALUES(SEQ_REPLY_NO.NEXTVAL, 23, '테스트 댓글2', 'guest');
    
INSERT INTO L_BOARD(NO, WRITER, TITLE, CONTENT, REG_DATE) 
    VALUES(SEQ_L_BOARD_NO.NEXTVAL, 'admin', '정기 독서토론', '이번달 정기 독서토론은 4/24(월) 숲 도서관 2층 카페라운지에서 진행합니다 :)', '23/04/22');
    
INSERT INTO L_BOARD(NO, WRITER, TITLE, CONTENT, REG_DATE) 
    VALUES(SEQ_L_BOARD_NO.NEXTVAL, 'admin', '정식오픈도 연기안내', '프로그램 개발이 연기되면서 도서관 정식오픈도 연기되는 중입니다 :D', '23/04/23');
    
INSERT INTO L_BOARD(NO, WRITER, TITLE, CONTENT, REG_DATE) 
    VALUES(SEQ_L_BOARD_NO.NEXTVAL, 'admin', '신규입고', '어린이날을 맞이해서 맛있는 책을 신규입고하였습니다 :)', '23/05/02');