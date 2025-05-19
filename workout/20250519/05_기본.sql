DROP DATABASE IF EXISTS tabledb;
CREATE DATABASE tabledb;

USE tabledb;

CREATE TABLE usertbl
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         NOT NULL,
    addr      CHAR(2)     NOT NULL,
    mobile1   CHAR(3)     NULL,
    mobile2   CHAR(8)     NULL,
    height    SMALLINT    NULL,
    mDate     DATE        NULL
);

CREATE TABLE buytbl
(
    num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userid    CHAR(8)            NOT NULL,
    prodName  CHAR(6)            NOT NULL,
    groupName CHAR(4)            NULL,
    price     INT                NOT NULL,
    amount    SMALLINT           NOT NULL,
    FOREIGN KEY (userid) REFERENCES usertbl (userID)
);

INSERT INTO usertbl
VALUES ('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl
VALUES ('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl
VALUES ('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

INSERT INTO buytbl
VALUES (NULL, 'KBS', '운동화', NULL, 30, 2),
       (NULL, 'KBS', '노트북', '전자', 1000, 1);
#     (NULL, 'JYP', "모니터", '전자', 200, 1);
# 컬럼의 개수가 맞지 않고 usertbl에 JYP가 존재하지 않기 때문에 오류가 발생한다.

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl
(
    userID    CHAR(8)     NOT NULL,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         NOT NULL,
    CONSTRAINT PRIMARY KEY PK_userTBL(userID)
);

DROP TABLE IF EXISTS prodtbl;
CREATE TABLE prodtbl(
    prodCode CHAR(3) NOT NULL ,
    prodId CHAR(4) NOT NULL ,
    prodDate DATETIME NOT NULL ,
    proCur CHAR(10) NULL ,
    PRIMARY KEY (prodCode, prodId)
);

CREATE VIEW user_buy_tbl AS
    SELECT
        a.userID,
        a.name,
        b.prodName,
        a.addr,
        concat(a.mobile1, a.mobile2) as "연락처"
    FROM
        usertbl a
        JOIN
        buytbl b on a.userID = b.userid;

SELECT * FROM user_buy_tbl
WHERE user_buy_tbl.name LIKE "김범수";