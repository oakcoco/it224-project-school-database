SELECT * FROM class 
WHERE section_assigned = 'BSCS-1A'
ORDER BY schedule_day ASC, start_time ASC;

SELECT * FROM staff 
WHERE occupation = 'Teaching'
ORDER BY last_name ASC;

SELECT * FROM students 
WHERE status = 'Active' 
ORDER BY last_name ASC;

SELECT * FROM students 
WHERE institute_id = 1 AND year_status = 'First Year'
ORDER BY first_name ASC;