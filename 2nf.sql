

CREATE DATABASE IF NOT EXISTS 2nf_school;
USE 2nf_school;

-- Rules:
-- 1. Must be in 1NF
-- 2. Remove partial dependencies
-- 3. All non-key attributes must depend on the ENTIRE primary key

CREATE TABLE IF NOT EXISTS institute (
    institute_id INT AUTO_INCREMENT PRIMARY KEY,
    institute_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    institute_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

CREATE TABLE IF NOT EXISTS section (
    section_id VARCHAR(20) PRIMARY KEY,
    course_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

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
    age INT NOT NULL,  -- sa schema.sql mawawala na to
    sex ENUM('Male', 'Female', 'Others') NOT NULL,
    address TEXT NOT NULL,
    admission_date DATE NOT NULL,
    status ENUM('Active', 'Graduated', 'Inactive') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id),
    FOREIGN KEY (section_id) REFERENCES section(section_id)
);

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
    age INT NOT NULL,  -- sa schema.sql mawawala nato
    sex ENUM('Male', 'Female', 'Others') NOT NULL,
    address TEXT NOT NULL,
    employment_date DATE NOT NULL,
    status ENUM('Active', 'Resigned', 'Inactive', 'Retired') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

CREATE TABLE IF NOT EXISTS grades (
`grade_id` INT AUTO_INCREMENT PRIMARY KEY,
`student_id` INT NOT NULL,
`subject_id` INT NOT NULL,
`grade` DECIMAL(3,2) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
UNIQUE KEY unique_grade (student_id, subject_id, grade_year)
);


INSERT INTO institute (institute_name) VALUES
('Institute of Computer Studies'),
('Institute of Engineering'),
('Institute of Business and Accountancy');

INSERT INTO course (institute_id, course_name) VALUES
(1, 'Bachelor of Science in Computer Science'),
(1, 'Master of Science in Artificial Intelligence'),
(2, 'Bachelor of Science in Civil Engineering'),
(3, 'Bachelor of Science in Business Administration');

INSERT INTO section (section_id, course_id) VALUES
('BSCS-3A', 1),
('MSAI-1A', 2),
('BSCE-2A', 3),
('BSBA-1A', 4);

INSERT INTO students (first_name, middle_name, last_name, institute_id, course_id, year_status, section_id, date_of_birth, email, age, sex, address, admission_date, status) VALUES
('Mohammed', 'Kashmiri', 'Santos', 1, 1, 'Third Year', 'BSCS-3A', '2001-05-15', 'mohammed@email.com', 22, 'Male', '123 Maple Street, Quezon City', '2022-08-15', 'Active'),
('Kassandra', 'Angela', 'Cruz', 1, 2, 'Masteral', 'MSAI-1A', '1998-03-22', 'kassandra@email.com', 25, 'Female', '456 Oak Avenue, Quezon City', '2021-06-10', 'Active'),
('Juan', 'Miguel', 'Reyes', 2, 3, 'Second Year', 'BSCE-2A', '2003-07-10', 'juan@email.com', 20, 'Male', '789 Pine Road, Pasig', '2023-08-20', 'Active'),
('Ana', 'Maria', 'Gonzales', 3, 4, 'First Year', 'BSBA-1A', '2004-11-28', 'ana@email.com', 19, 'Female', '321 Cedar Lane, Cavite', '2024-08-01', 'Active');

INSERT INTO subjects (subject_name, subject_code, course_id, institute_id) VALUES
('Introduction to Programming', 'CS101', 1, 1),
('Data Structures', 'CS102', 1, 1),
('Machine Learning Basics', 'CS201', 2, 1),
('Deep Learning Techniques', 'CS202', 2, 1),
('Structural Analysis', 'CE101', 3, 2),
('Business Management Principles', 'BUS101', 4, 3);

INSERT INTO grades (student_id, subject_id, grade) VALUES
(1, 1, 1.50),
(1, 2, 1.75),
(2, 3, 2.75),
(2, 4, 1.25),
(3, 5, 2.25),
(4, 6, 1.25);

-- 2NF DEMONSTRATED:
-- All attributes depend on ENTIRE primary key (student_id) and (grades)
-- age could be derived (2NF issue) but kept for performance
-- No partial dependencies: course_id depends on student_id, not just part of key