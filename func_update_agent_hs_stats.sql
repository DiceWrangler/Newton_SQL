--
--  func_update_agent_hs_stats.sql
--

-- Function: update_agent_hs_stats()

DROP FUNCTION IF EXISTS update_agent_hs_stats(
	character varying,
	integer,
	integer,
	date );

CREATE FUNCTION update_agent_hs_stats(
	pemail_address character varying,
	pconvo_count integer default NULL,
	pthread_count integer default NULL,
	plast_contact date default NULL)
  RETURNS integer AS

$BODY$
  DECLARE
	vagent_id integer;

  BEGIN
  
  	UPDATE agent SET
		hs_convo_count = coalesce(pconvo_count, hs_convo_count),
		hs_thread_count = coalesce(pthread_count, hs_thread_count),
		hs_last_contact = coalesce(plast_contact, hs_last_contact)
	WHERE email_address = pemail_address
	RETURNING id INTO vagent_id; 
		
    RETURN vagent_id;

  END;
$BODY$
  LANGUAGE plpgsql;
