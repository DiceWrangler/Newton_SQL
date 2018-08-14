--
--  view_agent_sales.sql
--

-- View: vagent_sales

DROP VIEW IF EXISTS vagent_sales;

CREATE VIEW vagent_sales AS 

select
	s.agent_id as "agent_id",
	s.sale_date as "sale_date",
	s.sale_type as "sale_type",
	s.brand as "brand",
	s.unique_tag as "unique_tag",
	s.total_amount as "total_amount"
	
from agent_sale s;
