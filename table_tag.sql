--
--  table_tag.sql
--

-- Table: tag
-- Sequence: seq_tag_id

DROP SEQUENCE IF EXISTS seq_tag_id CASCADE;

CREATE SEQUENCE seq_tag_id;


DROP TABLE IF EXISTS tag CASCADE;

CREATE TABLE tag
(
  id integer NOT NULL DEFAULT nextval('seq_tag_id'::regclass),
  tag character varying NOT NULL,
  description character varying,
  source character varying DEFAULT 'Helpscout',
  auto_import boolean DEFAULT false,
  hide boolean DEFAULT false,
  CONSTRAINT pk_tag_id PRIMARY KEY (id),
  CONSTRAINT uk_tag_tag UNIQUE (tag)
);
