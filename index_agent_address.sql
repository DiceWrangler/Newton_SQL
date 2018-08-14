--
--	index_agent_address.sql
--

-- Index: ix_agent_address_agent_id

DROP INDEX IF EXISTS ix_agent_address_agent_id;

CREATE INDEX ix_agent_address_agent_id ON agent_address (agent_id);
