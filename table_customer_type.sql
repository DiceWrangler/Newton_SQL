--
--  table_customer_type.sql
--

-- Table: customer_type
-- Sequence: seq_customer_type_id

DROP SEQUENCE IF EXISTS seq_customer_type_id CASCADE;

CREATE SEQUENCE seq_customer_type_id;


DROP TABLE IF EXISTS customer_type CASCADE;

CREATE TABLE customer_type
(
  id integer NOT NULL DEFAULT nextval('seq_customer_type_id'::regclass),
  description character varying NOT NULL,
  hide boolean DEFAULT false,
  CONSTRAINT pk_customer_type PRIMARY KEY (id)
);
