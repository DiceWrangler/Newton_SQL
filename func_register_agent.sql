--
--  func_register_agent.sql
--

-- Function: register_agent()

DROP FUNCTION IF EXISTS register_agent(
	character varying,
	boolean );

CREATE FUNCTION register_agent(
	pemail_address character varying,
	phide boolean default NULL )
  RETURNS integer AS

$BODY$
  DECLARE
	vagent_id integer;
	vhide boolean;

  BEGIN
  
  	UPDATE agent SET
		hide = coalesce(phide, hide)
	WHERE email_address = pemail_address
	RETURNING id INTO vagent_id; 
		
    IF vagent_id IS NULL THEN
	
	-- default values
		vhide = coalesce(phide, false);
	
      INSERT INTO agent(
		id,
		email_address,
		hide )
		VALUES (
		DEFAULT,
		pemail_address,
		vhide )
      RETURNING id INTO vagent_id;
	  
    END IF;

    RETURN vagent_id;

  END;
$BODY$
  LANGUAGE plpgsql;
