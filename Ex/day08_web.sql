/* 2025-06-02 (월) */

/*
use web_db;

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

*/

-- 테이블 만들기
create table book(
    book_id  int,
    title    varchar(50),
    author   varchar(20),
    pub_date datetime
);

select * from book;
desc book;

-- 컬럼 추가
alter table book add pubs varchar(50);

-- 컬럼 수정
alter table book modify title varchar(100);
alter table book rename column title to subject;

-- 칼럼 삭제
alter table book drop author;

-- 테이블 명 수정
rename table book to article;

-- 테이블 삭제
drop table article;
drop table book;

-- TRUNCATE 명령: 테이블의 모든 로우를 제거 -> DML delete문과 비교
truncate table article;

-- 작가 테이블 만들기
create table author (
    author_id   int             primary key,
    author_name varchar(100)    not null,
    author_desc varchar(500)
)
;

create table book (
    book_id     int             primary key,
    title       varchar(100)    not null,
    pubs        varchar(100),
    pub_date    datetime,
    author_id   integer,
    constraint book_fk foreign key (author_id)
    references author(author_id)
);

-- 작가 데이터 삽입
insert into author values(1,'박경리','토지작가');
insert into author(author_id, author_name) values(2,'이문열');

select * from author;
select * from book;

commit;

delete from author where author_id = 1;

delete from author;
truncate table author;

rollback;

select * from book;
desc book;

SELECT * FROM web_db.book;



