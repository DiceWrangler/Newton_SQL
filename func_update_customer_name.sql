--
--	func_update_customer_name.sql
--

-- Function: update_customer_name()

DROP FUNCTION IF EXISTS update_customer_name();

CREATE FUNCTION update_customer_name()
  RETURNS void AS
$BODY$
begin

with cn as (
select
	c.id as "customer_id",
	min(company) as "customer_name"
	
from customer c
inner join agent ag on ag.customer_id = c.id
inner join agent_address aa on
	aa.agent_id = ag.id and
	aa.address_type = 'shipping' and
	aa.company > ''
where
	(c.name is null or c.name = '')
group by
	c.id )

update customer as c set
	name = cn.customer_name
from cn
where
	(c.name is null or c.name = '') and
	cn.customer_id = c.id;

end;
$BODY$
  LANGUAGE plpgsql;
