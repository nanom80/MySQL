select	concat(first_name,'-',last_name) as '성명',
		salary as '월급',
		salary*12 as '연봉',
        salary*12+5000 as '보너스',
        phone_number as '전화번호'
from	employees
;

