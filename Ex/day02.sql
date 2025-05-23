desc employees;

select	first_name, department_id
from	employees
where	department_id = 30
;

select	concat(first_name,' ',last_name) name
		,salary
from	employees
where	salary >= 15000
;

select	concat(first_name,' ',last_name) name,
		hire_date
from	employees
where	hire_date >= '2007-01-01'
;

select	concat(first_name,' ',last_name) name,
		salary
from	employees
-- where	first_name = 'Lex'
where	first_name = 'lEx'
;

select	concat(first_name,' ',last_name) name,
		salary
from	employees
where	binary first_name = 'Lex'
-- 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용
;

select	first_name, salary
from	employees
where	salary between 14000 and 17000
;

select	first_name, salary
from	employees
where	salary >= 14000
and		salary <= 17000
;

select	first_name, salary
from	employees
where	salary <= 14000
or		salary >= 17000
;

select	first_name, hire_date
from	employees
where	hire_date between '2004-01-01' and '2005-12-31'
order by hire_date
;

select	first_name, salary
from	employees
where	salary between 14000 and 17000
;

-- Neena, Lex, John 의 이름, 성, 월급을 구하시오
select	first_name, last_name, salary
from	employees
where	first_name in ('Neena','Lex','John')
;

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select	concat(first_name, ' ', last_name) name,
		salary
from	employees
where	salary in (2100,3100,4100,5100)
order by 1
;

-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select	concat(first_name, ' ', last_name) name,
		salary
from	employees
where	first_name like '%am%'
;

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select	concat(first_name, ' ', last_name) name,
		salary
from	employees
where	substr(first_name,2,1) = 'a'
;

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select	concat(first_name, ' ', last_name) name,
		salary
from	employees
where	substr(first_name,4,1) = 'a'
;

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select	concat(first_name, ' ', last_name) name,
		salary
from	employees
where	char_length(first_name) = 4
and		substr(first_name, -2, 1) = 'a'
;

select	first_name, salary, commission_pct
from	employees
where	commission_pct is null
;

-- 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select concat(first_name,' ',last_name) name,
		commission_pct
from employees
where commission_pct is not null
;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select concat(first_name, ' ', last_name) name,
		manager_id,
        commission_pct
from employees
where manager_id is null
  and commission_pct is null
;

select concat(first_name, ' ', last_name) name
      , manager_id
      , commission_pct
      , salary
      , salary*commission_pct bonus
  from employees
 where commission_pct is not null
;

-- 부서가 없는 직원의 이름과 월급을 출력하세요
select concat(first_name,' ',last_name) name,
        salary
from employees
where department_id is null
;

-- 월급이 6000이상 10000이하인 직원 중 커미션비율이 없는 직원의 이름 월급 커미션 비율을 출력하세요
select concat(first_name,' ',last_name) name,
        salary,
        commission_pct
from employees
where salary between 6000 and 10000
  and commission_pct is null
;

select
	concat(first_name,' ',last_name) name
    , salary
    , commission_pct
from
	employees
where 1=1
and salary between 6000 and 10000
and commission_pct is null
;

-- 직원의 이름과 월급을 월급이 많은 직원부터 출력하세요
select
	concat(first_name,' ',last_name) name
    , salary
from
	employees
order by
	salary desc
    , name asc
;

-- 월급이 9000이상인 직원의 이름과 월급을 월급이 작은 직원부터 출력하세요
select
	concat(first_name,' ',last_name) name,
    salary
from
	employees
where
	salary >= 9000
order by
	salary asc,
    name desc
;

-- 부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select
	department_id,
    salary,
    first_name
from
	employees
where 1=1
order by
	department_id asc
;
	
-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select
	concat(first_name,' ',last_name) name,
    salary
from
	employees
where 1=1
and	salary >= 10000
order by
	salary desc
;


-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요
select
	department_id,
    salary,
    concat(first_name,' ',last_name) name
from
	employees
where 1=1
order by
	department_id asc, -- asc를 적지 않아도 기본적으로 오름차순 정렬임
    salary desc        -- 내림차순인 경우에는 desc를 꼭 써줘야 한다
;

-- 직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select
	first_name,
    salary,
    hire_date
from
	employees
where 1=1
order by
	first_name asc
;

-- 직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select
	first_name,
    salary,
    hire_date
from
	employees
where 1=1
order by
	hire_date asc
;



