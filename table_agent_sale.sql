--
--  table_agent_sale.sql
--

-- Table: agent_sale
-- Sequence: seq_agent_sale_id

DROP SEQUENCE IF EXISTS seq_agent_sale_id CASCADE;

CREATE SEQUENCE seq_agent_sale_id;


DROP TABLE IF EXISTS agent_sale CASCADE;

CREATE TABLE agent_sale
(
  id integer NOT NULL DEFAULT nextval('seq_agent_sale_id'::regclass),
  agent_id integer,
  sale_date date,
  sale_type character varying,
  brand character varying,
  total_amount numeric(15,2),
  unique_tag character varying,
  source_table character varying,
  source_id integer,
  CONSTRAINT pk_agent_sale PRIMARY KEY (id)
);
