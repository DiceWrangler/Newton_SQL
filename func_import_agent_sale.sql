--
--	func_import_agent_sale.sql
--

-- Function: import_agent_sale()

DROP FUNCTION IF EXISTS import_agent_sale();

CREATE FUNCTION import_agent_sale()
  RETURNS void AS
$BODY$
begin

insert into agent_sale(
  agent_id,
  unique_tag,
  total_amount,
  sale_date,
  sale_type,
  brand,
  source_table,
  source_id )
select
  ag.id,
  io.unique_tag,
  io.total_amount,
  io.sale_date,
  io.sale_type,
  io.brand,
  io.source_table,
  io.source_id

from import_sale io
inner join agent ag on
	ag.email_address = io.email_address
left outer join agent_sale s on
	s.agent_id = ag.id and
	s.unique_tag = io.unique_tag and
  s.total_amount = io.total_amount and
  s.sale_date = io.sale_date and
  s.sale_type = io.sale_type and
  s.source_table = io.source_table and
  s.source_id = io.source_id
where
	s.id is null
group by
	ag.id,
  io.unique_tag,
  io.total_amount,
  io.sale_date,
  io.sale_type,
  io.brand,
  io.source_table,
  io.source_id;

end;
$BODY$
  LANGUAGE plpgsql;
