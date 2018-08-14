--
--  table_agent_name.sql
--

-- Table: agent_name
-- Sequence: seq_agent_name_id

DROP SEQUENCE IF EXISTS seq_agent_name_id CASCADE;

CREATE SEQUENCE seq_agent_name_id;


DROP TABLE IF EXISTS agent_name CASCADE;

CREATE TABLE agent_name
(
  id integer NOT NULL DEFAULT nextval('seq_agent_name_id'::regclass),
  agent_id integer NOT NULL,
  name character varying,
  primary_name boolean DEFAULT FALSE,
  hide boolean DEFAULT FALSE,
  CONSTRAINT pk_agent_name PRIMARY KEY (id)
);
