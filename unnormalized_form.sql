
CREATE TABLE IF NOT EXISTS seraljon_unnormalized (
    -- (primary entity)
    student_id INT,
    student_fullname VARCHAR(100),
    student_year_status VARCHAR(20),
    student_date_of_birth DATE,
    student_email VARCHAR(100),
    student_age INT,
    student_sex VARCHAR(10),
    student_address TEXT,
    student_admission_date DATE,
    student_status VARCHAR(20),
    student_created_at TIMESTAMP,

    -- Institute Data (repeated for each student/staff)
    institute_name VARCHAR(100),

    -- Course Data (repeated for each student/subject)
    course_name VARCHAR(50),

    -- Section Data (repeated for each student/class)
    section_course_id INT,

    -- Staff Data (separate entity but mixed here)
    professor_fullname VARCHAR(50),
    professor_phone_number VARCHAR(20),
    professor_email VARCHAR(100),
    staff_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Subject Data (repeated - multiple subjects per course)
    subject_name VARCHAR(50),
    subject_course_id INT,

    -- Grade Data (repeating group - student can have multiple grades)
    grade_subject_name INT,
    grade_value DECIMAL(3,2),
    grade_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Room Data (repeated for each class)
    room_name INT,
    room_location TEXT,
    room_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Class Data (repeating group - section can have multiple classes)
    class_section VARCHAR(20),
    class_schedule_day VARCHAR(15),
    class_start_time TIME,
    class_end_time TIME,
    class_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Enrollment Data (repeating group - student can enroll in multiple classes)
    enrollment_id INT,
    enrollment_date DATE,
    enrollment_status VARCHAR(15),
    enrollment_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Admin Data (separate entity)
    admin_id INT,
    admin_username VARCHAR(50),
    admin_password VARCHAR(255),
    admin_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

    -- ============================================================================
    -- PROBLEMS IN THIS UNNORMALIZED FORM:
    -- ============================================================================
    -- 1. REDUNDANT DATA: institute_name, course_name repeated for each student
    -- 2. REPEATING GROUPS: multiple grades, classes, enrollments per student
    -- 3. MIXED ENTITIES: students, staff, subjects, grades all in one table
    -- 4. DATA REDUNDANCY: same address, email stored multiple times
    -- 5. UPDATE ANOMALIES: changing institute_name requires updating many rows
    -- 6. INSERT ANOMALIES: must have complete student data to add a grade
    -- 7. DELETE ANOMALIES: deleting a student removes all related data at once
    -- 8. NULL VALUES: staff data is NULL for students, student data is NULL for staff
);


-- ============================================================================
-- EXAMPLE DATA IN UNNORMALIZED FORM (sample row):
-- ============================================================================
-- institute_id | institute_name | course_id | course_name | ... | student_id | student_first_name | ...
-- -------------|----------------|-----------|-------------|-----|------------|--------------------|----
-- 1           | Institute of   | 1         | BS in CS    | ... | 1          | Mohammed           | ...
--             | Computer       |           |             |     |            |                    |
--             | Studies        |           |             |     |            |                    |
-- ----------------------------------------------------------------------------------------------------
-- 1           | Institute of   | 1         | BS in CS    | ... | 1          | Mohammed           | ... (duplicate!)
--             | Computer       |           |             |     |            |                    |
--             | Studies        |           |             |     |            |                    |
-- ----------------------------------------------------------------------------------------------------
-- (One row per grade - grade 1, then grade 2 for same student - REPEATING GROUP!)


-- ============================================================================
-- NORMALIZATION PROCESS TO FIX THIS:
-- ============================================================================
-- 1NF: Remove repeating groups → Separate tables for grades, enrollments
-- 2NF: Remove partial dependencies → Move section_id to proper table
-- 3NF: Remove transitive dependencies → Separate related data into proper tables

-- Your current schema.sql is already in 3NF (normalized)!
-- The UNF above shows what the data looked like BEFORE normalization.

-- ============================================================================
-- UNNORMALIZED FORM (UNF) - All data in one flat table
-- ============================================================================
-- This is the initial unnormalized form combining all entities into one table.
-- Contains: repeating groups, redundant data, and mixed data types.


-- ============================================================================
-- INSERT EXAMPLE DATA FOR UNNORMALIZED FORM
-- ============================================================================
-- This demonstrates the problems: repeating groups, redundant data, nulls

INSERT INTO seraljon_unnormalized (
    student_id, student_fullname, student_year_status, student_date_of_birth,
    student_email, student_age, student_sex, student_address, student_admission_date,
    student_status, student_created_at, institute_name, course_name, section_course_id,
    professor_fullname, professor_phone_number, professor_email, staff_created_at,
    subject_name, subject_course_id, grade_subject_name, grade_value, grade_created_at,
    room_name, room_location, room_created_at, class_section, class_schedule_day,
    class_start_time, class_end_time, class_created_at, enrollment_id, enrollment_date,
    enrollment_status, enrollment_created_at, admin_id, admin_username, admin_password, admin_created_at
) VALUES
-- ROW 1: Student Mohammed - First grade record
(1, 'Mohammed Santos', 'Third Year', '2001-05-15', 'mohammed@email.com', 22, 'Male',
 '123 Maple Street, Quezon City', '2022-08-15', 'Active', '2024-01-01 10:00:00',
 'Institute of Computer Studies', 'BS in Computer Science', 1,
 'Dr. Robert Morrison', '09171234567', 'robert@email.com', '2024-01-01 10:00:00',
 'Introduction to Programming', 1, 'Introduction to Programming', 1.50, '2024-01-01 10:00:00',
 'CS-101', 'Building A, Ground Floor', '2024-01-01 10:00:00', 'BSCS-3A', 'Monday',
 '08:00:00', '09:30:00', '2024-01-01 10:00:00', 1, '2024-08-15', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

-- ROW 2: SAME student Mohammed - Second grade record (REPEATING GROUP!)
-- Notice: all student data repeated, only grade changes
(1, 'Mohammed Santos', 'Third Year', '2001-05-15', 'mohammed@email.com', 22, 'Male',
 '123 Maple Street, Quezon City', '2022-08-15', 'Active', '2024-01-01 10:00:00',
 'Institute of Computer Studies', 'BS in Computer Science', 1,
 'Prof. Elena Castillo', '09172345678', 'elena@email.com', '2024-01-01 10:00:00',
 'Data Structures', 1, 'Data Structures', 1.75, '2024-01-01 10:00:00',
 'CS-102', 'Building A, 1st Floor', '2024-01-01 10:00:00', 'BSCS-3A', 'Tuesday',
 '09:30:00', '11:00:00', '2024-01-01 10:00:00', 2, '2024-08-15', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

-- ROW 3: Student Kassandra - DIFFERENT student but SAME institute/course (REDUNDANT DATA!)
-- Notice: institute_name and course_name repeated for different students
(2, 'Kassandra Cruz', 'Masteral', '1998-03-22', 'kassandra@email.com', 25, 'Female',
 '456 Oak Avenue, Quezon City', '2021-06-10', 'Active', '2024-01-01 10:00:00',
 'Institute of Computer Studies', 'BS in Computer Science', 1,
 'Dr. Robert Morrison', '09171234567', 'robert@email.com', '2024-01-01 10:00:00',
 'Machine Learning Basics', 2, 'Machine Learning Basics', 1.25, '2024-01-01 10:00:00',
 'CS-LAB-01', 'Building B, Ground Floor', '2024-01-01 10:00:00', 'MSAI-1A', 'Wednesday',
 '10:00:00', '12:00:00', '2024-01-01 10:00:00', 3, '2024-08-15', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

-- ROW 4: Student Juan - from DIFFERENT institute (REDUNDANT DATA!)
(3, 'Juan Reyes', 'Second Year', '2003-07-10', 'juan@email.com', 20, 'Male',
 '789 Pine Road, Pasig', '2023-08-20', 'Active', '2024-01-01 10:00:00',
 'Institute of Engineering', 'BS in Civil Engineering', 3,
 'Assoc. Prof. Mark Villanueva', '09173456789', 'mark@email.com', '2024-01-01 10:00:00',
 'Structural Analysis', 3, 'Structural Analysis', 2.25, '2024-01-01 10:00:00',
 'ENG-101', 'Building C, Ground Floor', '2024-01-01 10:00:00', 'BSCE-2A', 'Monday',
 '08:00:00', '09:30:00', '2024-01-01 10:00:00', 4, '2024-08-16', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

-- ROW 5: Student Ana - NULL staff columns (this is a STUDENT record, not staff!)
-- Notice: professor fields are NULL or have placeholder data
(4, 'Ana Gonzales', 'First Year', '2004-11-28', 'ana@email.com', 19, 'Female',
 '321 Cedar Lane, Cavite', '2024-08-01', 'Active', '2024-01-01 10:00:00',
 'Institute of Engineering', 'BS in Mechanical Engineering', 4,
 NULL, NULL, NULL, '2024-01-01 10:00:00',
 'Engineering Mechanics', 4, 'Engineering Mechanics', 1.25, '2024-01-01 10:00:00',
 'ENG-LAB-01', 'Building D, Ground Floor', '2024-01-01 10:00:00', 'BSME-1A', 'Thursday',
 '10:00:00', '12:00:00', '2024-01-01 10:00:00', 5, '2024-08-16', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00');

-- ============================================================================
-- PROBLEMS DEMONSTRATED IN THIS INSERT:
-- ============================================================================
-- 1. REPEATING GROUPS: Rows 1 and 2 are same student with different grades
-- 2. REDUNDANT DATA: "Institute of Computer Studies" repeated 3 times
-- 3. DATA INCONSISTENCY: Same institute spelled differently could cause issues
-- 4. WASTED STORAGE: All columns must be filled even if not used
-- 5. NULL VALUES: Professor data is NULL for student-only records
-- 6. UPDATE ANOMALY: If institute name changes, must update ALL rows with that institute
-- 7. INSERT ANOMALY: Cannot add just a grade - must repeat all student/institute data
-- 8. DELETE ANOMALY: Deleting student 1 removes BOTH grade records at once