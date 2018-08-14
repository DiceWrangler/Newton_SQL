--
--	func_customer_sales_by_date_range.sql
--

-- Function: customer_sales_by_date_range()

DROP FUNCTION IF EXISTS customer_sales_by_date_range(
	date,
	date,
	integer );

CREATE FUNCTION customer_sales_by_date_range(
	plowdate date,
	phighdate date,
	pcustomer_type_id integer default 0 )	
RETURNS TABLE (
	customer_id integer,
	customer_name character varying,
	customer_type_id integer,
	customer_type character varying,
	first_sale date,
	last_sale date,
	total_amount numeric(15,2),
	num_sales integer,
	display character varying ) AS $BODY$
	
SELECT
	c.id as "customer_id",
	coalesce(nullif(c.name, ''), c.email_domain) as "customer_name",
	ct.id as "customer_type_id",
	ct.description as "customer_type",
	min(s.sale_date) as "first_sale",
	max(s.sale_date) as "last_sale",
	sum(s.total_amount) as "total_amount",
	count(*)::integer as "num_sales",
	rpad(coalesce(nullif(c.name, ''), c.email_domain), 40) || ' ' || rpad(ct.description, 15) || ' ' || to_char(min(s.sale_date), 'YYYY-MM-DD') || ' ' || to_char(max(s.sale_date), 'YYYY-MM-DD') || ' ' || to_char(sum(s.total_amount), '$99,999') || ' ' || to_char(count(*), '999') as "display"

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
	coalesce(ct.hide, false) is false and
	s.sale_date between $1 and $2 and
	(ct.id = $3 or $3 = 0)  -- optional filter by customer type id; 0 = Any
group by
	c.id,
	ct.id
order by
	total_amount desc;
	
$BODY$
LANGUAGE SQL;
