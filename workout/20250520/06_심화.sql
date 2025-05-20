USE sqldb;

SELECT * FROM usertbl;
SHOW INDEX FROM usertbl;
# SHOW DATA STATUS LIKE 'usertbl';
SHOW TABLE STATUS LIKE 'usertbl';


CREATE INDEX idx_usertbl_addr ON usertbl(addr);

SHOW INDEX FROM usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

ANALYZE TABLE usertbl;
SHOW TABLE STATUS LIKE 'usertbl';

CREATE UNIQUE INDEX idx_usertbl_birthYear ON usertbl(birthYear);
CREATE UNIQUE INDEX idx_usertbl_name ON usertbl(name);
SHOW INDEX FROM usertbl;

DROP INDEX idx_usertbl_name ON usertbl;
CREATE UNIQUE INDEX idx_usertbl_name_birthYear ON usertbl(name, birthYear);
SHOW INDEX FROM usertbl;

DROP INDEX idx_usertbl_birthYear ON usertbl;
DROP INDEX idx_usertbl_name_birthYear ON usertbl;
SHOW INDEX FROM usertbl;






-- 모든 호스트에서 접속 가능한 사용자 scoula 생성
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

-- scoula계정에 scoula_db 모든 권한 부여
GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%';
-- scoula 계정에 sqldb 모든 권한 부여
GRANT ALL PRIVILEGES ON sqldb.* TO 'scoula'@'%';
-- 권한 적용
FLUSH PRIVILEGES;

SELECT *
FROM sqldb.buytbl;

SELECT *
FROM employees.employees;
