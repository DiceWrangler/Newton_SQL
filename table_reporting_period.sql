--
--  table_reporting_period.sql
--

-- Table: reporting_period
-- Sequence: seq_reporting_period_id

DROP SEQUENCE IF EXISTS seq_reporting_period_id CASCADE;

CREATE SEQUENCE seq_reporting_period_id;


DROP TABLE IF EXISTS reporting_period CASCADE;

CREATE TABLE reporting_period
(
  id integer NOT NULL DEFAULT nextval('seq_reporting_period_id'::regclass),
  type character varying,
  long_name character varying,
  short_name character varying,
  start_date date,
  end_date date,
  ordinal_value integer,
  CONSTRAINT pk_reporting_period PRIMARY KEY (id)
);
