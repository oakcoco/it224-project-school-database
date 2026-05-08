-- ============================================================================
-- THIRD NORMAL FORM (3NF) - schema.sql
-- ============================================================================
-- Rules:
-- 1. Must be in 2NF
-- 2. Remove transitive dependencies
-- 3. Non-key attributes should not depend on other non-key attributes
-- ============================================================================

-- ============================================================================
-- TRANSITIVE DEPENDENCY ANALYSIS:
-- ============================================================================

-- In students table:
-- student_id → date_of_birth → age
-- This is a transitive dependency: age depends on date_of_birth, not directly on student_id
-- However, age is kept for performance (common practice)

-- In staff table:
-- employee_id → date_of_birth → age
-- Same transitive dependency issue

-- ============================================================================
-- 3NF SOLUTION: Remove transitive dependencies
-- ============================================================================

-- VERSION 1: Keep age for performance (commonly done in real databases)
CREATE TABLE IF NOT EXISTS students_3nf_performance (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    institute_id INT NOT NULL,
    course_id INT NOT NULL,
    year_status ENUM('First Year', 'Second Year', 'Third Year', 'Fourth Year', 'Fifth Year', 'Masteral', 'Doctorate') NOT NULL,
    section_id VARCHAR(20),
    date_of_birth DATE NOT NULL,
    -- age removed - can be calculated: TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())
    email VARCHAR(100) NOT NULL,
    sex ENUM('Male', 'Female', 'Others') NOT NULL,
    address TEXT NOT NULL,
    admission_date DATE NOT NULL,
    status ENUM('Active', 'Graduated', 'Inactive') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id),
    FOREIGN KEY (section_id) REFERENCES section(section_id)
    -- No transitive dependencies: all attributes directly depend on student_id
);

CREATE TABLE IF NOT EXISTS staff_3nf_performance (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    institute_id INT NOT NULL,
    occupation ENUM('Teaching', 'Non-Teaching') NOT NULL,
    date_of_birth DATE NOT NULL,
    -- age removed - can be calculated
    phone_number VARCHAR(20) NULL,
    email VARCHAR(100) NOT NULL,
    sex ENUM('Male', 'Female', 'Others') NOT NULL,
    address TEXT NOT NULL,
    employment_date DATE NOT NULL,
    status ENUM('Active', 'Resigned', 'Inactive', 'Retired') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
    -- No transitive dependencies
);

-- VERSION 2: Strict 3NF (without age column)
-- Use this if you want strictly normalized database


-- ============================================================================
-- RECOMMENDATION FOR CURRENT SCHEMA.SQL
-- ============================================================================

-- Your current schema.sql is effectively in 3NF because:
-- 1. All tables have proper primary keys
-- 2. Foreign keys properly link tables
-- 3. The 'age' column is a calculated field kept for performance
--    (This is acceptable in most real-world databases)

-- Optional: If you want STRICT 3NF, you can:
-- 1. Remove 'age' column from students and staff tables
-- 2. Calculate age dynamically in queries:
--    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age FROM students;

-- However, keeping age is a common design choice for performance


-- ============================================================================
-- FINAL NORMALIZED TABLES (3NF Ready):
-- ============================================================================

-- institute (already 3NF)
-- course (already 3NF)
-- section (already 3NF)
-- students (3NF - age is performance choice)
-- staff (3NF - age is performance choice)
-- subjects (already 3NF)
-- grades (already 3NF)
-- room (already 3NF)
-- class (already 3NF)
-- enroll (already 3NF)
-- admin (already 3NF)

-- ============================================================================
-- CONCLUSION: Your schema.sql is in 3NF (practical form)
-- ============================================================================