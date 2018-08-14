--
--  table_agent_tag.sql
--

-- Table: agent_tag
-- Sequence: seq_agent_tag_id

DROP SEQUENCE IF EXISTS seq_agent_tag_id CASCADE;

CREATE SEQUENCE seq_agent_tag_id;


DROP TABLE IF EXISTS agent_tag CASCADE;

CREATE TABLE agent_tag
(
  id integer NOT NULL DEFAULT nextval('seq_agent_tag_id'::regclass),
  agent_id integer,
  tag_id integer,
  hide boolean DEFAULT false,
  CONSTRAINT pk_agent_tag PRIMARY KEY (id)
);
