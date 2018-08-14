--
--	script_truncate_all.sql
--

truncate table import_sale;
truncate table agent_address;
truncate table agent_sale;
truncate table agent_name;
truncate table agent_tag;
truncate table agent_feedback;
truncate table agent;
truncate table customer_tag;
truncate table customer;
truncate table tag;

/*
tables to preserve:

customer_type
public_email_domain
reporting_period
*/