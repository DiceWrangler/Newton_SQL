--
--  func_register_customer.sql
--

-- Function: register_customer()

DROP FUNCTION IF EXISTS register_customer(
	character varying,
	character varying,
	integer,
	boolean );

CREATE FUNCTION register_customer(
	pemail_domain character varying,
	pname character varying default NULL,
	ptype_id integer default NULL,
	phide boolean default NULL )
  RETURNS integer AS

$BODY$
  DECLARE
	vcustomer_id integer;
	vname character varying;
	vtype_id integer;
	vhide boolean;

  BEGIN
  
  	UPDATE customer SET
		name = coalesce(pname, name),
		type_id = coalesce(ptype_id, type_id),
		hide = coalesce(phide, hide)
	WHERE email_domain = pemail_domain
	RETURNING id INTO vcustomer_id; 
		
    IF vcustomer_id IS NULL THEN
	
	-- default values
		vname = coalesce(pname, pemail_domain);
		vtype_id = ptype_id;  -- default to NULL
		vhide = coalesce(phide, false);
	
      INSERT INTO customer(
		id,
		email_domain,
		name,
		type_id,
		hide )
		VALUES (
		DEFAULT,
		pemail_domain,
		pname,
		ptype_id,
		vhide )
      RETURNING id INTO vcustomer_id;
	  
    END IF;

    RETURN vcustomer_id;

  END;
$BODY$
  LANGUAGE plpgsql;
