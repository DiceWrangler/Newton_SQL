--
--	index_agent.sql
--

-- Constraint: uk_agent_email_address

ALTER TABLE agent DROP CONSTRAINT IF EXISTS uk_agent_email_address;

ALTER TABLE agent ADD CONSTRAINT uk_agent_email_address UNIQUE (email_address);


-- Index: ix_agent_customer_id

DROP INDEX IF EXISTS ix_agent_customer_id;

CREATE INDEX ix_agent_customer_id ON agent (customer_id);
