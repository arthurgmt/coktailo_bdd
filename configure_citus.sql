-- Enable Citus on the PostgreSQL database
CREATE EXTENSION IF NOT EXISTS citus;

-- Set up distributed tables
SELECT create_distributed_table('users', 'id');
SELECT create_distributed_table('ingredients', 'id');
SELECT create_distributed_table('cocktails', 'id');
SELECT create_distributed_table('cocktail_ingredients', 'cocktail_id');

-- Shard the tables based on the primary key
SELECT master_add_node('worker1', 5432);
SELECT master_add_node('worker2', 5432);

-- Distribute the shards across workers
SELECT master_rebalance_shards();
