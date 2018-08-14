--
--	func_cleanup_agentless_customers.sql
--

-- Function: cleanup_agentless_customers()

DROP FUNCTION IF EXISTS cleanup_agentless_customers();

CREATE FUNCTION cleanup_agentless_customers()
  RETURNS void AS
$BODY$
begin

with agentless_customers as (
	select
		c.id as "customer_id"
	from customer c
	left outer join customer_type ct on ct.id = c.type_id
	left outer join agent a on a.customer_id = c.id
	where
		lower(coalesce(ct.description,'')) != 'exploded' and
		a.id is null )

update customer c set 
	type_id = ct.id
from agentless_customers ag
left outer join customer_type ct on lower(ct.description) = 'exploded'
where
	c.id = ag.customer_id;

end;
$BODY$
  LANGUAGE plpgsql;