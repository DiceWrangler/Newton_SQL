--
--  view_tags_active.sql
--

-- View: vtags_active

DROP VIEW IF EXISTS vtags_active;

CREATE VIEW vtags_active AS 

/*
need to UNION this result with customer-level tags
*/

with active_agent_tags as (
select
	t.id as "tag_id",
	'Agent' as "tag_level",
	count(*) as "tag_count"
from tag t
inner join agent_tag at on
	at.tag_id = t.id and
	at.hide is false
inner join agent a on
	a.id = at.agent_id and
	a.hide is false
inner join customer c on
	c.id = a.customer_id and
	c.hide is false
where
	t.hide is false
group by
	t.id)

select
	tag_id,
	tag,
	tag_level,
	source,
	tag_count
from active_agent_tags aat
inner join tag t on t.id = aat.tag_id
order by
	t.tag;