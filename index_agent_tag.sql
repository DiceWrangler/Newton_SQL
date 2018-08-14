--
--	index_agent_tag.sql
--

-- Index: ix_agent_tag_agent_id

DROP INDEX IF EXISTS ix_agent_tag_agent_id;

CREATE INDEX ix_agent_tag_agent_id ON agent_tag (agent_id);


-- Index: ix_agent_tag_tag_id

DROP INDEX IF EXISTS ix_agent_tag_tag_id;

CREATE INDEX ix_agent_tag_tag_id ON agent_tag (tag_id);
