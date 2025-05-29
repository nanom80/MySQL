show columns from employees;
show columns from departments;

/*
문제1.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을 조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세요.
(106건)
*/
-- select count(*)
-- from (
select a.employee_id,
        a.first_name,
        a.last_name,
        b.department_name
from
    employees a,
    departments b
where
    a.department_id = b.department_id
order by
    b.department_name,
    a.employee_id
-- ) a
;

/*
문제2.
employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
직원들의 사번(employee_id), 이름(firt_name), 월급(salary), 부서명(department_name), 
현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
(106건)
*/
-- select count(*)
-- from (
select
    a.employee_id,
    a.first_name,
    a.salary,
    b.department_name,
    c.job_title
from
    employees a,
    departments b,
    jobs c
where
    a.department_id = b.department_id
and a.department_id is not null
and a.job_id = c.job_id
order by a.employee_id
-- ) a
;

/*
문제2-1.
문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
(107건)
*/
-- select count(*)
-- from (
select
    a.employee_id,
    a.first_name,
    a.salary,
    b.department_name,
    c.job_title
from
    employees a
    left join departments b
        on a.department_id = b.department_id
    join jobs c
        on a.job_id = c.job_id
order by a.employee_id
-- ) a
;

/*
문제3.
도시별로 위치한 부서들을 파악하려고 합니다.
도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요 
부서가 없는 도시는 표시하지 않습니다.
(27건)
*/
-- select count(*)
-- from (
select
    a.location_id,
    b.city,
    a.department_name,
    a.department_id
from
    departments a
    join locations b
        on a.location_id = b.location_id
order by
    a.location_id
-- ) a
;

/*
문제3-1.
문제3에서 부서가 없는 도시도 표시합니다. 
(43건)
*/
-- select count(*)
-- from (
select
    a.location_id,
    b.city,
    a.department_name,
    a.department_id
from
    departments a
    right outer join locations b
        on a.location_id = b.location_id
order by
    a.location_id
-- ) a
;


/*
문제4.
지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
(25건)
*/
-- select count(*)
-- from (
select
    a.region_name,
    b.country_name
from
    regions a
    join countries b
        on a.region_id = b.region_id
order by
    a.region_name asc,
    b.country_name desc
-- ) a
;

/*
문제5. 
자신의 매니저보다 채용일(hire_date)이 빠른 사원의 
사번(employee_id), 이름(first_name)과 채용일(hire_date), 매니저이름(first_name), 매니저입사일(hire_date)을 조회하세요.
(37건)
*/
-- select count(*)
-- from (
select
    a.employee_id,
    a.first_name,
    a.hire_date,
    b.first_name manager_first_name,
    b.hire_date manager_hire_date
from
    employees a
    join employees b
        on a.manager_id = b.employee_id
where a.hire_date < b.hire_date
-- ) a
;
/*
문제6.
나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 정렬하여 출력하세요.
값이 없는 경우 표시하지 않습니다.
(27건)
*/

-- select count(*)
-- from (
select
    a.country_name,
    a.country_id,
    b.city,
    b.location_id,
    c.department_name,
    c.department_id
from
    countries a
    join locations b
        on b.country_id = a.country_id
    join departments c
        on c.location_id = b.location_id
order by
    a.country_name asc
;

/*
문제7.
job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이디, 시작일, 종료일을 출력하세요.
이름은 first_name과 last_name을 합쳐 출력합니다.
(2건)
*/
select
    b.employee_id,
    concat(b.first_name,' ',b.last_name) name,
    b.job_id,
    a.start_date,
    a.end_date
from
    job_history a
    join employees b
        on a.employee_id = b.employee_id
where a.job_id = 'AC_ACCOUNT'
;

/*
문제8.
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name), 
매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
(11건)
*/
-- select count(*)
-- from (
select
    a.department_id,
    a.department_name,
    b.first_name,
    c.city,
    d.country_name,
    e.region_name
from
    departments a
    join employees b
        on a.manager_id = b.employee_id
    join locations c
        on a.location_id = c.location_id
    join countries d
        on c.country_id = d.country_id
    join regions e
        on d.region_id = e.region_id
-- ) a
;

/*
문제9.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
매니저가 없는 Steven도 표시합니다.
(107명)
*/
-- select count(*)
-- from (
select
    a.employee_id,
    a.first_name,
    b.department_name,
    c.first_name as manager_first_name
from
    employees a
    left join departments b
        on a.department_id = b.department_id
    left join employees c
        on a.manager_id = c.employee_id
-- ) a
;


/*
문제9-1.
문제9 에서 부서가 없는 직원(Kimberely)은 표시하고.
매니저가 없는 Steven은 표시하지 않습니다.
(106명)
*/
-- select count(*)
-- from (
select
    a.employee_id,
    a.first_name,
    b.department_name,
    c.first_name as manager_first_name
from
    employees a
    left join departments b
        on a.department_id = b.department_id
    join employees c
        on a.manager_id = c.employee_id
-- ) a
;

/*
문제9-2.
문제9 에서 부서가 없는 직원(Kimberely)은 표시하지 않고
매니저가 없는 Steven은 표시하지 않습니다.
(105명)
*/
-- select count(*)
-- from (
select
    a.employee_id,
    a.first_name,
    b.department_name,
    c.first_name as manager_first_name
from
    employees a
    join departments b
        on a.department_id = b.department_id
    join employees c
        on a.manager_id = c.employee_id
-- ) a
;


