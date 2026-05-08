INSERT INTO institute (institute_name) VALUES
('Institute of Computer Studies'),
('Institute of Engineering'),
('Institute of Business and Accountancy'),
('Institute of Arts and Sciences'),
('Institute of Education'),
('Institute of Nursing and Health Sciences'),
('Institute of Architecture and Design'),
('Institute of Law and Governance'),
('Institute of Agriculture and Environmental Studies'),
('Institute of Tourism and Hospitality Management');

INSERT INTO course (institute_id, course_name) VALUES 
(1, 'Bachelor of Science in Computer Science'),
(1, 'Master of Science in Artificial Intelligence'),
(2, 'Bachelor of Science in Civil Engineering'),
(2, 'Bachelor of Science in Mechanical Engineering'),
(3, 'Bachelor of Science in Business Administration'),
(3, 'Master of Business Administration'),
(4, 'Bachelor of Arts in English Literature'),
(4, 'Bachelor of Science in Psychology'),
(5, 'Bachelor of Science in Education - Mathematics'),
(5, 'Master of Education in Curriculum Development'),
(6, 'Bachelor of Science in Nursing'),
(6, 'Master of Science in Public Health'),
(7, 'Bachelor of Science in Architecture'),
(7, 'Master of Science in Urban Design'),
(8, 'Bachelor of Laws'),
(8, 'Master of Laws in International Law'),
(9, 'Bachelor of Science in Agriculture'),
(9, 'Master of Science in Environmental Management'),
(10, 'Bachelor of Science in Hotel and Restaurant Management'),
(10, 'Master of Science in Hospitality Management');

INSERT INTO students (first_name, middle_name, last_name, institute_id, course_id, year_status, section_id, date_of_birth, email, age, sex, address, admission_date, status) VALUES
('Mohammed', 'Kashmiri', 'Santos', 1, 1, 'Third Year', 'BSCS-1A', '2001-05-15', 'mohammed.santos@email.com', 22, 'Male', '123 Maple Street, Quezon City', '2022-08-15', 'Active'),
('Kassandra', 'Angela', 'Cruz', 1, 2, 'Second Year', 'BSCS-2A', '1998-03-22', 'kassandra.cruz@email.com', 25, 'Female', '456 Oak Avenue, Quezon City', '2021-06-10', 'Active'),
('Juan', 'Miguel', 'Reyes', 2, 3, 'Second Year', 'BSCE-2A', '2003-07-10', 'juan.reyes@email.com', 20, 'Male', '789 Pine Road, Pasig', '2023-08-20', 'Active'),
('Ana', 'Maria', 'Gonzales', 2, 4, 'First Year', 'BSME-1A', '2004-11-28', 'ana.gonzales@email.com', 19, 'Female', '321 Cedar Lane, Cavite', '2024-08-01', 'Active'),
('Pedro', 'Luis', 'Fernandez', 3, 5, 'Second Year', 'BSBA-2A', '2000-09-14', 'pedro.fernandez@email.com', 23, 'Male', '654 Birch Street, Manila', '2021-08-10', 'Active'),
('Rosa', 'Isabel', 'Mercado', 3, 6, 'Masteral', 'MBA-1A', '1999-01-05', 'rosa.mercado@email.com', 25, 'Female', '987 Elm Avenue, Makati', '2022-01-15', 'Active'),
('Miguel', 'Antonio', 'Diaz', 4, 7, 'Second Year', 'BAEL-2A', '2003-04-20', 'miguel.diaz@email.com', 21, 'Male', '147 Spruce Lane, Quezon City', '2023-08-18', 'Active'),
('Sofia', 'Carmen', 'Lopez', 5, 9, 'First Year', 'BSED-MATH-1A', '2004-08-12', 'sofia.lopez@email.com', 19, 'Female', '258 Ash Road, Quezon City', '2024-08-05', 'Active'),
('Carlos', 'Manuel', 'Robles', 6, 11, 'Third Year', 'BSN-3A', '2001-12-03', 'carlos.robles@email.com', 22, 'Male', '369 Walnut Street, Davao', '2022-08-22', 'Active'),
('Isabella', 'Rosa', 'Aguilar', 10, 19, 'Second Year', 'BSHRM-2A', '2003-06-18', 'isabella.aguilar@email.com', 20, 'Female', '741 Cherry Avenue, Quezon City', '2023-08-14', 'Active');

INSERT INTO staff (first_name, middle_name, last_name, institute_id, occupation, date_of_birth, phone_number, email, age, sex, address, employment_date, status) VALUES 
-- Teaching Staff
('Dr. Robert', 'James', 'Morrison', 1, 'Teaching', '1975-03-10', '09171234567', 'robert.morrison@institute.edu', 48, 'Male', '100 University Drive, Quezon City', '2015-06-01', 'Active'),
('Prof. Elena', 'Marie', 'Castillo', 1, 'Teaching', '1982-07-22', '09172345678', 'elena.castillo@institute.edu', 41, 'Female', '200 Academic Street, Marikina', '2018-08-15', 'Active'),
('Assoc. Prof. Mark', 'Anthony', 'Villanueva', 2, 'Teaching', '1988-11-05', '09173456789', 'mark.villanueva@institute.edu', 35, 'Male', '300 Engineering Road, Cavite City', '2019-07-10', 'Active'),
('Dr. Patricia', 'Louise', 'Santiago', 2, 'Teaching', '1979-05-18', '09174567890', 'patricia.santiago@institute.edu', 44, 'Female', '400 Technical Avenue, Bacoor', '2016-09-01', 'Active'),
('Prof. Michael', 'David', 'Gutierrez', 3, 'Teaching', '1980-09-30', '09175678901', 'michael.gutierrez@institute.edu', 43, 'Male', '500 Commerce Lane, Caloocan', '2017-08-20', 'Active'),
('Assoc. Prof. Rebecca', 'Ann', 'Flores', 3, 'Teaching', '1985-02-14', '09176789012', 'rebecca.flores@institute.edu', 38, 'Female', '600 Business Street, Valenzuela', '2020-01-15', 'Active'),
('Dr. Christopher', 'Paul', 'Ramos', 4, 'Teaching', '1977-12-25', '09177890123', 'christopher.ramos@institute.edu', 46, 'Male', '700 Arts Boulevard, Rizal', '2014-06-10', 'Active'),
('Prof. Diana', 'Grace', 'Aquino', 4, 'Teaching', '1984-08-09', '09178901234', 'diana.aquino@institute.edu', 39, 'Female', '800 Literature Road, Antipolo', '2019-02-01', 'Active'),
('Assoc. Prof. Kevin', 'Thomas', 'Hernandez', 5, 'Teaching', '1986-04-17', '09179012345', 'kevin.hernandez@institute.edu', 37, 'Male', '900 Education Drive, Laguna', '2021-08-10', 'Active'),
('Dr. Jennifer', 'Nicole', 'Perez', 5, 'Teaching', '1981-10-12', '09180123456', 'jennifer.perez@institute.edu', 42, 'Female', '1000 School Lane, Santa Rosa', '2018-01-15', 'Active'),
('Prof. William', 'George', 'Lopez', 6, 'Teaching', '1976-06-20', '09181234567', 'william.lopez@institute.edu', 47, 'Male', '1100 Hospital Drive, Cebu City', '2016-03-01', 'Active'),
('Assoc. Prof. Angela', 'Rose', 'Santos', 6, 'Teaching', '1987-01-28', '09182345678', 'angela.santos@institute.edu', 36, 'Female', '1200 Healthcare Road, Mandaue', '2020-07-20', 'Active'),
('Dr. Stephen', 'Richard', 'Cruz', 7, 'Teaching', '1978-09-08', '09183456789', 'stephen.cruz@institute.edu', 45, 'Male', '1300 Design Street, Davao City', '2017-05-10', 'Active'),
('Prof. Victoria', 'Anne', 'Reyes', 7, 'Teaching', '1983-03-15', '09184567890', 'victoria.reyes@institute.edu', 40, 'Female', '1400 Architecture Avenue, Cagayan de Oro', '2019-09-01', 'Active'),
('Assoc. Prof. Daniel', 'Joseph', 'Mercado', 8, 'Teaching', '1989-07-11', '09185678901', 'daniel.mercado@institute.edu', 34, 'Male', '1500 Law Boulevard, Iloilo City', '2022-01-15', 'Active'),
-- Non-Teaching Staff
('Ms. Sarah', 'Elizabeth', 'Torres', 1, 'Non-Teaching', '1990-05-20', '09186789012', 'sarah.torres@institute.edu', 33, 'Female', '1600 Admin Street, Taguig', '2020-03-01', 'Active'),
('Mr. James', 'Edward', 'Fernandez', 2, 'Non-Teaching', '1985-11-14', '09187890123', 'james.fernandez@institute.edu', 38, 'Male', '1700 Finance Road, Dasmarinas', '2018-06-15', 'Active'),
('Ms. Amanda', 'Michelle', 'Gonzales', 3, 'Non-Teaching', '1992-08-22', '09188901234', 'amanda.gonzales@institute.edu', 31, 'Female', '1800 HR Lane, Navotas', '2021-04-10', 'Active'),
('Mr. George', 'William', 'Diaz', 5, 'Non-Teaching', '1988-02-03', '09189012345', 'george.diaz@institute.edu', 35, 'Male', '1900 Operations Avenue, Binan', '2019-08-01', 'Active'),
('Ms. Catherine', 'Margaret', 'Aguilar', 10, 'Non-Teaching', '1991-09-30', '09190123456', 'catherine.aguilar@institute.edu', 32, 'Female', '2000 Support Street, Zamboanga City', '2021-07-20', 'Active');

INSERT INTO subjects (subject_name, subject_code, course_id, institute_id) VALUES 
-- Institute of Computer Studies (course_id: 1, 2)
('Introduction to Programming', 'CS101', 1, 1),
('Data Structures', 'CS102', 1, 1),
('Database Management Systems', 'CS103', 1, 1),
('Web Development Fundamentals', 'CS104', 1, 1),
('Software Engineering', 'CS105', 1, 1),
('Machine Learning Basics', 'CS201', 2, 1),
('Deep Learning Techniques', 'CS202', 2, 1),
('Neural Networks', 'CS203', 2, 1),

-- Institute of Engineering (course_id: 3, 4)
('Structural Analysis', 'CE101', 3, 2),
('Surveying and Mapping', 'CE102', 3, 2),
('Building Materials and Construction', 'CE103', 3, 2),
('Engineering Mechanics', 'ME101', 4, 2),
('Thermodynamics', 'ME102', 4, 2),
('Fluid Mechanics', 'ME103', 4, 2),

-- Institute of Business and Accountancy (course_id: 5, 6)
('Business Management Principles', 'BUS101', 5, 3),
('Organizational Behavior', 'BUS102', 5, 3),
('Financial Accounting', 'ACC101', 5, 3),
('Strategic Planning', 'BUS103', 5, 3),
('Corporate Finance', 'MBA101', 6, 3),
('Business Analytics', 'MBA102', 6, 3),
('International Business', 'MBA103', 6, 3),

-- Institute of Arts and Sciences (course_id: 7, 8)
('British Literature', 'ENG101', 7, 4),
('Creative Writing', 'ENG102', 7, 4),
('Literary Analysis', 'ENG103', 7, 4),
('General Psychology', 'PSY101', 8, 4),
('Cognitive Psychology', 'PSY102', 8, 4),
('Abnormal Psychology', 'PSY103', 8, 4),

-- Institute of Education (course_id: 9, 10)
('Mathematical Methods for Teaching', 'EDU101', 9, 5),
('Curriculum Design', 'EDU102', 9, 5),
('Assessment and Evaluation', 'EDU201', 10, 5),
('Educational Leadership', 'EDU202', 10, 5),

-- Institute of Nursing and Health Sciences (course_id: 11, 12)
('Fundamentals of Nursing', 'NUR101', 11, 6),
('Anatomy and Physiology', 'NUR102', 11, 6),
('Pharmacology', 'NUR103', 11, 6),
('Community Health Nursing', 'NUR201', 12, 6),
('Epidemiology', 'NUR202', 12, 6),
('Public Health Policy', 'NUR203', 12, 6),

-- Institute of Architecture and Design (course_id: 13, 14)
('Architectural Design I', 'ARC101', 13, 7),
('Building Construction', 'ARC102', 13, 7),
('History of Architecture', 'ARC103', 13, 7),
('Urban Planning', 'UD101', 14, 7),
('Sustainable Design', 'UD102', 14, 7),
('GIS for Urban Design', 'UD103', 14, 7),

-- Institute of Law and Governance (course_id: 15, 16)
('Constitutional Law', 'LAW101', 15, 8),
('Criminal Law', 'LAW102', 15, 8),
('Civil Procedure', 'LAW103', 15, 8),
('International Law', 'IL101', 16, 8),
('Treaty Law', 'IL102', 16, 8),
('Human Rights Law', 'IL103', 16, 8),

-- Institute of Agriculture and Environmental Studies (course_id: 17, 18)
('Introduction to Agriculture', 'AGR101', 17, 9),
('Soil Science', 'AGR102', 17, 9),
('Crop Production', 'AGR103', 17, 9),
('Environmental Management', 'EM101', 18, 9),
('Waste Management', 'EM102', 18, 9),
('Environmental Impact Assessment', 'EM103', 18, 9),

-- Institute of Tourism and Hospitality Management (course_id: 19, 20)
('Introduction to Tourism', 'THM101', 19, 10),
('Hotel Operations', 'THM102', 19, 10),
('Food and Beverage Management', 'THM103', 19, 10),
('Hospitality Marketing', 'HM201', 20, 10),
('Tourism Planning and Development', 'HM202', 20, 10),
('Event Management', 'HM203', 20, 10);

INSERT INTO grades (student_id, subject_id, grade) VALUES 
(1, 1, 1.50),
(1, 2, 1.75),
(2, 5, 2.75),
(2, 6, 1.25),
(3, 9, 2.25),
(3, 10, 3.00),
(4, 15, 1.25),
(4, 16, 2.75),
(5, 22, 5.00),
(5, 23, 4.00);


INSERT INTO room (room_id, institute_id, location) VALUES 
-- Institute of Computer Studies (institute_id = 1)
('CS-101', 1, 'Building A, Ground Floor'),
('CS-102', 1, 'Building A, 1st Floor'),
('CS-103', 1, 'Building A, 2nd Floor'),
('CS-LAB-01', 1, 'Building B, Ground Floor'),
('CS-LAB-02', 1, 'Building B, 1st Floor'),

-- Institute of Engineering (institute_id = 2)
('ENG-101', 2, 'Building C, Ground Floor'),
('ENG-102', 2, 'Building C, 1st Floor'),
('ENG-103', 2, 'Building C, 2nd Floor'),
('ENG-LAB-01', 2, 'Building D, Ground Floor'),
('ENG-LAB-02', 2, 'Building D, 1st Floor'),

-- Institute of Business and Accountancy (institute_id = 3)
('BUS-101', 3, 'Building E, Ground Floor'),
('BUS-102', 3, 'Building E, 1st Floor'),
('BUS-103', 3, 'Building E, 2nd Floor'),
('BUS-LAB-01', 3, 'Building E, 3rd Floor'),
('BUS-CONF-01', 3, 'Building E, 4th Floor'),

-- Institute of Arts and Sciences (institute_id = 4)
('ART-101', 4, 'Building F, Ground Floor'),
('ART-102', 4, 'Building F, 1st Floor'),
('ART-103', 4, 'Building F, 2nd Floor'),
('LIB-01', 4, 'Building G, Ground Floor'),
('LIB-02', 4, 'Building G, 1st Floor'),

-- Institute of Education (institute_id = 5)
('EDU-101', 5, 'Building H, Ground Floor'),
('EDU-102', 5, 'Building H, 1st Floor'),
('EDU-103', 5, 'Building H, 2nd Floor'),
('EDU-LAB-01', 5, 'Building H, 3rd Floor'),
('EDU-DEMO-01', 5, 'Building I, Ground Floor'),

-- Institute of Nursing and Health Sciences (institute_id = 6)
('NURS-101', 6, 'Building J, Ground Floor'),
('NURS-102', 6, 'Building J, 1st Floor'),
('NURS-LAB-01', 6, 'Building K, Ground Floor'),
('NURS-LAB-02', 6, 'Building K, 1st Floor'),
('NURS-SIM-01', 6, 'Building K, 2nd Floor'),

-- Institute of Architecture and Design (institute_id = 7)
('ARC-STUDIO-01', 7, 'Building L, Ground Floor'),
('ARC-STUDIO-02', 7, 'Building L, 1st Floor'),
('DESIGN-LAB-01', 7, 'Building L, 2nd Floor'),
('DESIGN-LAB-02', 7, 'Building M, Ground Floor'),
('MODEL-RM-01', 7, 'Building M, 1st Floor'),

-- Institute of Law and Governance (institute_id = 8)
('LAW-101', 8, 'Building N, Ground Floor'),
('LAW-102', 8, 'Building N, 1st Floor'),
('LAW-103', 8, 'Building N, 2nd Floor'),
('COURT-RM-01', 8, 'Building N, 3rd Floor'),
('MOCK-COURT-01', 8, 'Building O, Ground Floor'),

-- Institute of Agriculture and Environmental Studies (institute_id = 9)
('AGR-101', 9, 'Building P, Ground Floor'),
('AGR-102', 9, 'Building P, 1st Floor'),
('AGR-LAB-01', 9, 'Building Q, Ground Floor'),
('GREENHOUSE-01', 9, 'Outdoor Area, North Wing'),
('FARM-DEMO-01', 9, 'Outdoor Area, South Wing'),

-- Institute of Tourism and Hospitality Management (institute_id = 10)
('TOUR-101', 10, 'Building R, Ground Floor'),
('TOUR-102', 10, 'Building R, 1st Floor'),
('KITCHEN-LAB-01', 10, 'Building S, Ground Floor'),
('HOTEL-SIM-01', 10, 'Building S, 1st Floor'),
('RESTAURANT-LAB-01', 10, 'Building T, Ground Floor');


INSERT INTO section (section_id, course_id) VALUES 
-- Institute of Computer Studies (course_id: 1, 2)
('BSCS-1A', 1),
('BSCS-2A', 1),
('BSCS-3A', 1),
('BSCS-4A', 1),
('MSAI-MA', 2),
('MSAI-DR', 2),

-- Institute of Engineering (course_id: 3, 4)
('BSCE-1A', 3),
('BSCE-2A', 3),
('BSCE-3A', 3),
('BSCE-4A', 3),
('BSME-1A', 4),
('BSME-2A', 4),
('BSME-3A', 4),
('BSME-4A', 4),

-- Institute of Business and Accountancy (course_id: 5, 6)
('BSBA-1A', 5),
('BSBA-2A', 5),
('BSBA-3A', 5),
('BSBA-4A', 5),
('MBA-MA', 6),
('MBA-DR', 6),

-- Institute of Arts and Sciences (course_id: 7, 8)
('BAEL-1A', 7),
('BAEL-2A', 7),
('BAEL-3A', 7),
('BAEL-4A', 7),
('BAPSYCH-1A', 8),
('BAPSYCH-2A', 8),
('BAPSYCH-3A', 8),
('BAPSYCH-4A', 8),

-- Institute of Education (course_id: 9, 10)
('BSED-MATH-1A', 9),
('BSED-MATH-2A', 9),
('BSED-MATH-3A', 9),
('BSED-MATH-4A', 9),
('MEDC-MA', 10),
('MEDC-DR', 10),

-- Institute of Nursing and Health Sciences (course_id: 11, 12)
('BSN-1A', 11),
('BSN-2A', 11),
('BSN-3A', 11),
('BSN-4A', 11),
('MSPH-MA', 12),
('MSPH-DR', 12),

-- Institute of Architecture and Design (course_id: 13, 14)
('BSARCH-1A', 13),
('BSARCH-2A', 13),
('BSARCH-3A', 13),
('BSARCH-4A', 13),
('BSARCH-5A', 13),
('MSUD-MA', 14),
('MSUD-DR', 14),

-- Institute of Law and Governance (course_id: 15, 16)
('LLB-1A', 15),
('LLB-2A', 15),
('LLB-3A', 15),
('MLIC-MA', 16),
('MLIC-DR', 16),

-- Institute of Agriculture and Environmental Studies (course_id: 17, 18)
('BSAG-1A', 17),
('BSAG-2A', 17),
('BSAG-3A', 17),
('BSAG-4A', 17),
('MSEM-MA', 18),
('MSEM-DR', 18),

-- Institute of Tourism and Hospitality Management (course_id: 19, 20)
('BSHRM-1A', 19),
('BSHRM-2A', 19),
('BSHRM-3A', 19),
('BSHRM-4A', 19),
('MSHM-MA', 20),
('MSHM-DR', 20);

INSERT INTO class (section_assigned, subject_id, employee_id, room_id, course_id, schedule_day, start_time, end_time) VALUES 
('BSCS-1A', 1, 1, 'CS-101', 1, 'Monday', '08:00:00', '09:30:00'),
('BSCS-2A', 2, 2, 'CS-102', 1, 'Tuesday', '09:30:00', '11:00:00'),
('BSCE-1A', 3, 5, 'ENG-101', 3, 'Wednesday', '08:00:00', '09:30:00'),
('BSME-2A', 4, 7, 'ENG-LAB-01', 4, 'Thursday', '10:00:00', '12:00:00'),
('BSBA-1A', 15, 5, 'BUS-101', 5, 'Friday', '08:00:00', '09:30:00'),
('MBA-MA', 19, 6, 'BUS-LAB-01', 6, 'Monday', '13:00:00', '14:30:00'),
('BAEL-1A', 22, 7, 'ART-101', 7, 'Tuesday', '10:00:00', '11:30:00'),
('BAPSYCH-2A', 25, 8, 'LIB-01', 8, 'Wednesday', '13:00:00', '14:30:00'),
('BSED-MATH-1A', 28, 9, 'EDU-101', 9, 'Thursday', '08:00:00', '09:30:00'),
('BSN-3A', 35, 11, 'NURS-LAB-01', 11, 'Friday', '09:00:00', '11:00:00');

INSERT INTO enroll (student_id, class_id, enrollment_date, status) VALUES 
(1, 1, '2024-08-15', 'Enrolled'),
(2, 2, '2024-08-15', 'Enrolled'),
(3, 3, '2024-08-16', 'Enrolled'),
(4, 4, '2024-08-16', 'Enrolled'),
(5, 5, '2024-08-17', 'Enrolled'),
(6, 6, '2024-08-17', 'Enrolled'),
(7, 7, '2024-08-18', 'Enrolled'),
(8, 8, '2024-08-18', 'Enrolled'),
(9, 9, '2024-08-19', 'Enrolled'),
(10, 10, '2024-08-19', 'Enrolled');

INSERT INTO admin (username, password) VALUES 
('admin1', 'hashedpasswordexample'),
('admin2', 'hashedpassword');

