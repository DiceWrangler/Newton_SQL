--
--	index_agent_sale.sql
--

-- Index: ix_agent_sale_agent_id

DROP INDEX IF EXISTS ix_agent_sale_agent_id;

CREATE INDEX ix_agent_sale_agent_id ON agent_sale (agent_id);
