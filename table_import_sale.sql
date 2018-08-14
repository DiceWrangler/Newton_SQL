--
--  table_import_sale.sql
--

-- Table: import_sale
-- Sequence: seq_import_sale_id

DROP SEQUENCE IF EXISTS seq_import_sale_id CASCADE;

CREATE SEQUENCE seq_import_sale_id;


DROP TABLE IF EXISTS import_sale CASCADE;

CREATE TABLE import_sale
(
  id integer NOT NULL DEFAULT nextval('seq_import_sale_id'::regclass),
  sa_address_type character varying,
  sa_first_name character varying,
  sa_last_name character varying,
  sa_address character varying,
  sa_address2 character varying,
  sa_city character varying,
  sa_stateorprovince character varying,
  sa_postalcode character varying,
  sa_country character varying,
  sa_phone character varying,
  sa_company character varying,
  ba_address_type character varying,
  ba_first_name character varying,
  ba_last_name character varying,
  ba_address character varying,
  ba_address2 character varying,
  ba_city character varying,
  ba_stateorprovince character varying,
  ba_postalcode character varying,
  ba_country character varying,
  ba_phone character varying,
  ba_company character varying,
  email_address character varying NOT NULL,
  unique_tag character varying NOT NULL,
  total_amount numeric(15,2),
  sale_date date,
  sale_type character varying,
  brand character varying,
  source_table character varying,
  source_id integer,
  CONSTRAINT pk_import_sale PRIMARY KEY (id)
);
