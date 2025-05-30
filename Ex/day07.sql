/* 2025-05-30 */

/*
use hr_db;

show databases;
show schemas;
show tables;
select * from information_schema.tables where table_schema = 'hr_db';
select * from information_schema.columns where table_name = 'countries';
show columns from employees;
show columns from job_history;
show columns from jobs;
show columns from departments;
show full processlist; -- 현재 실행 중인 모든 스레드/세션 목록 (= select * from information_schema.processlist);
kill 51; -- 특정 쿼리 종료 (kill Id)
*/

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 0,5 -- 1번부터 5개
;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 5 offset 0 -- 1번부터 5개
;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 1,5 -- 2번부터 5개
;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 5 offset 1 -- 2번부터 5개
;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 10, 5 -- 11번부터 5개
;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 5 offset 10 -- 11번부터 5개
;

select employee_id, first_name, salary
from employees
order by employee_id asc
limit 5 -- 처음부터 5개
;

-- 07년에 입사한 익원 중 급여가 많은 직원 3에서 7등의 이름, 급여, 입사일
select first_name, salary, hire_date
from employees
where hire_date between '2007-01-01' and '2007-12-31'
order by salary desc, first_name
;
select first_name, salary, hire_date
from employees
where hire_date between '2007-01-01' and '2007-12-31'
order by salary desc, first_name
limit 2,5
;

-- 부서번호가 100인 직원 중 급여를 가장 많이 받은 직원의 이름, 급여, 부서번호를 출력하세요
select first_name, salary, department_id
from employees
where department_id = 100
order by salary desc
limit 1
;

-- limit보다는 subquery를 쓰는게 낫다
select first_name, salary, department_id
from employees
where salary = (select max(salary)
                from employees
                where department_id = 100)
and department_id = 100
;





