# 다음 결과가 나오도록 buytbl에 대한 SQL 문을 각각 작성하세요.
    USE sqldb;

    SELECT
        userID as "사용자 아이디",
        sum(amount) as "총 구매 개수"
    FROM
        buytbl
    GROUP BY
        userID;


    SELECT
        userID as "사용자 아이디",
        sum(amount * price) as "총 구매액"
    FROM
        buytbl
    GROUP BY
        userID;


    SELECT
        ROUND(avg(amount),5)
    FROM
        buytbl;


    SELECT
        userID,
        ROUND(avg(amount),5)
    FROM
        buytbl
    GROUP BY
        userID;

# 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함
    SELECT
        name,
        height
    FROM
        usertbl
    where
        height =
            (select MAX(height) from usertbl) ||
        height =
            (select MIN(height) from usertbl);


# 다음 결과가 나오도록 usertbl에 대한 SQL 문을 작성하세요.
    SELECT
        count(userID) as "휴대폰이 있는 사용자"
    FROM
        usertbl
    WHERE
        mobile1 is not null ||
        mobile2 is not null;


# buytbl 테이블로 다음을 처리하세요.
# 사용자별 총 구매액을 출력하세요.
    SELECT
        userID as "사용자",
        sum(price * amount) as "총구매액"
    FROM
        buytbl
    GROUP BY
        userID;

# 총 구매액이 1,000이상인 사용자만 출력하세요.
    SELECT
        userID as "사용자",
        sum(price * amount) as "총구매액"
    FROM
        buytbl
    GROUP BY
        userID
    HAVING
        sum(price * amount) >= 1000;


# world 데이터베이스에서 다음 질문을 처리하세요.
    USE world;
# ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 총합을 구하시오.
    SELECT
        sum(Population) as "인구수 총합"
    FROM
        city
    WHERE
        CountryCode like "KOR";

# ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최소값을 구하시오.
#   단 결과를 나타내는 테이블의 필드는 "최소값"으로 표시하시오.
    SELECT
        MIN(Population) as "최소값"
    FROM
        city
    WHERE
        CountryCode like "KOR";

# ○ city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오.
    SELECT
        AVG(Population) as "평균"
    FROM
        city
    WHERE
        CountryCode like "KOR";

# ○ city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오.
#   단 결과를 나타내는 테이블의 필드는 "최대값"으로 표시하시오.
    SELECT
        MAX(Population) as "최대값"
    FROM
        city
    WHERE
        CountryCode like "KOR";

# ○ country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.
    SELECT
        Name,
        length(Name)
    FROM
        country;

# ○ country테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.
    SELECT
        Name,
        concat(upper(substr(Name,1,3)), substr(Name,4))
    FROM
        country;

# ○ country테이블의 기대수명(LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오.
    SELECT
        round(LifeExpectancy)
    FROM
        country;


# 모든 문제는 employees 데이터베이스에서 수행한다.
    USE employees;

# employees db에서 각 부서별 관리자를 출력하세요.
#   ○ 단, 현 재직자만 출력한다.
    SELECT
        *
    FROM
        dept_manager as d
            join
        employees as e
            on d.emp_no = e.emp_no
    WHERE
        year(to_date) = 9999;

# 부서번호 d005 부서의 핸재 관리자 정보를 출력하세요.
    SELECT
        *
    FROM
        dept_manager as d
            join
        employees as e
        on d.emp_no = e.emp_no
    where
        d.dept_no like "d005" &&
        year(to_date) = 9999;


# employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다.
#   다음 조건하에서 8번 페이지의 데이터를 출력하세요.
#   ○ 입사일을 내림차순으로 정렬한다.
#   ○ 한 페이지당 20명의 정보를 출력한다.
    SELECT
        *
    FROM
        employees
    ORDER BY
        employees.employees.hire_date
            desc
            limit 161, 180;


# employees db에서 재직자의 총 수를 구하시오
# ○ 재직자의 to_date값은 '9999-01-01'로 저장되어 있음
    SELECT
        count(employees.employees.emp_no) as "총 수"
    FROM
        employees
    where
        employees.emp_no in
            (SELECT distinct emp_no FROM dept_emp WHERE year(to_date) = 9999) ||
        employees.emp_no in
            (SELECT distinct emp_no FROM dept_manager WHERE year(to_date) = 9999);


# employees db에서 재직자의 평균 급여를 출력하시오.
    SELECT
        avg(salaries.salary) as "평균 급여"
    FROM
        salaries
    where
        salaries.emp_no in
        (SELECT distinct emp_no FROM dept_emp WHERE year(to_date) = 9999) ||
        salaries.emp_no in
        (SELECT distinct emp_no FROM dept_manager WHERE year(to_date) = 9999);


# 재직자 전체 평균 급여 보다 급여를 더 많이 받는 재직자를 출력하세요.
    SELECT
        distinct salaries.emp_no
    FROM
        salaries
    WHERE
        salary >
        (SELECT
            avg(salaries.salary) as "평균 급여"
        FROM
            salaries
        where
            salaries.emp_no in
            (SELECT emp_no FROM dept_emp WHERE year(to_date) = 9999) ||
            salaries.emp_no in
            (SELECT emp_no FROM dept_manager WHERE year(to_date) = 9999));


# employees db에서 각 부서별 재직자의 수를 구하시오
# ○ 부서 번호로 구분하고, 부서 번호로 오름 차순 정렬하여 출력한다.
    SELECT
        d.dept_no as "부서 번호",
        count(e.emp_no) as "재직자의 수"
    FROM
        departments as d
        join
        (SELECT emp_no, dept_no FROM dept_emp WHERE year(to_date) = 9999 ) as e
        on d.dept_no = e.dept_no
    GROUP BY
        d.dept_no
    ORDER BY
        d.dept_no asc;