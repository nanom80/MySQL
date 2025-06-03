/* 2025-06-02 */

-- root계정

/*
use mysql;

show databases;
show schemas;
show tables;
select * from information_schema.tables where table_schema = 'hr_db';
select * from information_schema.columns where table_name = 'countries';
show columns from employees;
show full processlist; -- 현재 실행 중인 모든 스레드/세션 목록 (= select * from information_schema.processlist);
kill 51; -- 특정 쿼리 종료 (kill Id)

select user(); -- USER(): 클라이언트가 인증에 사용한 계정.
select current_user(); -- 현재 세션에서 사용되는 계정(권한 기준 계정)

-- 현재 세션의 트랜잭션 상태 확인(root)
select * from information_schema.innodb_trx;
*/




-- -----------------------------------------------
-- 계정 생성 (계정명 web)
-- 모든 곳에서 접속 가능
create user 'web'@'%' identified by '1234';

-- localhost 에서만 접속가능(내 컴퓨터에서는 이 계정 사용)
create user 'web'@'localhost' identified by '1234';

-- 192.168.0.122 에서만 접속가능
create user 'web'@'192.168.0.122' identified by '1234';

-- 비번 변경
alter user 'web'@'%' identified by 'web';

/* mysql -u web -p
-> 로그인우선순위 192.168.0.122 > localhost > %
*/
drop user 'web'@'192.168.0.122';

drop user 'web'@'localhost';

select user, host
from user
;

-- -----------------------------------------------
-- 데이타베이스(스키마) 만들기
create database web_db
    default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

-- 데이터베이스 선택
use web_db;

-- 데이터베이스 조회
show databases;

-- 데이타베이스 삭제
drop database web_db;


-- -----------------------------------------------
-- 권한부여
-- 'web'@'%'계정에게 web_db의 모든 테이블의 모든 권한 부여
grant all privileges on web_db.* to 'web'@'%';

-- 계정을 생성하거나 권한을 수정한 후, 변경된 권한을 즉시 적용하고자 할 때
flush privileges;






