--
--	func_import_agent_feedback.sql
--

-- Function: import_agent_feedback()

DROP FUNCTION IF EXISTS import_agent_feedback();

CREATE FUNCTION import_agent_feedback()
  RETURNS void AS
$BODY$
begin

truncate table agent_feedback;

insert into agent_feedback(
	agent_id,
	feedback,
	order_id
)
select
	a.id as "agent_id",
	feedback,
	order_id
from dblink (
	'db_canopus',
	'select email, feedback, order_id
	from reports_sensorusecasefeedback f
	inner join robotarm_order o on o.id = f.order_id
	inner join auth_user u on u.id = o.user_id'
	) as order_feedback(
	email_address character varying,
	feedback character varying,
	order_id integer)
inner join agent a on a.email_address = order_feedback.email_address;

end;
$BODY$
  LANGUAGE plpgsql;
