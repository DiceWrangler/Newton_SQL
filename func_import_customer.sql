--
--	func_import_customer.sql
--

-- Function: import_customer()

DROP FUNCTION IF EXISTS import_customer();

CREATE FUNCTION import_customer()
  RETURNS void AS
$BODY$
begin

with email_domains as (
select
	substring(email_address from position('@' in email_address)+1) as "ag_email_domain"
from agent ag
left outer join public_email_domain ped on
	ped.email_domain = substring(email_address from position('@' in email_address)+1)
where
	ped.id is null
group by ag_email_domain)

insert into customer(
  name,
  email_domain )
select
  '',  -- capture company from billing address?
  ag_email_domain from email_domains ed
left outer join customer c on
	c.email_domain = ag_email_domain
where
	c.id is null;

end;
$BODY$
  LANGUAGE plpgsql;
