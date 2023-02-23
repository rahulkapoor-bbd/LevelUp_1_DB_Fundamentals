USE MASTER;

GO
	CREATE DATABASE ExamAllocation;

GO
	USE ExamAllocation;

GO
	/*creating the users table*/
	CREATE TABLE Users(
		user_name VARCHAR(100) UNIQUE NOT NULL,
		user_type char(1) NOT NULL,
		user_firstname varchar(100) NOT NULL,
		user_surname varchar(100) NOT NULL,
		user_email varchar(320) NOT NULL,
		PRIMARY KEY(user_name)
	);

GO
	CREATE TABLE Degree_Course(
		degree_code varchar(10) NOT NULL PRIMARY KEY,
		degree_name varchar(200) NOT NULL,
		duration int NOT NULL,
	);

GO
	/*creating the degree student bridge*/
	CREATE TABLE Degree_Student_Bridge(
		degree_student_bridge_id int identity(1, 1) NOT NULL,
		user_name varchar(100) NOT NULL,
		degree_code varchar(10) NOT NULL,
		PRIMARY KEY(degree_student_bridge_id),
		FOREIGN KEY(user_name) REFERENCES Users,
		FOREIGN KEY(degree_code) REFERENCES Degree_Course(degree_code),
	);

GO
	CREATE TABLE Module(
		module_code varchar(10) NOT NULL PRIMARY KEY,
		module_name varchar(50) NOT NULL,
		semester_type char(1) NOT NULL,
	);

GO
	CREATE TABLE dbo.Examination(
		examination_id varchar(20) NOT NULL,
		module_code varchar(10) NULL,
		examination_type char(1) NULL,
	);

GO
ALTER TABLE
	dbo.Examination
ADD
	CONSTRAINT Pk_Examination PRIMARY KEY CLUSTERED (examination_id ASC);

ALTER TABLE
	dbo.Examination
ADD
	FOREIGN KEY (module_code) REFERENCES Module(module_code);

GO
	/*creating the degree student bridge*/
	CREATE TABLE Invigilator_Exam_Bridge(
		invidulator_exam_bridge_id int identity(1, 1) NOT NULL,
		user_name varchar(100) NOT NULL,
		examination_id varchar(20) NOT NULL,
		FOREIGN KEY(user_name) REFERENCES Users,
		FOREIGN KEY(examination_id) REFERENCES Examination(examination_id),
	);

CREATE TABLE dbo.Venue(
	venue_id varchar(50) NOT NULL,
	venue_name varchar(50) NULL,
	venue_location varchar(10) NULL
);

GO
ALTER TABLE
	dbo.Venue
ADD
	CONSTRAINT Pk_Venue PRIMARY KEY CLUSTERED (venue_id ASC);

GO
	CREATE TABLE dbo.Exam_Venue_Bridge(
		exam_venue_bridge_id int IDENTITY(1, 1) NOT NULL,
		examination_id varchar(20) NOT NULL,
		venue_id varchar(50) NOT NULL,
		examination_date datetime NULL
	);

GO
ALTER TABLE
	dbo.Exam_Venue_Bridge
ADD
	CONSTRAINT Pk_Exam_Venue_Bridge PRIMARY KEY CLUSTERED (exam_venue_bridge_id ASC);

GO
ALTER TABLE
	dbo.Exam_Venue_Bridge
ADD
	FOREIGN KEY (examination_id) REFERENCES Examination(examination_id);

GO
ALTER TABLE
	dbo.Exam_Venue_Bridge
ADD
	FOREIGN KEY (venue_id) REFERENCES Venue(venue_id);

GO
	CREATE TABLE Module_Degree_Bridge(
		module_degree_bridge_id int identity(1, 1) NOT NULL PRIMARY KEY,
		degree_code varchar(10) NOT NULL,
		module_code varchar(10) NOT NULL,
	);

GO
ALTER TABLE
	Module_Degree_Bridge
ADD
	FOREIGN KEY(module_code) REFERENCES Module(module_code)
GO
ALTER TABLE
	Module_Degree_Bridge
ADD
	FOREIGN KEY(degree_code) REFERENCES Degree_Course(degree_code)
GO
ALTER TABLE
	Module
ADD
	CONSTRAINT check_semester_type CHECK (
		semester_type = 'f'
		OR semester_type = 's'
		OR semester_type = 'y'
	)