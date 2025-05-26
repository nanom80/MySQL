/* 2025-05-22 */

use hr_db;

show databases;
show schemas;
show tables;
select * from information_schema.tables where table_schema = 'hr_db';
select * from information_schema.columns where table_name = 'countries';
show columns from employees;
show columns from job_history;
show columns from jobs;
-- 주석
/* 주석 */

select * from countries;	-- 나라
select * from departments;	-- 부서
select * from employees;	-- 직원
select * from job_history;	-- 업무현황
select * from jobs;		-- 업무
select * from locations;	-- 도시
select * from regions;		-- 지역

select	employee_id as '사번',
		first_name as '이름',
        last_name as '성',
        concat(first_name, ' ',last_name, ' hire date is ', hire_date) as 'name',
        salary as '월급',
        salary * 12 as '연봉',
        phone_number as '전화번호',
        email as '이메일',
        hire_date as '입사일',
        first_name * 10	as '연산시 문자열은 0으로 처리'
from	employees
;

select	concat(first_name,'-',last_name) as '성명',
		salary as '월급',
		salary*12 as '연봉',
        salary*12+5000 as '보너스',
        phone_number as '전화번호'
from	employees
;

































