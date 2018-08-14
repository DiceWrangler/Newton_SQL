--
--	index_customer_tag.sql
--

-- Index: ix_customer_tag_customer_id

DROP INDEX IF EXISTS ix_customer_tag_customer_id;

CREATE INDEX ix_customer_tag_customer_id ON customer_tag (customer_id);


-- Index: ix_customer_tag_tag_id

DROP INDEX IF EXISTS ix_customer_tag_tag_id;

CREATE INDEX ix_customer_tag_tag_id ON customer_tag (tag_id);
