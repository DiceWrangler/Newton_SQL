--
--	func_set_primary_agent_name.sql
--

-- Function: set_primary_agent_name()

DROP FUNCTION IF EXISTS set_primary_agent_name();

CREATE FUNCTION set_primary_agent_name()
  RETURNS trigger AS
$BODY$
begin

update agent_name set
	primary_name = false
where
	id != NEW.id and
	agent_id = NEW.agent_id and
	primary_name is true;
	
	
end;
$BODY$
  LANGUAGE plpgsql;
