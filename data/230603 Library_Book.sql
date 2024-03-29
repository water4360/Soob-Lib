--BOOKLIST 관련

CREATE TABLE BOOKLIST (
    NO VARCHAR(10) PRIMARY KEY
    , TITLE VARCHAR(100) NOT NULL
    , AUTHOR VARCHAR(50) NOT NULL
    , PUBLISHER VARCHAR(50)
    , STATUS NUMBER(5) DEFAULT 1
    , POP NUMBER(5) DEFAULT 0
);

SELECT * FROM BOOKLIST;
COMMIT;

UPDATE BOOKLIST SET STATUS='1';
ROLLBACK;

ALTER TABLE BOOKLIST ADD STATUS NUMBER(5) DEFAULT 1;

ALTER TABLE BOOKLIST ADD POP NUMBER(5) DEFAULT 0;

UPDATE BOOKLIST SET STATUS = '0' WHERE AUTHOR = '김초엽';







SELECT INSTR((NO || TITLE || AUTHOR || PUBLISHER), '우리가') AS SEARCH_BOOK,
NO, TITLE, AUTHOR, PUBLISHER, STATUS, POP FROM BOOKLIST 
WHERE INSTR((NO || TITLE || AUTHOR || PUBLISHER), '우리가') != 0 
ORDER BY NO; 


SELECT INSTR((NO || TITLE || AUTHOR || PUBLISHER), 'a머머') AS SEARCH_BOOK, 
NO, TITLE, AUTHOR, PUBLISHER FROM BOOKLIST ORDER BY NO;





DELETE BOOKLIST WHERE TITLE = '1111';
DELETE BOOKLIST WHERE TITLE = '2222';
DELETE BOOKLIST WHERE NO = '5555';

--데이터 등록
INSERT INTO BOOKLIST(NO, TITLE, AUTHOR, PUBLISHER)
            VALUES(230008, '여기에도 저기에도', '세상의 천재', '그레이출판');


UPDATE BOOKLIST SET STATUS = '1';

SELECT NO, TITLE, AUTHOR, PUBLISHER, STATUS FROM BOOKLIST;

CREATE SEQUENCE SEQ_BOOKLIST_NO START WITH 230001 NOCACHE;

COMMIT;

--절대 엄금
--DROP TABLE BOOKLIST;

INSERT INTO BOOKLIST(NO, TITLE, AUTHOR, PUBLISHER, STOCK)
            VALUES(SEQ_BOOKLIST_NO.NEXTVAL, ?, ?, ?, ?) ;

CREATE SEQUENCE SEQ_BOOKLIST_NO START WITH 230001 NOCACHE;

DROP SEQUENCE SEQ_BOOKLIST_NO;

--외래키 특강
--특정 회원이 도서를 대출했는지 알려면?
--CREATE TABLE T_차량등록 (
--    NO NUMBER(5) PRIMARY KEY
--    , CAR_ID
--    , CAR_MODEL
--    , APT_NO NUMBER(5)
--    CONSTRAINT FK_APT_NO
--    FOREIGN KEY(APT_NO)
--    REFERENCES T_입주민정보(NO)
--);


SELECT * FROM BOOKLIST ORDER BY NO;
SELECT NO, PUBLISHER, AUTHOR, TITLE, STOCK FROM BOOKLIST;

SELECT * FROM BOOKLIST WHERE NO = 230022;

INSERT INTO BOOKLIST(NO, TITLE, AUTHOR, PUBLISHER, STOCK)
            VALUES(SEQ_BOOKLIST_NO.NEXTVAL, '어떤 책이 가장 읽기 좋을까?', '김작가', '민음사', 2);
            
DELETE FROM BOOKLIST WHERE NO = 230001;

UPDATE BOOKLIST SET TITLE = '웜스10000' WHERE NO = 230007;

ROLLBACK;
            
--TITLE컬럼에서 '빛의'라는 문자를 포함한 결과를 찾으면(!=0)
SELECT * FROM BOOKLIST WHERE INSTR(TITLE, '빛의') != 0;

UPDATE BOOKLIST SET STATUS = 'true';

SELECT * FROM BOOKLIST;

UPDATE BOOKLIST SET STATUS = 5 WHERE NO = ? ;