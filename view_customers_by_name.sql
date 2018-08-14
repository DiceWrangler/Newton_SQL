--
--  view_customers_by_name.sql
--

-- View: vcustomers_by_name

DROP VIEW IF EXISTS vcustomers_by_name;

CREATE VIEW vcustomers_by_name AS

select
	c.id as "customer_id",
	coalesce(nullif(c.name, ''), c.email_domain) as "customer_name",
	ct.description as "customer_type"
	
from customer c
left outer join customer_type ct on ct.id = c.type_id
where
	c.hide is false and
	coalesce(ct.hide, false) is false
order by
	coalesce(nullif(c.name, ''), c.email_domain);
