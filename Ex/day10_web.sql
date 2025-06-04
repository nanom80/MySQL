/* 2025-06-04 (수) */

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

select * from author;

select * from book;

insert into author values(7,'신현석','성내동');

update author set author_desc = '성내동' where author_id = 7;

delete from author
where author_id = (select max(author_id) max_author_id from author)
;

select *
from author
where author_id = (select max(author_id) max_author_id from author)
;

select author_id,
    author_name,
    author_desc
from author
where author_id = 11
;

desc book;
desc author;

select * from book;
select * from author;

select book_id,
    title,
    pubs,
    pub_date,
    author_id
from book
;

select a.book_id,
    a.title,
    a.pubs,
    date_format(pub_date,'%Y-%m-%d') pub_date,
    a.author_id,
    b.author_name,
    b.author_desc
from book a
    join author b
        on a.author_id = b.author_id
order by a.book_id
;






