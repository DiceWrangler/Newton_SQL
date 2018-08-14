--
--  table_agent_feedback.sql
--

-- Table: agent_feedback
-- Sequence: seq_agent_feedback_id

DROP SEQUENCE IF EXISTS seq_agent_feedback_id CASCADE;

CREATE SEQUENCE seq_agent_feedback_id;


DROP TABLE IF EXISTS agent_feedback CASCADE;

CREATE TABLE agent_feedback
(
  id integer NOT NULL DEFAULT nextval('seq_agent_feedback_id'::regclass),
  agent_id integer,
  feedback character varying,
  order_id integer,
  hide boolean DEFAULT false,
  CONSTRAINT pk_agent_feedback PRIMARY KEY (id)
);
