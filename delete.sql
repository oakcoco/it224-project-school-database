-- no classes
DELETE FROM room
WHERE room_id = 'CS-LAB-02';

-- specific section with no students
DELETE FROM section
WHERE section_id = 'BSED-MATH-1B';

-- specific grade record
DELETE FROM grades
WHERE grade_id = 1;

-- dropped enrollments
DELETE FROM enroll
WHERE status = 'Dropped';
