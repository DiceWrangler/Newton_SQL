--
--  table_customer.sql
--

-- Table: customer
-- Sequence: seq_customer_id

DROP SEQUENCE IF EXISTS seq_customer_id CASCADE;

CREATE SEQUENCE seq_customer_id;


DROP TABLE IF EXISTS customer CASCADE;

CREATE TABLE customer
(
  id integer NOT NULL DEFAULT nextval('seq_customer_id'::regclass),
  name character varying,
  email_domain character varying,
  type_id integer,
  prospect boolean,
  hide boolean DEFAULT false,
  override_type boolean DEFAULT false,
  CONSTRAINT pk_customer PRIMARY KEY (id)
);
