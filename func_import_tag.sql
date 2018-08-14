--
--	func_import_tag.sql
--

-- Function: import_tag()

DROP FUNCTION IF EXISTS import_tag();

CREATE FUNCTION import_tag()
  RETURNS void AS
$BODY$
begin

truncate table tag;

insert into tag(
	tag,
	source
)
select
	tag_list,
	'order'
from dblink (
	'db_canopus',
	'select tags from reports_customertag group by tags'
	) as
	tags(tag_list character varying);

end;
$BODY$
  LANGUAGE plpgsql;
