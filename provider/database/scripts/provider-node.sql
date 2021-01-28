-- Script for the provider node

-------------------------------------------------------
-- Check installed extensions
-------------------------------------------------------
SELECT * FROM pg_extension;

-------------------------------------------------------
-- Install pglogical extension
-------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pglogical;

-------------------------------------------------------
-- Create a provider node
-------------------------------------------------------
SELECT pglogical.create_node(
	node_name := 'provider-node', 
	dsn := 'host=provider-db port=5432 dbname=provider user=provider password=provider'
);

-------------------------------------------------------
-- Add all the tables from the public schema to the 
-- default replication set.
-------------------------------------------------------

SELECT pglogical.replication_set_add_all_tables(
	set_name  := 'default',
	schema_names := ARRAY['public'], 
	synchronize_data := true
);