--
--  view_customer.sql
--

-- View: vcustomer

DROP VIEW IF EXISTS vcustomer;

CREATE VIEW vcustomer AS 

select
	c.id as "customer_id",
	c.name as "customer_name",
	c.email_domain,
	ct.description as "customer_type",
	c.prospect
	
from customer c
left outer join customer_type ct on ct.id = c.type_id
order by
	coalesce(nullif(c.name,''), c.email_domain);