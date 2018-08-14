--
--	func_import_agent_name.sql
--

-- Function: import_agent_name()

DROP FUNCTION IF EXISTS import_agent_name();

CREATE FUNCTION import_agent_name()
  RETURNS void AS
$BODY$
begin

insert into agent_name(
	agent_id,
	name )
select
	ag.id,
	trim(both ' ' from sa_first_name) || ' ' ||	trim(both ' ' from sa_last_name)
	
from import_sale io
inner join agent ag on
	ag.email_address = io.email_address
left outer join agent_name an on
	an.agent_id = ag.id and
	an.name = trim(both ' ' from sa_first_name) || ' ' || trim(both ' ' from sa_last_name)
where
	an.id is null and
	((trim(both ' ' from sa_first_name) > '') or (trim(both ' ' from sa_last_name) > ''))
group by
	ag.id,
	trim(both ' ' from sa_first_name) || ' ' ||	trim(both ' ' from sa_last_name);
	
end;
$BODY$
  LANGUAGE plpgsql;
