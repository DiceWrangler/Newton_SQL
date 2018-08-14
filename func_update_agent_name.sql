--
--	func_update_agent_name.sql
--

-- Function: update_agent_name()

DROP FUNCTION IF EXISTS update_agent_name();

CREATE FUNCTION update_agent_name()
  RETURNS void AS
$BODY$
begin

with candidate_primary_name as (

with agents_with_no_primary_name as (
select
	a.id as "agent_id"
from  agent a
left outer join agent_name an on
	an.agent_id = a.id and
	an.primary_name
where
	an.id is null
group by
	a.id )

select
	an.agent_id,
	min(an.id) as "first_agent_name_id"
from agents_with_no_primary_name nn
inner join agent_name an on an.agent_id = nn.agent_id
group by
	an.agent_id )

update agent_name set primary_name = true
from candidate_primary_name pn
where agent_name.id = pn.first_agent_name_id;

update agent set name = an.name
from agent_name an
where
	agent.name is null and
	an.agent_id = agent.id and
	an.primary_name;
	
end;
$BODY$
  LANGUAGE plpgsql;