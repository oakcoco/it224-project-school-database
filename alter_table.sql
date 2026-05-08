ALTER TABLE admin 
ADD COLUMN name VARCHAR(50) NOT NULL AFTER `id`;

ALTER TABLE grades
DROP COLUMN `grade_year`;


-- delete all age because it can be computed on a real system using date_of_birth as context (TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()))
DELETE FROM students
DROP COLUMN = 'age';

DELETE FROM staff
DROP COLUMN = 'age';