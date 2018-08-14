--
--	func_import_special_payment.sql
--

-- Function: import_special_payment()

DROP FUNCTION IF EXISTS import_special_payment();

CREATE FUNCTION import_special_payment()
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
email_address,
unique_tag,
total_amount,
sale_date,
sale_type,
source_table,
source_id )

select *
from dblink (
	'db_canopus',
	'select
	''shipping'' as "address_type",
	lower(first_name),
	lower(last_name),
	lower(address),
	lower(address2),
	lower(city),
	lower(stateorprovince),
	upper(postalcode),
	upper(country),
	lower(phone),
	lower(company),
	lower(email) as "email_address",
	upper(payment_tracking_id) as "unique_tag",
	(payment_amount_in_cents::numeric(15,2) / 100) as "total_amount",
	date_trunc(''day'', created_on) as "sale_date",
	''special'' as "sale_type",
	''lobe_specialpayment'' as "source_table",
	id as "source_id"

from lobe_specialpayment
where
	handled;' )

as import_special_payment(
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
  email_address character varying,
  unique_tag character varying,
  total_amount numeric(15,2),
  sale_date date,
  sale_type character varying,
  source_table character varying,
  source_id integer );

end;
$BODY$
  LANGUAGE plpgsql;
