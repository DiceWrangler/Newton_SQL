--
--  func_register_agent_name.sql
--

-- Function: register_agent_name()

DROP FUNCTION IF EXISTS register_agent_name(
	integer,
	character varying,
	boolean,
	boolean );

CREATE FUNCTION register_agent_name(
	pagent_id integer,
	pname character varying,
	pprimary_name boolean default NULL,
	phide boolean default NULL )
  RETURNS integer AS

$BODY$
  DECLARE
	vagent_name_id integer;
	vprimary_name boolean;
	vhide boolean;

  BEGIN
  
  	UPDATE agent_name SET
		primary_name = coalesce(pprimary_name, primary_name),
		hide = coalesce(phide, hide)
	WHERE
		agent_id = pagent_id and
		name = pname
	RETURNING id INTO vagent_name_id; 
		
    IF vagent_name_id IS NULL THEN
	
	-- default values
		vprimary_name = coalesce(pprimary_name, false);
		vhide = coalesce(phide, false);
	
      INSERT INTO agent_name(
		id,
		agent_id,
		name,
		primary_name,
		hide )
		VALUES (
		DEFAULT,
		pagent_id,
		pname,
		vprimary_name,
		vhide )
      RETURNING id INTO vagent_name_id;
	  
    END IF;

    RETURN vagent_name_id;

  END;
$BODY$
  LANGUAGE plpgsql;
