/*
	script_import_all.sql

*/

select import_order();
select import_special_payment();
select import_agent();
select import_agent_name();
select update_agent_name();
select import_tag();
select import_agent_tag();
select import_agent_feedback();
select import_address_billing();
select import_address_shipping();
select import_customer();
select update_agent_customer_id();
select update_customer_name();
select import_agent_sale();


/*
	Intentionally NOT executed within this script:

register_*()	
update_agent_hs_stats()

*/