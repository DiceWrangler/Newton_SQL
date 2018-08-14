--
--  view_customers_by_sales_lifetime.sql
--

-- View: vcustomers_by_sales_lifetime

DROP VIEW IF EXISTS vcustomers_by_sales_lifetime;

CREATE VIEW vcustomers_by_sales_lifetime AS

select
	c.id as "customer_id",
	coalesce(nullif(c.name, ''), c.email_domain) as "customer_name",
	ct.id as "customer_type_id",
	ct.description as "customer_type",
	min(sale_date) as "first_sale",
	max(sale_date) as "last_sale",
	sum(total_amount) as "total_amount",
	count(*) as "num_sales",
	rpad(coalesce(nullif(c.name, ''), c.email_domain), 40) || ' ' || rpad(ct.description, 15) || ' ' || to_char(min(sale_date), 'YYYY-MM-DD') || ' ' || to_char(max(sale_date), 'YYYY-MM-DD') || ' ' || to_char(sum(total_amount), '$99,999') || ' ' || to_char(count(*), '999') as "display"
from customer c
inner join agent a on
	a.customer_id = c.id and
	a.hide is false
inner join agent_sale s on
	s.agent_id = a.id
left outer join customer_type ct on
	ct.id = c.type_id
where
	c.hide is false and
	coalesce(ct.hide, false) is false
group by
	c.id,
	ct.id
order by
	total_amount desc;
