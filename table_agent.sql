--
--  table_agent.sql
--

-- Table: agent
-- Sequence: seq_agent_id

DROP SEQUENCE IF EXISTS seq_agent_id CASCADE;

CREATE SEQUENCE seq_agent_id;


DROP TABLE IF EXISTS agent CASCADE;

CREATE TABLE agent
(
  id integer NOT NULL DEFAULT nextval('seq_agent_id'::regclass),
  customer_id integer,
  email_address character varying NOT NULL,
  name character varying,
  hide boolean DEFAULT false,
  hs_convo_count integer,
  hs_thread_count integer,
  hs_last_contact date,
  CONSTRAINT pk_agent PRIMARY KEY (id)
);
