--
--	script_configure_db_canopus.sql
--

    create foreign data wrapper fdw validator postgresql_fdw_validator;
    create server db_canopus foreign data wrapper fdw options(host 'localhost', dbname 'canopusweb');
    create user mapping for postgres server db_canopus options(user 'postgres', password 'z4rd0z');

    select dblink_connect('db_canopus');
    grant usage on foreign server db_canopus to postgres;

    select * from dblink ('db_canopus','select count(*) from robotarm_returnshipment') as data(rowcount integer);
    