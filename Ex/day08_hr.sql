/* 2025-06-02 */

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

show databases;

use hr_db;
show tables;
select * from employees;






