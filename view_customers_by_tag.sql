--
--  view_customers_by_tag.sql
--

-- View: vcustomers_by_tag

DROP VIEW IF EXISTS vcustomers_by_tag;

CREATE VIEW vcustomers_by_tag AS

select
	c.id as "customer_id",
	coalesce(nullif(c.name, ''), c.email_domain) as "customer_name",
	ct.description as "customer_type",
	at.tag_id as "tag_id",
	t.tag as "tag"
	
from agent_tag at
inner join tag t on
	t.id = at.tag_id and
	t.hide is false
inner join agent a on
	a.id = at.agent_id and
	a.hide is false
inner join customer c on
	c.id = a.customer_id and
	c.hide is false
left outer join customer_type ct on
	ct.id = c.type_id
where
	coalesce(ct.hide, false) is false
group by
	c.id,
	ct.description,
	at.tag_id,
	t.tag
order by
	coalesce(nullif(c.name, ''), c.email_domain),
	t.tag;
