REM
REM	all_database_objects.bat
REM

type table_*.sql > all_tables.sql
type func_*.sql > all_functions.sql
type view_*.sql > all_views.sql
type index_*.sql > all_indices.sql

psql -h localhost -p 5432 -U postgres -d newton -a < all_tables.sql > all_tables.log
psql -h localhost -p 5432 -U postgres -d newton -a < all_functions.sql > all_functions.log
psql -h localhost -p 5432 -U postgres -d newton -a < all_views.sql > all_views.log
psql -h localhost -p 5432 -U postgres -d newton -a < all_indices.sql > all_indices.log
