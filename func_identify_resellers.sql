--
--	func_identify_resellers.sql
--

-- Function: identify_resellers()

DROP FUNCTION IF EXISTS identify_resellers();

CREATE FUNCTION identify_resellers()
  RETURNS void AS
$BODY$
begin

with customers_with_only_special_payments as (

select distinct a.customer_id
from agent_sale s
inner join agent a on a.id = s.agent_id
where
	s.sale_type = 'special'

except

select distinct a.customer_id
from agent_sale s
inner join agent a on a.id = s.agent_id
where
	s.sale_type != 'special' )

update customer c set type_id = ct.id
from customers_with_only_special_payments as sp
inner join customer_type ct on ct.description = 'reseller'
where
	c.id = sp.customer_id and
	c.override_type is false;
	
end;
$BODY$
  LANGUAGE plpgsql;