CREATE DATABASE IF NOT EXISTS 0unormalized_school;
USE 0unormalized_school;

CREATE TABLE IF NOT EXISTS seraljon_unnormalized (

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

    institute_name VARCHAR(100),

    course_name VARCHAR(50),

    section_course_id INT,

    professor_fullname VARCHAR(50),
    professor_phone_number VARCHAR(20),
    professor_email VARCHAR(100),
    staff_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    subject_name VARCHAR(50),
    subject_course_id INT,

    grade_subject_name INT,
    grade_value DECIMAL(3,2),
    grade_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    room_name INT,
    room_location TEXT,
    room_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    class_section VARCHAR(20),
    class_schedule_day VARCHAR(15),
    class_start_time TIME,
    class_end_time TIME,
    class_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,


    enrollment_id INT,
    enrollment_date DATE,
    enrollment_status VARCHAR(15),
    enrollment_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,


    admin_id INT,
    admin_username VARCHAR(50),
    admin_password VARCHAR(255),
    admin_created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP



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

(1, 'Mohammed Santos', 'Third Year', '2001-05-15', 'mohammed@email.com', 22, 'Male',
 '123 Maple Street, Quezon City', '2022-08-15', 'Active', '2024-01-01 10:00:00',
 'Institute of Computer Studies', 'BS in Computer Science', 1,
 'Dr. Robert Morrison', '09171234567', 'robert@email.com', '2024-01-01 10:00:00',
 'Introduction to Programming', 1, 'Introduction to Programming', 1.50, '2024-01-01 10:00:00',
 'CS-101', 'Building A, Ground Floor', '2024-01-01 10:00:00', 'BSCS-3A', 'Monday',
 '08:00:00', '09:30:00', '2024-01-01 10:00:00', 1, '2024-08-15', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

(1, 'Mohammed Santos', 'Third Year', '2001-05-15', 'mohammed@email.com', 22, 'Male',
 '123 Maple Street, Quezon City', '2022-08-15', 'Active', '2024-01-01 10:00:00',
 'Institute of Computer Studies', 'BS in Computer Science', 1,
 'Prof. Elena Castillo', '09172345678', 'elena@email.com', '2024-01-01 10:00:00',
 'Data Structures', 1, 'Data Structures', 1.75, '2024-01-01 10:00:00',
 'CS-102', 'Building A, 1st Floor', '2024-01-01 10:00:00', 'BSCS-3A', 'Tuesday',
 '09:30:00', '11:00:00', '2024-01-01 10:00:00', 2, '2024-08-15', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

(2, 'Kassandra Cruz', 'Masteral', '1998-03-22', 'kassandra@email.com', 25, 'Female',
 '456 Oak Avenue, Quezon City', '2021-06-10', 'Active', '2024-01-01 10:00:00',
 'Institute of Computer Studies', 'BS in Computer Science', 1,
 'Dr. Robert Morrison', '09171234567', 'robert@email.com', '2024-01-01 10:00:00',
 'Machine Learning Basics', 2, 'Machine Learning Basics', 1.25, '2024-01-01 10:00:00',
 'CS-LAB-01', 'Building B, Ground Floor', '2024-01-01 10:00:00', 'MSAI-1A', 'Wednesday',
 '10:00:00', '12:00:00', '2024-01-01 10:00:00', 3, '2024-08-15', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

(3, 'Juan Reyes', 'Second Year', '2003-07-10', 'juan@email.com', 20, 'Male',
 '789 Pine Road, Pasig', '2023-08-20', 'Active', '2024-01-01 10:00:00',
 'Institute of Engineering', 'BS in Civil Engineering', 3,
 'Assoc. Prof. Mark Villanueva', '09173456789', 'mark@email.com', '2024-01-01 10:00:00',
 'Structural Analysis', 3, 'Structural Analysis', 2.25, '2024-01-01 10:00:00',
 'ENG-101', 'Building C, Ground Floor', '2024-01-01 10:00:00', 'BSCE-2A', 'Monday',
 '08:00:00', '09:30:00', '2024-01-01 10:00:00', 4, '2024-08-16', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00'),

(4, 'Ana Gonzales', 'First Year', '2004-11-28', 'ana@email.com', 19, 'Female',
 '321 Cedar Lane, Cavite', '2024-08-01', 'Active', '2024-01-01 10:00:00',
 'Institute of Engineering', 'BS in Mechanical Engineering', 4,
 NULL, NULL, NULL, '2024-01-01 10:00:00',
 'Engineering Mechanics', 4, 'Engineering Mechanics', 1.25, '2024-01-01 10:00:00',
 'ENG-LAB-01', 'Building D, Ground Floor', '2024-01-01 10:00:00', 'BSME-1A', 'Thursday',
 '10:00:00', '12:00:00', '2024-01-01 10:00:00', 5, '2024-08-16', 'Enrolled', '2024-01-01 10:00:00',
 1, 'admin1', 'hashedpassword123', '2024-01-01 10:00:00');
