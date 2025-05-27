/* 2025-05-27 */

use hr_db;

-- 복수행함수(그룹함수,집계함수)
-- 갯수 합계 평균 최고값 최저값

-- count()
select count(*),             -- null 포함
        count(commission_pct) -- null 제외
from employees
;

-- sum()
select count(*), sum(salary)
from employees
;

-- avg()
select count(*), sum(salary), avg(salary)
from employees
;

select count(*), sum(salary), avg(ifnull(salary,0))
from employees
;

-- max(), min()
select count(*), max(salary), min(salary)
from employees
;

-- group by 절
select department_id,
        count(*),
        avg(salary),
        sum(salary),
        max(salary),
        min(salary)
from employees
group by department_id
having sum(salary) >= 20000
   and department_id >= 90
order by count(*) desc
;

-- if ~ else 문
select first_name,
        salary,
        commission_pct,
        if(commission_pct is null,0,1) as state,
        ifnull(commission_pct,0) commission_pct_ifnull
from employees
order by 3
;

-- case ~ end문
select employee_id,
        salary,
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary + salary * 0.1
             when job_id = 'SA_REP' then salary + salary * 0.2
             when job_id = 'ST_CLERK' then salary + salary * 0.3
             else salary
        end realSalary
from employees
;

select first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 110 and department_id <= 150 then 'C-TEAM'
             else '팀없음'
        end team
from employees
order by 3,1
;




select *
from employees
;
