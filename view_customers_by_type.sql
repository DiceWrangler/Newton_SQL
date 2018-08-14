--
--  view_customers_by_type.sql
--

-- View: vcustomers_by_type

DROP VIEW IF EXISTS vcustomers_by_type;

CREATE VIEW vcustomers_by_type AS

select
	ct.id as "customer_type_id",
	ct.description as "customer_type",
	c.id as "customer_id",
	coalesce(nullif(c.name, ''), c.email_domain) as "customer_name"
	
from customer c
left outer join customer_type ct on ct.id = c.type_id
where
	c.hide is false
order by
	customer_type,
	coalesce(nullif(c.name, ''), c.email_domain);
