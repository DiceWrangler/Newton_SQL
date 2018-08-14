--
--	func_import_agent_tag.sql
--

-- Function: import_agent_tag()

DROP FUNCTION IF EXISTS import_agent_tag();

CREATE FUNCTION import_agent_tag()
  RETURNS void AS
$BODY$
begin

truncate table agent_tag;

insert into agent_tag(
	agent_id,
	tag_id
)
select
	a.id as "agent_id",
	t.id as "tag_id"
from dblink (
	'db_canopus',
	'select lower(email), tags from reports_customertag'
	) as email_tag(
	email_address character varying,
	tag character varying)
inner join agent a on
	a.email_address = email_tag.email_address
inner join tag t on
	t.tag = email_tag.tag;


end;
$BODY$
  LANGUAGE plpgsql;
