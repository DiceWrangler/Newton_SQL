--
--  func_register_agent_tag.sql
--

-- Function: register_agent_tag()

DROP FUNCTION IF EXISTS register_agent_tag(
	integer,
	integer );

CREATE FUNCTION register_agent_tag(
	pagent_id integer,
	ptag_id integer )
  RETURNS integer AS

$BODY$
  DECLARE vagent_tag_id integer;

  BEGIN

	SELECT id INTO vagent_tag_id FROM agent_tag WHERE agent_id = pagent_id and tag_id = ptag_id;
	 
    IF vagent_tag_id IS NULL THEN
		
      INSERT INTO agent_tag(
		id,
		agent_id,
		tag_id )
	  VALUES (
		DEFAULT,
		pagent_id,
		ptag_id )
      RETURNING id INTO vagent_tag_id;
	  
    END IF;

    RETURN vagent_tag_id;

  END;
$BODY$
  LANGUAGE plpgsql;
