show columns from employees;
show columns from departments;

/*
문제1.
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.
(56건)
*/
select count(*)
from employees
where salary < (select avg(salary) avg_salary
                from employees)
;

/*
문제2. 
평균월급 이상, 최대월급 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차순으로 정렬하여 출력하세요
(51건)
*/
select employee_id, first_name, salary, avg_salary, max_salary
from employees a
    join (select avg(salary) avg_salary, max(salary) max_salary
          from employees) b
where a.salary between avg_salary and max_salary
;

select employee_id, first_name, salary, avg_salary, max_salary
from employees a,
    (select avg(salary) avg_salary, max(salary) max_salary
     from employees) b
where a.salary between avg_salary and max_salary
;

/*
문제3.
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
(1건)
*/
select
    c.*
from
    employees a,
    departments b,
    locations c
where
    a.department_id = b.department_id
and b.location_id = c.location_id
and a.first_name = 'Steven'
and a.last_name = 'King'
;

/*
문제4.
job_id 가 'ST_MAN' 인 직원의 월급보다 작은 직원의 사번,이름,월급을 월급의 내림차순으로 출력하세요  -ANY연산자 사용
(74건)
*/
select employee_id, first_name, salary
from employees
where salary < any (select salary
                    from employees
                    where job_id = 'ST_MAN')
order by salary desc
;


/*
문제5. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name)과 월급(salary) 부서번호(department_id)를 조회하세요 
단 조회결과는 월급의 내림차순으로 정렬되어 나타나야 합니다. 
조건절비교, 테이블조인 2가지 방법으로 작성하세요
(11건)
*/
select
    a.employee_id,
    a.first_name,
    a.salary,
    a.department_id
from
    employees a,
   (select department_id, max(salary) max_salary
    from employees
    group by department_id) b
where
    a.department_id = b.department_id
and a.salary = b.max_salary
order by a.department_id
;



/*
문제6.
각 업무(job) 별로 월급(salary)의 총합을 구하고자 합니다. 
월급 총합이 가장 높은 업무부터 업무명(job_title)과 월급 총합을 조회하시오 
(19건)
*/
select b.job_title, sum(a.salary) sum_salary
from employees a,
    jobs b
where a.job_id = b.job_id
group by a.job_id
order by sum_salary desc
;

/*
문제7.
자신의 부서 평균 월급보다 월급(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 월급(salary)을 조회하세요 
(38건)
*/
select
    a.employee_id,
    a.first_name,
    a.salary
from
    employees a,
    (select department_id, avg(salary) avg_salary
    from employees
    group by department_id
    ) b
where
    a.department_id = b.department_id
and a.salary > avg_salary
;


/*
문제8.
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 월급, 입사일을 입사일 순서로 출력하세요
*/
select employee_id, first_name, salary, hire_date
from (
    select employee_id, first_name, salary, hire_date, row_number() over (order by hire_date) as hire_cnt
    from employees
    ) a
where hire_cnt between 11 and 15
;




