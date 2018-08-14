--
--  func_register_customer_type.sql
--

-- Function: register_customer_type()

DROP FUNCTION IF EXISTS register_customer_type(
	character varying,
	boolean );

CREATE FUNCTION register_customer_type(
	pdescription character varying,
	phide boolean default NULL )
  RETURNS integer AS

$BODY$
  DECLARE
	vcustomer_type_id integer;
	vhide boolean;

  BEGIN
  
  	UPDATE customer_type SET
		hide = coalesce(phide, hide)
	WHERE description = pdescription
	RETURNING id INTO vcustomer_type_id; 
		
    IF vcustomer_type_id IS NULL THEN
	
	-- default values
		vhide = coalesce(phide, false);
	
      INSERT INTO customer_type(
		id,
		description,
		hide )
		VALUES (
		DEFAULT,
		pdescription,
		vhide )
      RETURNING id INTO vcustomer_type_id;
	  
    END IF;

    RETURN vcustomer_type_id;

  END;
$BODY$
  LANGUAGE plpgsql;
