--
--	func_import_order.sql
--

-- Function: import_order()

DROP FUNCTION IF EXISTS import_order();

CREATE FUNCTION import_order()
  RETURNS void AS
$BODY$
begin

insert into import_sale (
sa_address_type,
sa_first_name,
sa_last_name,
sa_address,
sa_address2,
sa_city,
sa_stateorprovince,
sa_postalcode,
sa_country,
sa_phone,
sa_company,
ba_address_type,
ba_first_name,
ba_last_name,
ba_address,
ba_address2,
ba_city,
ba_stateorprovince,
ba_postalcode,
ba_country,
ba_phone,
ba_company,
email_address,
unique_tag,
total_amount,
sale_date,
sale_type,
brand,
source_table,
source_id )

select *
from dblink (
	'db_canopus',
	'select
	lower(sa.type) as "address_type",
	lower(sa.first_name),
	lower(sa.last_name),
	lower(sa.address),
	lower(sa.address2),
	lower(sa.city),
	lower(sa.stateorprovince),
	upper(sa.postalcode),
	upper(sa.country),
	lower(sa.phone),
	lower(sa.company),
	lower(ba.type) as "address_type",
	lower(ba.first_name),
	lower(ba.last_name),
	lower(ba.address),
	lower(ba.address2),
	lower(ba.city),
	lower(ba.stateorprovince),
	upper(ba.postalcode),
	upper(ba.country),
	lower(ba.phone),
	lower(ba.company),
	lower(u.email),
	upper(o.unique_tag),
	o.total_amount,
	date_trunc(''day'', p.created_on) as "sale_date",
	case
		when o.brand = ''canvas'' and o.precommit_fulfiller = ''OCC_DIGITAL'' then ''service''
		else ''product''
	end as "sale_type",
	lower(o.brand),
	''robotarm_order'' as "source_table",
	o.id as "source_id"

from robotarm_order o
inner join robotarm_payment p on  -- payment is required
	p.order_id = o.id and
	p.payment_status = ''capture_success''
inner join auth_user u on  -- lookup email address
	u.id = o.user_id
left outer join robotarm_address sa on  -- shipping address is optional
	sa.user_id = o.user_id and
	sa.type = ''shipping'' and
	sa.active
left outer join robotarm_address ba on  -- billing address is optional
	ba.user_id = o.user_id and
	ba.type = ''billing'' and
	ba.active
	
where
	o.hold_order is false
order by
	o.created_on desc;' )

as import_order(
  sa_address_type character varying,
  sa_first_name character varying,
  sa_last_name character varying,
  sa_address character varying,
  sa_address2 character varying,
  sa_city character varying,
  sa_stateorprovince character varying,
  sa_postalcode character varying,
  sa_country character varying,
  sa_phone character varying,
  sa_company character varying,
  ba_address_type character varying,
  ba_first_name character varying,
  ba_last_name character varying,
  ba_address character varying,
  ba_address2 character varying,
  ba_city character varying,
  ba_stateorprovince character varying,
  ba_postalcode character varying,
  ba_country character varying,
  ba_phone character varying,
  ba_company character varying,
  email_address character varying,
  unique_tag character varying,
  total_amount numeric(15,2),
  sale_date date,
  sale_type character varying,
  brand character varying,
  source_table character varying,
  source_id integer );

end;
$BODY$
  LANGUAGE plpgsql;
