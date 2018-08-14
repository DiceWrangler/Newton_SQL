--
--	func_register_tag.sql
--

-- Function: register_tag()

DROP FUNCTION IF EXISTS register_tag(
	character varying,
	character varying,
	character varying,
	boolean,
	boolean );

CREATE FUNCTION register_tag(
	ptag character varying,
	pdescription character varying default NULL,
	psource character varying default NULL,
	pauto_import boolean default NULL,
	phide boolean default NULL)
  RETURNS integer AS

$BODY$
  DECLARE
	vtagid integer;
	vsource character varying;
	vauto_import boolean;
	vhide boolean;

  BEGIN

	UPDATE tag SET
		description = coalesce(pdescription, description),
		source = coalesce(psource, source),
		auto_import = coalesce(pauto_import, auto_import),
		hide = coalesce(phide, hide)
	WHERE tag = ptag
	RETURNING id INTO vtagid; 
		
    IF vtagid IS NULL THEN
	
	-- default values
		vsource = coalesce(psource, 'Helpscout');
		vauto_import = coalesce(pauto_import, true);
		vhide = coalesce(phide, false);
	
      INSERT INTO tag(
		id,
		tag,
		description,
		source,
		auto_import,
		hide )
		VALUES (
		DEFAULT,
		ptag,
		pdescription,
		vsource,
		vauto_import,
		vhide )
      RETURNING id INTO vtagid;
	  
    END IF;

    RETURN vtagid;

  END;
$BODY$
  LANGUAGE plpgsql;
