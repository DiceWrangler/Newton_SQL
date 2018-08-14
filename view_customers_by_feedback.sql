--
--  view_customers_by_feedback.sql
--

-- View: vcustomers_by_feedback

DROP VIEW IF EXISTS vcustomers_by_feedback;

CREATE VIEW vcustomers_by_feedback AS

select
	c.id as "customer_id",
	coalesce(nullif(c.name, ''), c.email_domain) as "customer_name",
	ct.id as "customer_type_id",
	ct.description as "customer_type",
	f.feedback
from agent_feedback f
inner join agent a on
	a.id = f.agent_id and
	a.hide is false
inner join customer c on
	c.id = a.customer_id and
	c.hide is false
left outer join customer_type ct on ct.id = c.type_id
where
	f.hide is false and
	coalesce(ct.hide, false) is false
group by
	c.id,
	ct.id,
	ct.description,
	f.feedback
order by
	coalesce(nullif(c.name, ''), c.email_domain);
