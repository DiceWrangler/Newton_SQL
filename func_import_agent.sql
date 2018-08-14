--
--	func_import_agent.sql
--

-- Function: import_agent()

DROP FUNCTION IF EXISTS import_agent();

CREATE FUNCTION import_agent()
  RETURNS void AS
$BODY$
begin

insert into agent(
	email_address )
select
	io.email_address
from import_sale io
left outer join agent ag on
	ag.email_address = io.email_address
where
	ag.id is null
group by
	io.email_address;
	
end;
$BODY$
  LANGUAGE plpgsql;
