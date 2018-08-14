--
--  table_customer_tag.sql
--

-- Table: customer_tag
-- Sequence: seq_customer_tag_id

DROP SEQUENCE IF EXISTS seq_customer_tag_id CASCADE;

CREATE SEQUENCE seq_customer_tag_id;


DROP TABLE IF EXISTS customer_tag CASCADE;

CREATE TABLE customer_tag
(
  id integer NOT NULL DEFAULT nextval('seq_customer_tag_id'::regclass),
  customer_id integer,
  tag_id integer,
  hide boolean DEFAULT false,
  CONSTRAINT pk_customer_tag PRIMARY KEY (id)
);
