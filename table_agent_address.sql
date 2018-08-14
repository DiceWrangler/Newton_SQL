--
--  table_agent_address.sql
--

-- Table: agent_address
-- Sequence: seq_agent_address_id

DROP SEQUENCE IF EXISTS seq_agent_address_id CASCADE;

CREATE SEQUENCE seq_agent_address_id;


DROP TABLE IF EXISTS agent_address CASCADE;

CREATE TABLE agent_address
(
  id integer NOT NULL DEFAULT nextval('seq_agent_address_id'::regclass),
  agent_id integer,
  address_type character varying,
  address character varying,
  address2 character varying,
  city character varying,
  stateorprovince character varying,
  postalcode character varying,
  country character varying,
  phone character varying, -- split into [agent_phone]?
  company character varying,
  hide boolean DEFAULT false,
  CONSTRAINT pk_agent_address PRIMARY KEY (id)
);
