/* 2025-05-28 */

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
show full processlist; -- 현재 실행 중인 모든 스레드/세션 목록 select * from information_schema.processlist;
kill 51; -- 특정 쿼리 종료 (kill Id)
*/


-- select count(*) -- 106
select *
from employees,
     departments
where employees.department_id = departments.department_id
;

select *
from employees a,
     departments b
where a.department_id = b.department_id
;

select count(*) -- 107
from employees
;

select count(*)
from employees a,
     departments b
where a.department_id = b.department_id
;

-- inner join (equi join) == join
select count(*)
from employees e inner join departments d
on e.department_id = d.department_id
;

select count(*)
from employees e
join departments d
  on e.department_id = d.department_id
join locations l
  on d.location_id = l.location_id
;

select e.first_name,
        d.department_id,
        d.department_name,
        l.city
from employees e
join departments d
  on e.department_id = d.department_id
join locations l
  on d.location_id = l.location_id
;

select
    e.first_name,
    d.department_id,
    d.department_name,
    l.city,
    l.location_id,
    count(*)
from employees e
    join departments d
        on e.department_id = d.department_id
    join locations l
        on d.location_id = l.location_id
        and d.location_id = l.location_id -- 조인 조건이 더 많으면 on 이후에 and로 처리
where
    e.commission_pct is null
and e.manager_id is not null
group by
    e.first_name,
    d.department_id,
    d.department_name,
    l.city,
    l.location_id
;

select count(*)
from employees e
    left outer join departments d
    on e.department_id = d.department_id
;

select
    row_number() over (order by e.first_name, d.department_id, l.location_id) as row_num,
    e.first_name,
    d.department_id,
    d.department_name,
    l.city,
    l.location_id,
    count(*)
from
    employees e
    left outer join departments d
        on e.department_id = d.department_id
    join locations l
        on d.location_id = l.location_id
        and d.location_id = l.location_id -- 조인 조건이 더 많으면 on 이후에 and로 처리
where
    e.commission_pct is null
and e.manager_id is not null
group by
    e.first_name,
    d.department_id,
    d.department_name,
    l.city,
    l.location_id
;


select e.department_id, e.first_name, d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id
order by 1
;

select e.first_name,
        d.department_name,
        e.department_id,
        d.department_id
from employees e
right outer join departments d
    on e.department_id = d.department_id
;

select e.first_name, d.*
from departments d
    left outer join employees e
        on d.department_id = e.department_id
;

-- full outer join
(select
    e.employee_id,
    e.department_id,
    e.first_name,
    d.department_name
from
    employees e
    left outer join departments d
        on e.department_id = d.department_id)
union
(select
    e.employee_id,
    e.department_id,
    e.first_name,
    d.department_name
from
    employees e
    right outer join departments d
        on e.department_id = d.department_id)
;

-- self join
select
    emp.employee_id,
    emp.first_name,
    emp.manager_id,
    man.first_name as manager
from
    employees emp,
    employees man
where
    emp.manager_id = man.employee_id
;

select
    row_number() over (order by emp.employee_id) as row_num,
    emp.employee_id,
    emp.first_name,
    emp.manager_id,
    man.first_name as manager
from
    employees emp
    join employees man
        on emp.manager_id = man.employee_id
;





