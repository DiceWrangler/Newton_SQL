--
--	script_prime_customer_type.sql
--

/*
select
	'insert into customer_type (description) values (''' || description || ''');'
from customer_type
order by description;
*/

insert into customer_type (description) values ('former');
insert into customer_type (description) values ('individual');
insert into customer_type (description) values ('reseller');
insert into customer_type (description) values ('prospect');
insert into customer_type (description) values ('exploded');
insert into customer_type (description) values ('organization');
