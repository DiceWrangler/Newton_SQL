--
--  view_agent_names.sql
--

-- View: vagent_names

DROP VIEW IF EXISTS vagent_names;

CREATE VIEW vagent_names AS 

select
	id as "agent_name_id",
	agent_id as "agent_id",
	name as "agent_name",
	primary_name as "primary_name"
	
from agent_name
where
	hide is false
order by
	name;