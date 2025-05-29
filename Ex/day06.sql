/* 2025-05-29 */

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

-- SubQuery
select salary
from employees
where first_name = 'Den'
;

select employee_id, first_name, salary
from employees
where salary >= (select salary
                  from employees
                  where first_name = 'Den'
                 )
;

-- 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
select first_name, salary, employee_id
from employees
where salary = (select min(salary)
                 from employees
                 )
;

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요
select first_name, salary, employee_id
from employees
where salary < (select avg(salary)
                 from employees
                 )
order by salary
;

-- 부서번호가 110인 직원의 월급와 같은 월급을 받는 모든 직원의 사번, 이름, 월급를 출력하세요
select first_name, salary
from employees
where salary in (select salary
                  from employees
                  where department_id = 110)
;

-- 각 부서별로 최고급여를 받는 사원을 출력하세요
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) in (select department_id, max(salary)
                                   from employees
                                   group by department_id)
order by department_id, salary
;

-- 부서번호가 110인 직원의 월급 중 가장 작은 월급 보다 월급이 많은 모든 직원의 
-- 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)
-- 다중행 subquery -> any
select first_name, salary
from employees
where salary > any (select salary
                     from employees
                     where department_id = 110)
;

-- 부서번호가 110인 직원의 월급 중 가장 많은 월급 보다 월급이 많은 모든 직원의 
-- 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
-- 다중행 subquery -> all
select first_name, salary
from employees
where salary > all (select salary
                     from employees
                     where department_id = 110)
;

-- 각 부서별로 최고급여를 받는 사원을 출력하세요
-- 인라인뷰
select a.department_id, a.employee_id, a.first_name, a.salary
from employees a,
    (select department_id, max(salary) max_salary
     from employees
     group by department_id) b
where a.department_id = b.department_id
  and a.salary = b.max_salary
order by a.department_id , a.salary
;

select a.department_id, a.employee_id, a.first_name, a.salary
from employees a
    join (select department_id, max(salary) max_salary
          from employees
          group by department_id) b
        on a.department_id = b.department_id
        and a.salary = b.max_salary
order by a.department_id, a.salary
;




