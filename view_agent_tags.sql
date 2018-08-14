--
--  view_agent_tags.sql
--

-- View: vagent_tags

DROP VIEW IF EXISTS vagent_tags;

CREATE VIEW vagent_tags AS 

select
	at.id as "agent_tag_id",
	agent_id as "agent_id",
	t.source as "source",
	t.tag as "tag"
	
from agent_tag at
inner join tag t on
	t.id = at.tag_id and
	t.hide is false
where
	at.hide is false
order by
	t.tag;
