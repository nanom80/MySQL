/* 2025-06-03 (화) */

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

show tables;

drop table author;
drop table book;

create table author(
    author_id    int           primary key  auto_increment,
    author_name  varchar(100)  not null,
    author_desc  varchar(500)
);

alter table author modify author_id int primary key auto_increment;

create table book(
    book_id    int           primary key  auto_increment,
    title      varchar(100)  not null,
    pubs       varchar(100),
    pub_date   datetime,
    author_id  int,
    constraint book_fk foreign key (author_id) references author(author_id)
    on delete cascade -- 해당하는 FK를 가진 참조행도 삭제
    -- on delete set null: 해당하는 FK를 NULL로 바꿈
);

-- auto_increment 현재 값 조회
select last_insert_id() from dual;

select * from author;
select * from book;

desc author;
desc book;

insert into author (author_name, author_desc) values ('박명수','서울');
insert into author values (null,'유재석','서울');

commit;

rollback;

delete
from author
where author_id = 7;

truncate table author;

delete from author;

update author
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 3
;

insert into author values (null,'이문열','경북 영양');
insert into author values (null,'박경리','경상남도 통영');
insert into author values (null,'유시민','17대 국회의원');
insert into author values (null,'기안84','기안동에서 산 84년생');
insert into author values (null,'강풀','온라인 만화가 1세대');
insert into author values (null,'김영하','알쓸신잡');

insert into book values (1,'우리들의 일그러진 영웅','다림','1998-02-22',null);
insert into book values (2,'삼국지','민음사','2002-03-01',1);
insert into book values (3,'토지','마로니에북스','2012-08-15',2);
insert into book values (4,'유시민의 글쓰기 특강','생각의길','2015-04-01',1);
insert into book values (5,'패션왕','중앙북스(books)','2012-02-22',4);
insert into book values (6,'순정만화','재미주의','2011-08-03',5);
insert into book values (7,'26년','재미주의','2012-02-04',5);

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

select *
from book
where book_id = 1
;

delete
from book
where book_id = 1
;

update book
set title = '유시민의 글쓰기 특강'
where book_id = 4
;

update book
set author_id = 1
where book_id = 1
;

commit;


