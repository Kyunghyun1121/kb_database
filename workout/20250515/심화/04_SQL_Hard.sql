USE sqldb;

# 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/
# 동아리방을 출력하세요.
SELECT
    s.stdName as "학생 이름",
    s.addr as "지역",
    sc.clubName as "가입한 동아리",
    c.roomNo as "동아리방"
FROM
    stdtbl as s
    left join
    stdclubtbl as sc
      on
    s.stdName = sc.stdName
    left join clubtbl as c
    on sc.clubName = c.clubName;

# 동아리를 기준으로 가입한 학생의 목록을 출력하세요.
SELECT
    sc.clubName,
    c.roomNo,
    s.stdName,
    s.addr
FROM
    stdtbl as s
        join
    stdclubtbl as sc
    on
        s.stdName = sc.stdName
        right join clubtbl as c
             on sc.clubName = c.clubName;

# 앞에서 추가한 테이블에서 '우대리'의 상관 연락처 정보를 확인하세요.
SELECT
    a.emp as "부하직원",
    b.emp as "직속상관",
    b.empTel as "직속상관연락처"
FROM
    emptbl as a
    join
    emptbl as b
WHERE
    a.manager = b.emp
    and
    a.emp like "우대리";

# 모든 문제는 employees 데이터베이스에서 수행한다.
USE employees;

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    t.title
FROM employees as e
    join
    titles as t
    on e.emp_no = t.emp_no
WHERE
    year(t.to_date) = 9999;


# 현재 재직 중인 직원 정보를 출력하세요
# ○ 출력항목: 직원의 기본 정보 모두, title, salary
SELECT
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    t.title,
    s.salary
FROM employees as e
         join
     titles as t
     on e.emp_no = t.emp_no
    join
    salaries as s
    on e.emp_no = s.emp_no
WHERE
    year(s.to_date) = 9999
    and
    year(t.to_date) = 9999;


# 현재 재직중인 직원의 정보를 출력하세요.
# ○ 출력항목: emp_no, first_name, last_name, department
# ○ 정렬: emp_no 오름 차순
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees as e
         join
     dept_emp as de
     on e.emp_no = de.emp_no
         join
     departments as d
     on de.dept_no = d.dept_no
WHERE
    year(de.to_date) = 9999
ORDER BY
    e.emp_no asc;


# 부서별 재직중인 직원의 수를 출력하세요.
# ○ 출력 항목: 부서 번호, 부서명, 인원수
# ○ 정렬: 부서 번호 오름차순
SELECT
    d.dept_no,
    d.dept_name,
    count(e.emp_no)
FROM employees as e
         join
     dept_emp as de
     on e.emp_no = de.emp_no
         join
     departments as d
     on de.dept_no = d.dept_no
WHERE
    year(de.to_date) = 9999
GROUP BY
    d.dept_no
ORDER BY
    d.dept_no asc;


# 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
# ○ 출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    de.from_date,
    de.to_date
FROM employees as e
         join
     dept_emp as de
     on e.emp_no = de.emp_no
         join
     departments as d
     on de.dept_no = d.dept_no
WHERE
    e.emp_no = 10209
ORDER BY
    de.to_date;


