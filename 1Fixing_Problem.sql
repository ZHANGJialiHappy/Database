-- List all indexes in the database
SELECT *
FROM pg_indexes
WHERE tablename = 'people';

-- Check for indexes on the id column in the people table
SELECT indexname
FROM pg_indexes
WHERE tablename = 'people' AND indexdef LIKE '%id%';

-- delete index
DROP INDEX CONCURRENTLY IF EXISTS idx_covering_index_results;

-- check active session ID(pid)
SELECT pid, state, query
FROM pg_stat_activity
WHERE state = 'active';

-- terminate session ID
SELECT pg_terminate_backend(pid);


SELECT * FROM pg_stat_activity WHERE datname = 'sportsNokey2M';
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'sportsNokey2M';
