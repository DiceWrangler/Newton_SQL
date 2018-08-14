--
--	func_update_agent_customer_id.sql
--

-- Function: update_agent_customer_id()

DROP FUNCTION IF EXISTS update_agent_customer_id();

CREATE FUNCTION update_agent_customer_id()
  RETURNS void AS
$BODY$
begin

/*
	attempt to associate all unassociated agents with an existing non-individual customer
*/
update agent a set
	customer_id = c.id
from customer c
where
	a.customer_id is null and
	c.email_domain = substring(a.email_address from position('@' in email_address)+1);


/*
	create new individual customers for remaining unassociated agents
*/
insert into customer (
	name,
	email_domain,
	type_id )
select
	a.name,
	a.email_address,
	ct.id as "customer_type_id"
from agent a
left outer join customer_type ct on lower(ct.description) = 'individual'
where
	a.customer_id is null;

	
/*
	attempt to associate all unassociated agents with a (newly created) individual customer
*/
update agent a set
	customer_id = c.id
from customer c
where
	a.customer_id is null and
	c.email_domain = a.email_address;

end;
$BODY$
  LANGUAGE plpgsql;
