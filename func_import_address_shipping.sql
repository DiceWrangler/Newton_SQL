--
--	func_import_address_shipping.sql
--

-- Function: import_address_shipping()

DROP FUNCTION IF EXISTS import_address_shipping();

CREATE FUNCTION import_address_shipping()
  RETURNS void AS
$BODY$
begin

insert into agent_address(
	agent_id,
	address_type,
	address,
	address2,
	city,
	stateorprovince,
	postalcode,
	country,
	phone,
	company )
select
	ag.id,
	sa_address_type,
	sa_address,
	sa_address2,
	sa_city,
	sa_stateorprovince,
	sa_postalcode,
	sa_country,
	sa_phone,
	sa_company
  
from import_sale io
inner join agent ag on
	ag.email_address = io.email_address
left outer join agent_address sa on
	sa.agent_id = ag.id and
	sa.address_type = io.sa_address_type and
	sa.address = io.sa_address and
	sa.address2 = io.sa_address2 and
	sa.city = io.sa_city and
	sa.stateorprovince = io.sa_stateorprovince and
	sa.postalcode = io.sa_postalcode and
	sa.country = io.sa_country and
	sa.phone = io.sa_phone and
	sa.company = io.sa_company
where
	sa.id is null and
	trim(both ' ' from io.sa_address) > ''  -- ignore empty address
group by
	ag.id,
	io.sa_address_type,
	io.sa_address,
	io.sa_address2,
	io.sa_city,
	io.sa_stateorprovince,
	io.sa_postalcode,
	io.sa_country,
	io.sa_phone,
	io.sa_company;

end;
$BODY$
  LANGUAGE plpgsql;
