DROP DATABASE tabledb;
CREATE DATABASE tabledb;
USE tabledb;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID CHAR(8) NOT NULL PRIMARY KEY ,
    name VARCHAR(10) NOT NULL,
    birthYear  INT CHECK  (birthYear >= 1900 AND birthYear <= 2023),
    addr CHAR(2) NOT NULL ,
    mobile1 CHAR(3) NULL,
    mobile2 CHAR(8) NULL,
    height SMALLINT NULL DEFAULT 170,
    mDate DATE NULL
);

DROP TABLE IF EXISTS buytbl;

CREATE TABLE buytbl(
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    userid CHAR(8) NOT NULL ,
    prodName CHAR(6) NOT NULL ,
    groupName CHAR(4) NULL ,
    price INT NOT NULL ,
    amount SMALLINT NOT NULL ,
    FOREIGN KEY (userid) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

SELECT * FROM usertbl;

-- 구매 테이블 샘플 데이터
INSERT INTO buytbl
    VALUES
        (NULL, 'KBS', '운동화', NULL, 30, 2),
        (NULL, 'KBS', '노트북', '전자', 1000, 1);

SELECT * FROM buytbl;




USE tabledb;

-- v_usertbl 뷰가 있다면 삭제
DROP VIEW IF EXISTS v_usertbl;

-- v_usertbl 뷰 생성
CREATE VIEW v_usertbl
AS
SELECT
    userid,
    name,
    addr
FROM
    usertbl;

SELECT * FROM v_usertbl;-- 뷰를 테이블이라고 생각해도 무방


-- v_userbuytbl 뷰가 있다면 삭제
DROP VIEW IF EXISTS v_userbuytbl;

-- v_userbuytbl 뷰 생성
CREATE VIEW v_userbuytbl
AS
SELECT
    U.userid,
    U.name,
    B.prodName,
    U.addr,
    CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM
    usertbl U
        INNER JOIN
    buytbl B ON U.userid = B.userid;

SELECT *
FROM
    v_userbuytbl
WHERE
    name = '김범수';



USE tabledb;

-- 현재 시스템 변수 'innodb_file_per_table' 설정 확인
SHOW VARIABLES LIKE 'innodb_file_per_table';

-- 'innodb_file_per_table' ON으로 변경
-- ON : 각 innodb 테이블이 자체 테이블스페이스에 저장됨
-- OFF : 모든 innodb 테이블 데이터가 시스템 테이블스페이스에 저장됨
SET GLOBAL innodb_file_per_table = ON;

-- 테이블스페이스 생성
CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

-- 테이블 생성 시 테이블스페이스 지정
CREATE TABLE table_a (id INT) TABLESPACE ts_a;

-- 기존 테이블의 테이블스페이스 변경
CREATE TABLE table_b (id INT);
ALTER TABLE table_b TABLESPACE ts_b;

-- 대용량 테이블 복사 후 테이블 스페이스 지정하기
CREATE TABLE table_c (SELECT * FROM employees.salaries);
ALTER TABLE table_c TABLESPACE ts_c;


