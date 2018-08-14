--
--  view_customer_sales.sql
--

-- View: vcustomer_sales

DROP VIEW IF EXISTS vcustomer_sales;

CREATE VIEW vcustomer_sales AS 
select
	a.customer_id,
	s.sale_date,
	s.sale_type,
	s.brand,
	s.unique_tag,
	s.total_amount
from agent_sale s
inner join agent a on
	a.id = s.agent_id
order by
	a.customer_id,
	s.sale_date,
	s.sale_type;