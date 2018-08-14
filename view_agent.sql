--
--  view_agent.sql
--

-- View: vagent

DROP VIEW IF EXISTS vagent;

CREATE VIEW vagent AS 

select
	id as "agent_id",
	name as "agent_name",
	email_address as "email_address",
	hs_convo_count as "hs_num_convos",
	hs_thread_count as "hs_num_threads",
	hs_last_contact as "hs_last_contact"
	
from agent;