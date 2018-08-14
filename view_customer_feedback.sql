--
--  view_customer_feedback.sql
--

-- View: vcustomer_feedback

DROP VIEW IF EXISTS vcustomer_feedback;

CREATE VIEW vcustomer_feedback AS 
select
	a.customer_id,
	af.feedback
from agent a
inner join agent_feedback af on
	af.agent_id = a.id
order by
	a.customer_id,
	af.feedback;
