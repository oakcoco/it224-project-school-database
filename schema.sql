CREATE DATABASE IF NOT EXISTS seraljon;
USE seraljon;

CREATE TABLE IF NOT EXISTS department (
`department_id` INT AUTO_INCREMENT PRIMARY KEY,
`department_name` VARCHAR(100) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS course(
`course_id` INT AUTO_INCREMENT PRIMARY KEY,
`course_name` VARCHAR(50) UNIQUE NOT NULL,
`department_id` INT NOT NULL,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS students (
`student_id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`middle_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`department_id` INT NOT NULL,
`year_level` VARCHAR(20) NOT NULL,
`date_of_birth` DATE NOT NULL,
`email` VARCHAR(100) UNIQUE NOT NULL,
`age` INT NOT NULL,
`sex` ENUM('Male', 'Female','Others') NOT NULL,
`address` TEXT NOT NULL,
`admission_date` DATE NOT NULL,
`status` ENUM('Active', 'Graduated', 'Inactive') NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS staff (
`employee_id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(50) NOT NULL,
`middle_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`department_id` INT NOT NULL,
`occupation` ENUM('Teaching', 'Non-Teaching'),
`date_of_birth` DATE NOT NULL,
`phone_number` VARCHAR(20) NULL,
`email` VARCHAR(100) UNIQUE NOT NULL,
`age` INT NOT NULL,
`sex` ENUM('Male', 'Female', 'Others') NOT NULL,
`address` TEXT NOT NULL,
`employment_date` DATE NOT NULL,
`status` ENUM('Active', 'Resigned', 'Inactive', 'Retired') NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id) REFERENCES department(department_id)
);

CREATE TABLE IF NOT EXISTS subjects (
`subject_id` INT AUTO_INCREMENT PRIMARY KEY,
`subject_name` VARCHAR(50) NOT NULL,
`subject_code` VARCHAR(50) NOT NULL,
`course_id` INT NOT NULL,
`department_id` INT NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (department_id)  REFERENCES course(department_id)
FOREIGN KEY (course_id)  REFERENCES course(course_id)
);

CREATE TABLE IF NOT EXISTS grades (
`grade_id` INT AUTO_INCREMENT PRIMARY KEY,
`student_id` INT NOT NULL,
`subject_id` INT NOT NULL,
`grade` DECIMAL(3,2) NOT NULL,
`grade_year` VARCHAR(20) NOT NULL,
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
UNIQUE KEY unique_grade (student_id, subject_id, grade_year)
);

CREATE TABLE IF NOT EXISTS building(
`building_id` INT AUTO_INCREMENT PRIMARY KEY,
`building name` VARCHAR(100) UNIQUE NOT NULL,
`location` VARCHAR(255),
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS facilities (
facility_id INT AUTO_INCREMENT PRIMARY KEY,
facility_name VARCHAR(50) NOT NULL,
facility_code VARCHAR(50) UNIQUE NOT NULL,
building_id INT NOT NULL,
room_name VARCHAR(50) NOT NULL,
facility_type ENUM('Storage', 'Classroom', 'Office', 'Open Space', 'Other') NOT NULL,
status ENUM('Available', 'In-Use', 'Maintenance', 'Not Available') NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (building_id) REFERENCES building(building_id)
);

CREATE TABLE IF NOT EXISTS class (
`class_id` INT AUTO_INCREMENT PRIMARY KEY,
`section_assigned` VARCHAR(50) NOT NULL,
`subject_id` INT NOT NULL,
`intructor_id` INT NOT NULL,
`schedule` VARCHAR(50) NOT NULL,
`facility_id` INT NOT NULL,
`building_id` INT NOT NULL,
FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
FOREIGN KEY (intructor_id) REFERENCES staff(employee_id),
FOREIGN KEY (facility_id) REFERENCES facilities(facility_id),
FOREIGN KEY (building_id) REFERENCES facilities(building_id)
);

CREATE TABLE IF NOT EXISTS enroll (                                                          
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,                                                                 
class_id INT NOT NULL,
enrollment_date DATE NOT NULL,
status ENUM('Enrolled', 'Dropped', 'Completed', 'Failed') NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (student_id) REFERENCES students(id),
FOREIGN KEY (class_id) REFERENCES class(class_id),
UNIQUE KEY unique_enrollment (student_id, class_id)
);



CREATE TABLE IF NOT EXISTS admin (
`id` INT AUTO_INCREMENT PRIMARY key,
`username` VARCHAR(50) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



