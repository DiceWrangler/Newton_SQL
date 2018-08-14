--
--  table_public_email_domain.sql
--

-- Table: public_email_domain
-- Sequence: seq_public_email_domain_id

DROP SEQUENCE IF EXISTS seq_public_email_domain_id CASCADE;

CREATE SEQUENCE seq_public_email_domain_id;


DROP TABLE IF EXISTS public_email_domain CASCADE;

CREATE TABLE public_email_domain
(
  id integer NOT NULL DEFAULT nextval('seq_public_email_domain_id'::regclass),
  email_domain character varying NOT NULL,
  CONSTRAINT pk_public_email_domain PRIMARY KEY (id)
);
