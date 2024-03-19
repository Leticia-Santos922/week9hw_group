use practice_db;

select *
from person;

select * 
from vpeople_and_addresses;

-- % = wildcard - any character
-- where firstname like "c%"; = where name starts with c
select HouseNo
from vpeople_and_addresses
where City like "s%";



