--
--  view_customer_agents.sql
--

-- View: vcustomer_agents

DROP VIEW IF EXISTS vcustomer_agents;

CREATE VIEW vcustomer_agents AS 

select
	a.id as "agent_id",
	a.customer_id as "customer_id",
	a.name as "agent_name",
	a.email_address as "email_address"
from agent a
where
	a.hide is false
order by
	a.customer_id,
	coalesce(a.name, a.email_address);