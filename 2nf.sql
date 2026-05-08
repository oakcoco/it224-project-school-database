

CREATE DATABASE IF NOT EXISTS 2nf_school;
USE 2nf_school;

-- ============================================================================
-- SECOND NORMAL FORM (2NF) - schema.sql
-- ============================================================================
-- Rules:
-- 1. Must be in 1NF
-- 2. Remove partial dependencies
-- 3. All non-key attributes must depend on the ENTIRE primary key
-- ============================================================================


-- ============================================================================
-- ISSUES FOUND FROM 1NF:
-- ============================================================================

-- ISSUE 1: students table - age can be derived from date_of_birth
-- age depends on date_of_birth (transitive dependency - 3NF issue)
-- But age does NOT depend on primary key alone (partial dependency)

-- ISSUE 2: grades table - composite key (student_id, subject_id, grade_year)
-- All non-key attributes (grade) depend on ENTIRE key - OK

-- ISSUE 3: section table has only section_id as primary key
-- course_id is a foreign key but depends on section_id
-- No partial dependency issue here

-- ============================================================================
-- 2NF SOLUTION: Normalize derived/dependent attributes
-- ============================================================================

-- Table: institute (same as 1NF)
CREATE TABLE IF NOT EXISTS institute (
    institute_id INT AUTO_INCREMENT PRIMARY KEY,
    institute_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: course (same as 1NF)
CREATE TABLE IF NOT EXISTS course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    institute_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

-- Table: section (same as 1NF)
CREATE TABLE IF NOT EXISTS section (
    section_id VARCHAR(20) PRIMARY KEY,
    course_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- Table: subjects (same as 1NF)
CREATE TABLE IF NOT EXISTS subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    subject_code VARCHAR(50) NOT NULL,
    course_id INT NOT NULL,
    institute_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

-- TABLE: students (2NF Version)
-- Note: age is kept for performance but could be derived from date_of_birth
-- In strict 2NF, we could remove age and calculate it dynamically
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    institute_id INT NOT NULL,
    course_id INT NOT NULL,
    year_status ENUM('First Year', 'Second Year', 'Third Year', 'Fourth Year', 'Fifth Year', 'Masteral', 'Doctorate') NOT NULL,
    section_id VARCHAR(20),
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,  -- Kept for performance (could be derived via query)
    sex ENUM('Male', 'Female', 'Others') NOT NULL,
    address TEXT NOT NULL,
    admission_date DATE NOT NULL,
    status ENUM('Active', 'Graduated', 'Inactive') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id),
    FOREIGN KEY (section_id) REFERENCES section(section_id)
    -- All attributes depend on student_id (the entire primary key)
);

-- TABLE: staff (2NF Version)
-- Similar to students - age derivable from date_of_birth
CREATE TABLE IF NOT EXISTS staff (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    institute_id INT NOT NULL,
    occupation ENUM('Teaching', 'Non-Teaching') NOT NULL,
    date_of_birth DATE NOT NULL,
    phone_number VARCHAR(20) NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL,  -- Kept for performance
    sex ENUM('Male', 'Female', 'Others') NOT NULL,
    address TEXT NOT NULL,
    employment_date DATE NOT NULL,
    status ENUM('Active', 'Resigned', 'Inactive', 'Retired') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
    -- All attributes depend on employee_id (the entire primary key)
);

-- ============================================================================
-- GRADES TABLE - Already in 2NF
-- ============================================================================
-- Primary key is grade_id (auto_increment) - NOT composite
-- The UNIQUE key is composite, but grade_id is the true primary key
-- All non-key attributes depend on grade_id

-- ============================================================================
-- SECTION TABLE - Already in 2NF
-- ============================================================================
-- Primary key: section_id
-- course_id depends on section_id (entire primary key)

-- ============================================================================
-- SUMMARY: Current schema.sql is already in 2NF
-- ============================================================================
-- The 'age' column is a performance consideration but doesn't break 2NF
-- since grade_id and student_id are separate primary keys
-- All non-key attributes depend on the entire primary key


-- ============================================================================
-- INSERT DATA FOR 2NF TABLES
-- ============================================================================
-- 2NF demonstrates: All non-key attributes depend on ENTIRE primary key

-- Insert Institute data
INSERT INTO institute (institute_name) VALUES
('Institute of Computer Studies'),
('Institute of Engineering'),
('Institute of Business and Accountancy');

-- Insert Course data
INSERT INTO course (institute_id, course_name) VALUES
(1, 'Bachelor of Science in Computer Science'),
(1, 'Master of Science in Artificial Intelligence'),
(2, 'Bachelor of Science in Civil Engineering'),
(3, 'Bachelor of Science in Business Administration');

-- Insert Section data
INSERT INTO section (section_id, course_id) VALUES
('BSCS-3A', 1),
('MSAI-1A', 2),
('BSCE-2A', 3),
('BSBA-1A', 4);

-- Insert Student data
-- KEY 2NF POINT: age is stored but could be derived from date_of_birth
-- In STRICT 2NF: age should NOT be stored, calculate via:
--   SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM students;
-- In PRACTICAL 2NF: age is kept for performance (like this example)
INSERT INTO students (first_name, middle_name, last_name, institute_id, course_id, year_status, section_id, date_of_birth, email, age, sex, address, admission_date, status) VALUES
('Mohammed', 'Kashmiri', 'Santos', 1, 1, 'Third Year', 'BSCS-3A', '2001-05-15', 'mohammed@email.com', 22, 'Male', '123 Maple Street, Quezon City', '2022-08-15', 'Active'),
('Kassandra', 'Angela', 'Cruz', 1, 2, 'Masteral', 'MSAI-1A', '1998-03-22', 'kassandra@email.com', 25, 'Female', '456 Oak Avenue, Quezon City', '2021-06-10', 'Active'),
('Juan', 'Miguel', 'Reyes', 2, 3, 'Second Year', 'BSCE-2A', '2003-07-10', 'juan@email.com', 20, 'Male', '789 Pine Road, Pasig', '2023-08-20', 'Active'),
('Ana', 'Maria', 'Gonzales', 3, 4, 'First Year', 'BSBA-1A', '2004-11-28', 'ana@email.com', 19, 'Female', '321 Cedar Lane, Cavite', '2024-08-01', 'Active');

-- Insert Subject data
INSERT INTO subjects (subject_name, subject_code, course_id, institute_id) VALUES
('Introduction to Programming', 'CS101', 1, 1),
('Data Structures', 'CS102', 1, 1),
('Machine Learning Basics', 'CS201', 2, 1),
('Deep Learning Techniques', 'CS202', 2, 1),
('Structural Analysis', 'CE101', 3, 2),
('Business Management Principles', 'BUS101', 4, 3);

-- ============================================================================
-- 2NF DEMONSTRATED:
-- ============================================================================
-- 1. All attributes depend on ENTIRE primary key (student_id)
-- 2. age could be derived (2NF issue) but kept for performance
-- 3. No partial dependencies: course_id depends on student_id, not just part of key
-- 4. In STRICT 2NF: remove age column, use date_of_birth to calculate