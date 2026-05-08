UPDATE students
SET email = 'mohammed.santos.23@email.com'
WHERE student_id = 1;

UPDATE staff
SET phone_number = '09991234567'
WHERE employee_id = 1;

UPDATE students
SET status = 'Graduated'
WHERE student_id = 5;

UPDATE staff
SET status = 'Resigned'
WHERE employee_id = 10;

UPDATE students SET age = age + 1;

UPDATE staff SET age = age + 1;