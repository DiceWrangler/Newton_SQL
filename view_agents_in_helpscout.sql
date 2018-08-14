--
--  view_agents_in_helpscout.sql
--

-- View: vagents_in_helpscout

DROP VIEW IF EXISTS vagents_in_helpscout;

CREATE VIEW vagents_in_helpscout AS
select
	a.id as "agent_id",
	a.email_address
from tag t
inner join agent_tag at on at.tag_id = t.id
inner join agent a on a.id = at.agent_id
where
	t.source = 'Helpscout'
group by
	a.id,
	a.email_address
order by
	a.email_address;
