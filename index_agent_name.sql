--
--	index_agent_name.sql
--

-- Index: ix_agent_name_agent_id

DROP INDEX IF EXISTS ix_agent_name_agent_id;

CREATE INDEX ix_agent_name_agent_id ON agent_name (agent_id);
