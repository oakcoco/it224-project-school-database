CREATE DATABASE IF NOT EXISTS school_students_database;
USE school_students_database;

CREATE TABLE IF NOT EXISTS 'students' (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`middle_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`department_id` INT NOT NULL,
FOREIGN KEY (departmentID)  REFERENCES department(departmentID),
`year_level` VARCHAR(20) NOT NULL,
`date_of_birth` DATE NOT NULL,
`email` VARCHAR(100) UNIQUE NOT NULL,
`age` INT NOT NULL,
`sex` ENUM('Male', 'Female','Others') NOT NULL,
`address` TEXT NOT NULL,
`admission_date` DATE NOT NULL,
`status` ENUM('Active', 'Graduated', 'Inactive') NOT NULL, 
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS 'department' (
`departmentID` INT PRIMARY KEY,
`department_name` VARCHAR(100) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS 'subjects' (
`subject_id` INT PRIMARY KEY,
`subject_name` VARCHAR(50) NOT NULL,
`subject_code` VARCHAR(50) NOT NULL,
`department_id` INT NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (departmentID)  REFERENCES department(departmentID);
);

CREATE TABLE IF NOT EXIST 'grades' (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`student_id` INT NOT NULL,
`subject_id` INT NOT NULL,
`grade` DECIMAL(1,2) NOT NULL,
`grade_level` VARCHAR(20) NOT NULL,
FOREIGN KEY (student_id) REFERENCES students(id),
FOREIGN KEY (subject_id) REFERENCES subjects(id),
UNIQUE KEY unique_grade (student_id, subject_id, grade_level)
);

CREATE TABLE IF NOT EXIST 'admin' (
`username` VARCHAR(50) NOT NULL,
`password` VARCHAR(255) NOT NULL,
)



