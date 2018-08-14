--
--	index_agent_feedback.sql
--

-- Index: ix_agent_feedback_agent_id

DROP INDEX IF EXISTS ix_agent_feedback_agent_id;

CREATE INDEX ix_agent_feedback_agent_id ON agent_feedback (agent_id);
