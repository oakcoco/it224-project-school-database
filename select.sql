-- SELECT (ang "*" all) FROM table_name 
-- WHERE column_name (condition)
-- ORDER BY (ASC or DESC);

SELECT * FROM class 
WHERE section_assigned
ORDER BY ASC;

SELECT * FROM staff 
WHERE occupation = 'Teaching'
ORDER BY last_name ASC;

SELECT * FROM students 
WHERE status = 'Active' 
ORDER BY last_name ASC;

SELECT * FROM students 
WHERE institute_id = 1 AND year_status = 'First Year'
ORDER BY first_name ASC;

SELECT * FROM class 
WHERE class_id > 0
ORDER BY class_id DESC;

