--
--  view_customer_tags.sql
--

-- View: vcustomer_tags

DROP VIEW IF EXISTS vcustomer_tags;

CREATE VIEW vcustomer_tags AS 

select
	at.id as "agent_tag_id",
	a.customer_id as "customer_id",
	t.source as "source",
	t.tag as "tag"
	
from agent a
inner join agent_tag at on
	at.agent_id = a.id and
	at.hide is false
inner join tag t on
	t.id = at.tag_id and
	t.hide is false
group by
	a.customer_id,
	t.source,
	t.tag
order by
	a.customer_id,
	t.source,
	t.tag;