--
--  view_agent_addresses.sql
--

-- View: vagent_addresses

DROP VIEW IF EXISTS vagent_addresses;

CREATE VIEW vagent_addresses AS 

select
	id as "agent_address_id",
	agent_id as "agent_id",
	address_type as "address_type",
	address as "address1",
	address2 as "address2",
	city as "city",
	stateorprovince as "stateorprovince",
	postalcode as "postalcode",
	country as "country",
	phone as "phone",
	company as "company"
	
from agent_address
where
	hide is false;