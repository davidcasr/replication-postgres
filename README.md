# Logical replication with PostgreSQL 12.3 and Pglogical

Pglogical is a logical replication system implemented entirely as a PostgreSQL extension. Fully integrated, it requires no triggers or external programs. This alternative to physical replication is a highly efficient method of replicating data using a publish/subscribe model for selective replication.

## Provider

1. Run docker-compose up.
2. Create database structure. Run scripts/create-database.sql in the database.
3. Create info in the table. Run scripts/inserts-database.sql in the database.
4. Create provider node. Run scripts/provider-node.sql in the database.

## Subscriber

1. Run docker-compose up.
2. Create database structure. Run scripts/create-database.sql in the database.
3. Create provider node. Run scripts/provider-node.sql in the database.

Made with ❤️ by @davidcasr