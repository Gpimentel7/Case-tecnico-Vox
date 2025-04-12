SELECT
    tc.table_name AS table,
    kcu.column_name AS column,
    ccu.table_name AS foreign_table,
    ccu.column_name AS foreign_column
FROM 
    information_schema.table_constraints AS tc 
JOIN 
    information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
JOIN 
    information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
WHERE 
    tc.constraint_type = 'FOREIGN KEY';
