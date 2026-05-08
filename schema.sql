CREATE DATABASE IF NOT EXISTS seraljon;
USE seraljon;


CREATE TABLE IF NOT EXISTS institute (
`institute_id` INT AUTO_INCREMENT PRIMARY KEY,
`institute_name` VARCHAR(100) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS course(
`course_id` INT AUTO_INCREMENT PRIMARY KEY,
`course_name` VARCHAR(50) UNIQUE NOT NULL,
`institute_id` INT NOT NULL,
FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

CREATE TABLE IF NOT EXISTS section (
`section_id` VARCHAR(20) PRIMARY KEY,
`course_id` INT NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS students (
`student_id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`middle_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`institute_id` INT NOT NULL,
`course_id` INT NOT NULL,
`year_status` ENUM('First Year', 'Second Year', 'Third Year', 'Fourth Year', 'Fifth Year','Masteral', 'Doctorate') NOT NULL,
`section_id` VARCHAR(20),
`date_of_birth` DATE NOT NULL,
`email` VARCHAR(100) UNIQUE NOT NULL,
`age` INT NOT NULL,
`sex` ENUM('Male', 'Female','Others') NOT NULL,
`address` TEXT NOT NULL,
`admission_date` DATE NOT NULL,
`status` ENUM('Active', 'Graduated', 'Inactive') NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (course_id) REFERENCES course(course_id),
FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
FOREIGN KEY (section_id) REFERENCES section(section_id)
);

CREATE TABLE IF NOT EXISTS staff (
`employee_id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`middle_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`institute_id` INT NOT NULL,
`occupation` ENUM('Teaching', 'Non-Teaching') NOT NULL,
`date_of_birth` DATE NOT NULL,
`phone_number` VARCHAR(20) NULL,
`email` VARCHAR(100) UNIQUE NOT NULL,
`age` INT NOT NULL,
`sex` ENUM('Male', 'Female', 'Others') NOT NULL,
`address` TEXT NOT NULL,
`employment_date` DATE NOT NULL,
`status` ENUM('Active', 'Resigned', 'Inactive', 'Retired') NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);

CREATE TABLE IF NOT EXISTS subjects (
`subject_id` INT AUTO_INCREMENT PRIMARY KEY,
`subject_name` VARCHAR(50) NOT NULL,
`subject_code` VARCHAR(50) NOT NULL,
`course_id` INT NOT NULL,
`institute_id` INT NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (course_id)  REFERENCES course(course_id),
FOREIGN KEY (institute_id)  REFERENCES institute(institute_id)
);

CREATE TABLE IF NOT EXISTS grades (
`grade_id` INT AUTO_INCREMENT PRIMARY KEY,
`student_id` INT NOT NULL,
`subject_id` INT NOT NULL,
`grade` DECIMAL(3,2) NOT NULL,
-- grade year will be deleted when altered
`grade_year` INT NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
UNIQUE KEY unique_grade (student_id, subject_id, grade_year)
);

CREATE TABLE IF NOT EXISTS room(
`room_id` VARCHAR(20) PRIMARY KEY,
`institute_id` INT NOT NULL,
`location` TEXT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (institute_id) REFERENCES institute(institute_id)
);



CREATE TABLE IF NOT EXISTS class (
`class_id` INT AUTO_INCREMENT PRIMARY KEY,
`section_assigned` VARCHAR(20) NOT NULL,
`subject_id` INT NOT NULL,
`employee_id` INT NOT NULL,
`room_id` VARCHAR(20) NOT NULL,
`course_id` INT NOT NULL, 
`schedule_day` ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
`start_time` TIME NOT NULL,
`end_time` TIME NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
FOREIGN KEY (employee_id) REFERENCES staff(employee_id),
FOREIGN KEY (room_id) REFERENCES room(room_id),
FOREIGN KEY (course_id) REFERENCES course(course_id),
FOREIGN KEY (section_assigned) REFERENCES section(section_id)
);

CREATE TABLE IF NOT EXISTS enroll (                                                          
`enrollment_id` INT AUTO_INCREMENT PRIMARY KEY,
`student_id` INT NOT NULL,                                                                 
`class_id` INT NOT NULL,
`enrollment_date` DATE NOT NULL,
`status` ENUM('Enrolled', 'Dropped') NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (class_id) REFERENCES class(class_id),
UNIQUE KEY unique_enrollment (student_id, class_id)
);

CREATE TABLE IF NOT EXISTS admin (
`id` INT AUTO_INCREMENT PRIMARY key,
`username` VARCHAR(50) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




