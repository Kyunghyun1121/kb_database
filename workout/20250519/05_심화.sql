USE tabledb;
DROP TABLE IF EXISTS userTBL;

CREATE TABLE userTBL
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         NOT NULL
);

DROP TABLE IF EXISTS buyTBL;
CREATE TABLE buyTBL
(
    num      INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID   CHAR(8)            NOT NULL,
    prodName CHAR(6)            NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTBL (userID)
);

DROP TABLE IF EXISTS buyTBL;
DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         NOT NULL,
    email     CHAR(30)    NULL UNIQUE
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE userTBL
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         CHECK ( 1900 <= birthYear  AND 2023 >= birthYear),
    email     CHAR(30)    NULL UNIQUE
);

DROP TABLE IF EXISTS userTBL;
CREATE TABLE usertbl
(
    userID    CHAR(8)     NOT NULL PRIMARY KEY,
    name      VARCHAR(10) NOT NULL,
    birthYear INT         NOT NULL DEFAULT -1,
    addr      CHAR(2)     NOT NULL DEFAULT "서울",
    mobile1   CHAR(3)     NULL,
    mobile2   CHAR(8)     NULL,
    height    SMALLINT    NULL DEFAULT 170,
    mDate     DATE        NULL
);

INSERT INTO usertbl
    VALUES ('LSG', '이승기', 1987, '서울', '011', '1111111', default, '2008-8-8');
SELECT * FROM usertbl;

ALTER TABLE usertbl
    DROP COLUMN mobile1;

ALTER TABLE usertbl
    CHANGE COLUMN name uName
    VARCHAR(20) NULL;

ALTER TABLE usertbl
    DROP PRIMARY KEY;



USE employees;

DROP VIEW EMPLOYEES_INFO;
CREATE VIEW EMPLOYEES_INFO AS
    SELECT
        e.emp_no,
        e.birth_date,
        e.first_name,
        e.last_name,
        e.gender,
        e.hire_date,
        t.title,
        t.from_date as t_from,
        t.to_date as t_to,
        s.salary,
        s.from_date as s_from,
        s.to_date as s_to
    FROM employees as e
        JOIN titles as t ON e.emp_no = t.emp_no
        JOIN salaries as s ON e.emp_no = s.emp_no;

SELECT *
FROM EMPLOYEES_INFO
WHERE YEAR(t_to) = 9999 and
      YEAR(s_to) = 9999;

SELECT * FROM dept_emp;

DROP VIEW EMP_DEPT_INFO;
CREATE VIEW EMP_DEPT_INFO
AS
    SELECT
        de.emp_no,
        de.dept_no,
        d.dept_name,
        de.from_date,
        de.to_date
    FROM
        dept_emp as de
        left JOIN
        departments as d on d.dept_no = de.dept_no;

SELECT *
FROM EMP_DEPT_INFO
WHERE YEAR(to_date) = 9999;