--
--	index_customer.sql
--

-- Constraint: uk_customer_email_domain

ALTER TABLE customer DROP CONSTRAINT IF EXISTS uk_customer_email_domain;

ALTER TABLE customer ADD CONSTRAINT uk_customer_email_domain UNIQUE (email_domain);
