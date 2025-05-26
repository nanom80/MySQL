/* 2025-05-26 */

use hr_db;

/* 단일행 함수 */
-- 숫자함수
-- round() : 반올림
select round(123.123,2),  -- 123.12 소수점 2자리까지 표현
        round(123.126,2),  -- 123.13 소수점 3자리에서 반올림
        round(234.567,0),  -- 235
        round(123.456,0),  -- 123
        round(123.456),    -- 123
        round(123.124,-1), -- 120 (1의 자리에서 반올림)
        round(125.126,-1), -- 130
        round(125.126,-2)  -- 100 (10의 자리에서 반올림)
from dual
;

-- ceil(숫자) : 올림
select ceil(123.456), -- 124
        ceil(123.789), -- 124
        ceil(123.7892313), -- 124
        ceil(987.1234) -- 988
from dual
;

-- floor(숫자) : 내림
select floor(123.456),
        floor(123.789),
        floor(123.7892313),
        floor(987.1234)
from dual
;

-- truncate(숫자,m) : 버림, 소수점 m자리까지 표현
select truncate(1234.34567,2),
        truncate(1234.34567,3),
        truncate(1234.34567,0),
        truncate(1235.34567,-2)
from dual
;

-- power(숫자,n), pow(숫자,n) : 숫자의 n승
select power(12,2), pow(12,2)
from dual
;

-- sqrt(숫자) : 숫자의 제곱근
select sqrt(144)
from dual
;

-- sign(숫자) : 숫자가 음수이면 -1, 0이면 0, 양수이면 1
select sign(123), -- 1
        sign(0),   -- 0
        sign(-123) -- -1
from dual
;

-- abs(숫자) : 절대값
select abs(123), -- 123
        abs(0),   -- 0
        abs(-123) -- 123
from dual
;

-- greatest(x,y,z, ...) : 괄호안의 값 중 가장 큰 값
select greatest(2,0,-2),         -- 2
        greatest(4,3.2,5.25),     -- 5.25
        greatest('B','A','C','c') -- c
from dual
;

-- least(x,y,z, ...) : 괄호안의 값 중 가장 작은 값
select least(2,0,-2),         -- -2
        least(4,3.2,5.25),     -- 3.2
        least('B','A','C','c') -- A
from dual
;

-- 문자함수
-- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결
select concat('안녕', '하세요');
select concat('안녕', '-', '하세요');
select concat(first_name, " ", last_name)
from employees;

-- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., strn을 연결할때 사이에 s 로 연결 *with seperator
select concat_ws('-','abc','123','가나다');

select concat_ws('-', first_name, last_name, salary)
from employees;

-- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
select first_name,
        lcase(first_name),
        lower(first_name),
        lower('ABCabc!#$%'),
        lower('가나다')
from employees
;

-- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
select first_name,	
        ucase(first_name),
        upper(first_name),
        upper('ABCabc!#$%'),
        upper('가나다')
from employees
;

-- LENGTH(str) : str의 길이를 바이트로 반환
select first_name,
        length(first_name),
        char_length(first_name),
        character_length(first_name)
from employees
;

-- CHAR_LENGTH(str) 또는 CHARACTER_LENGTH(str) : str의 문자열 길이를 반환
select length('a'),
        char_length('a'),
        character_length('a')
;

select length('가'),
        char_length('가'),
        character_length('가')
;

-- SUBSTR(str,pos,len) 또는 SUBSTRING(str,pos,len)
select first_name,
        substr(first_name,1,3), -- 양수인 경우 왼쪽->오른쪽으로 검색해서 글자수 만큼 추출
        substr(first_name,-3,2) -- 음수인 경우 오른쪽->왼쪽 검색을 한 후 왼쪽->오른쪽으로 글자수 만큼 추출
from employees
where department_id = 100
;

select substr('901112-1234567',8,1),
        substr('901112-1234567',-7,1),
        substr('010-1111-2222',1,3),
        substr('010-1111-2222',-13,3)
from dual
;

-- LPAD(str,len,padstr) : str 문자열 왼쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
-- RPAD(str,len,padstr) : str 문자열 오른쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듬
select first_name,
        lpad(first_name,10,'*'),
        rpad(first_name,10,'*')
from    employees
;

-- TRIM(str): str의 양쪽에 있는 공백 문자를 제거
-- LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
-- RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
select concat('|','          안녕하세요             ','|'),
        concat('|',trim('          안녕하세요             '),'|'),
        concat('|',ltrim('          안녕하세요             '),'|'),
        concat('|',rtrim('          안녕하세요             '),'|')
;

-- REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
select first_name,
        replace(first_name,'a','*'),
        replace(first_name,substr(first_name,2,3),'***')
from employees
where department_id = 100
;

-- CURRENT_DATE() 또는 CURDATE(): 현재 날짜를 반환
select current_date(), curdate();


-- CURRENT_TIME() 또는 CURTIME(): 현재 시간을 반환
select current_time(), curtime();

-- CURRENT_TIMESTAMP() 또는 NOW(): 현재 날짜와시간을 반환
select current_timestamp(), now();

-- 날짜, 시간 더하기, 빼기
select adddate('2025-05-26 00:00:00', interval 1 year),
        adddate('2025-05-26 00:00:00', interval 1 month),
        adddate('2025-05-26 00:00:00', interval 1 week),
        adddate('2025-05-26 00:00:00', interval 1 day),
        adddate('2025-05-26 00:00:00', interval 1 hour),
        adddate('2025-05-26 00:00:00', interval 1 minute),
        adddate('2025-05-26 00:00:00', interval 1 second)
from dual
;

select subdate('2025-05-26 00:00:00', interval 1 year),
        subdate('2025-05-26 00:00:00', interval 1 month),
        subdate('2025-05-26 00:00:00', interval 1 week),
        subdate('2025-05-26 00:00:00', interval 1 day),
        subdate('2025-05-26 00:00:00', interval 1 hour),
        subdate('2025-05-26 00:00:00', interval 1 minute),
        subdate('2025-05-26 00:00:00', interval 1 second)
from dual
;

-- DATEDIFF(): 두 날짜 간 일수차
-- TIMEDIFF(): 두 날짜시간 간 시간차
select datediff('2025-05-26 00:00:00', '2025-04-26 00:00:00'),
        datediff('2025-05-26', '2025-04-26'),
        timediff('2025-05-26 00:00:00', '2025-05-25 00:00:00')
;

select first_name,
        datediff(now(), hire_date)/365,
        truncate(datediff(now(), hire_date)/365,0),
        concat(floor(datediff(now(), hire_date)/365),'년차')
from employees
;

-- 변환함수: 날짜(시간) -> 문자열
-- DATE_FORMAT(date, format): date를 format형식으로 변환
select now(),
        date_format(now(),'%Y-%m-%d %H:%i:%s'),
        date_format(now(),'%Y/%m/%d[%a] %h:%i:%s(%p)')
from dual
;

select first_name,
        date_format(hire_date,'%Y/%m/%d') hire_date
from employees
;

-- 변환함수: 문자열 -> 날짜(시간)
-- STR_TO_DATE(str, format): str를 format형식으로 변환
select now(),
        str_to_date('20250526','%Y%m%d'),
        str_to_date('2025-May-25 07:48:52', '%Y-%b-%d'),
        datediff(str_to_date('2025-May-25', '%Y-%b-%d'),str_to_date('2025-05-26', '%Y-%m-%d'))
from dual
;

-- FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
select format(1234567.89,2),
        format(1234567.89,0), -- 자릿수 반올림
        format(1234567.89,-5) -- format함수는 소수점 이하 자리만 처리
;

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select first_name,
        commission_pct,
        ifnull(commission_pct,'없음'),
        case when employee_id > 200 then 'Y' else 'N' end aa,
        if (employee_id > 200,'Y','N') bb,
        a.*
from employees a
;



