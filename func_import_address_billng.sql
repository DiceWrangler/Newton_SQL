--
--	func_import_address_billing.sql
--

-- Function: import_address_billing()

DROP FUNCTION IF EXISTS import_address_billing();

CREATE FUNCTION import_address_billing()
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
	ba_address_type,
	ba_address,
	ba_address2,
	ba_city,
	ba_stateorprovince,
	ba_postalcode,
	ba_country,
	ba_phone,
	ba_company
  
from import_sale io
inner join agent ag on
	ag.email_address = io.email_address
left outer join agent_address ba on
	ba.agent_id = ag.id and
	ba.address_type = io.ba_address_type and
	ba.address = io.ba_address and
	ba.address2 = io.ba_address2 and
	ba.city = io.ba_city and
	ba.stateorprovince = io.ba_stateorprovince and
	ba.postalcode = io.ba_postalcode and
	ba.country = io.ba_country and
	ba.phone = io.ba_phone and
	ba.company = io.ba_company
where
	ba.id is null and
	trim(both ' ' from io.ba_address) > ''  -- ignore empty address
group by
	ag.id,
	io.ba_address_type,
	io.ba_address,
	io.ba_address2,
	io.ba_city,
	io.ba_stateorprovince,
	io.ba_postalcode,
	io.ba_country,
	io.ba_phone,
	io.ba_company;

end;
$BODY$
  LANGUAGE plpgsql;
