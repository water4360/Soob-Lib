--
CREATE TABLE MEMBER (
            MEM_NO          NUMBER(6)   NOT NULL
          , MEM_CODE        NUMBER(1)   DEFAULT 1
          , ID              VARCHAR(20) PRIMARY KEY
          , PW              VARCHAR(20) NOT NULL
          , NAME            VARCHAR(27)  NOT NULL
          , PHONE           VARCHAR(11) NOT NULL
          , EMAIL           VARCHAR(100) NOT NULL
          , REG_DATE        DATE DEFAULT SYSDATE NOT NULL
);

ALTER TABLE MEMBER MODIFY NAME VARCHAR(100);

ALTER TABLE MEMBER ADD CONSTRAINT UQ_MEMBER_ID UNIQUE (ID);



-- 기존의 PRIMARY KEY 제약조건 삭제
SELECT CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'MEMBER' AND CONSTRAINT_TYPE = 'P';


ALTER TABLE MEMBER
DROP CONSTRAINT UQ_MEMBER_ID;


-- ID 열을 PRIMARY KEY로 지정
ALTER TABLE MEMBER
ADD CONSTRAINT PK_MEMBER PRIMARY KEY (ID);

--조심
--DROP TABLE MEMBER;

--테이블 확인
SELECT * FROM MEMBER ORDER BY MEM_NO ;
COMMIT;
ROLLBACK;

SELECT ID, PW FROM MEMBER WHERE ID ='test' AND PHONE='0319996666';

--REG_DATE 추가, DATE 타입, 기본설정은 현재날짜, NULL 안됨
ALTER TABLE MEMBER ADD (REG_DATE DATE DEFAULT SYSDATE NOT NULL);

ALTER TABLE MEMBER DROP COLUMN REG_DATE;

CREATE SEQUENCE SEQ_MEMBER_NO START WITH 000001 NOCACHE;

UPDATE MEMBER SET EMAIL = 'hari1004@naver.com' WHERE ID = 'hari1004';

ALTER TABLE MEMBER ADD EMAIL VARCHAR(255);

DELETE MEMBER WHERE NAME = 'asdf';

UPDATE MEMBER SET ID = 'admin' WHERE NAME = '관리자';

INSERT INTO MEMBER(MEM_NO, MEM_CODE, ID, PW, NAME, PHONE, EMAIL)
            VALUES(000000, 9, 'test', '1111', '정어드민', '0319996666', 'admin@library-soob.com');
INSERT INTO MEMBER(MEM_NO, ID, PW, NAME, PHONE, EMAIL)
            VALUES(SEQ_MEMBER_NO.NEXTVAL, 'test2', '2222', '김회원', '01044445555', 'user@library-soob.com');


INSERT INTO MEMBER(MEM_NO, ID, PW, NAME, PHONE, RENTAL_STATUS, RENTAL_NO)
            VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?) ;
            
INSERT INTO MEMBER(MEM_NO, ID, PW, NAME, PHONE)
            VALUES(SEQ_MEMBER_NO.NEXTVAL, 'hari1004', '1004', '이하리', '01010041004') ;




SELECT ID, NAME, RENTAL_STATUS, RENTAL_NO FROM MEMBER WHERE ID = 'test';

UPDATE MEMBER SET RENTAL_STATUS = 'Y', RENTAL_NO = '00000' WHERE ID = 'test' ;

ROLLBACK;

DELETE MEMBER WHERE NAME = '숩';

CREATE SEQUENCE SEQ_MEMBER_NO START WITH 1001 NOCACHE;

DROP SEQUENCE SEQ_MEMBER_NO;

SELECT INSTR(ID, 'admin'), ID FROM MEMBER;

SELECT * FROM MEMBER WHERE ID = 'test' AND PW = '0000' ;

SELECT ID, PW, MEM_CODE FROM MEMBER WHERE ID = 'ADMIN' AND PW = '9999';

UPDATE MEMBER SET MEM_CODE = 9 WHERE ID = 'ADMIN';