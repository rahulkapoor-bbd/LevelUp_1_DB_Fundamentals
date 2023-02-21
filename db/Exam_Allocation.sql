USE Master;
GO

CREATE DATABASE ExamAllocation;
GO

USE ExamAllocation;
GO

/*creating the users table*/
Create Table Users(
	user_name VARCHAR(100) unique not null,
	user_type char(1) not null,
	user_firstname varchar(100) not null,
	user_surname varchar(100) not null,
	user_email varchar(320) not null,
	primary key(user_name)
);
go

CREATE TABLE DegreeCourse(
	degree_code varchar(10) NOT NULL PRIMARY KEY,
	degree_name varchar(200) NOT NULL,
	duration int NOT NULL,
);
GO 

/*creating the degree student bridge*/
create table Degree_Student_Bridge(
	degree_student_bridgeID int identity(1,1) not null,
	user_name varchar(100) not null,
	degree_code varchar(10) not null,
	primary key(degree_student_bridgeID),
	foreign key(user_name) references Users,
	foreign key(degree_code) references DegreeCourse(degree_code),

);
go

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

ALTER TABLE dbo.Examination
ADD CONSTRAINT Pk_Examination PRIMARY KEY CLUSTERED (examination_id ASC);

ALTER TABLE dbo.Examination
ADD FOREIGN KEY (module_code) REFERENCES Module(module_code);
GO

/*creating the degree student bridge*/
create table Invigilator_Exam_Bridge(
	Invigilator_exam_bridgeID int identity(1,1) not null,
	user_name varchar(100) not null,
	examination_Id varchar(20) not null,
	foreign key(user_name) references Users,
	foreign key(examination_Id) references Examination(examination_Id),

);


CREATE TABLE dbo.Venue(
	venue_id varchar(50) NOT NULL,
	venue_name varchar(50) NULL,
	venue_location varchar(10) NULL
	);
GO

ALTER TABLE dbo.Venue
ADD CONSTRAINT Pk_Venue PRIMARY KEY CLUSTERED (venue_id ASC);
GO



CREATE TABLE dbo.Exam_Venue_Bridge(
	exam_venue_bridge_id int IDENTITY(1,1) NOT NULL,
	examination_id varchar(20) NOT NULL,
	venue_id varchar(50) NOT NULL,
	examination_date datetime NULL
	);
GO

ALTER TABLE dbo.Exam_Venue_Bridge
ADD CONSTRAINT Pk_Exam_Venue_Bridge PRIMARY KEY CLUSTERED (exam_venue_bridge_id ASC);
GO

ALTER TABLE dbo.Exam_Venue_Bridge
ADD FOREIGN KEY (examination_id) REFERENCES Examination(examination_id);
GO

ALTER TABLE dbo.Exam_Venue_Bridge
ADD FOREIGN KEY (venue_id) REFERENCES Venue(venue_id);
GO

CREATE TABLE Module_Degree_Bridge(
	module_degree_bridgeID int identity(1,1) NOT NULL PRIMARY KEY,
	degree_code varchar(10) NOT NULL,
	module_code varchar(10) NOT NULL,
);
GO



ALTER TABLE Module_Degree_Bridge
ADD FOREIGN KEY(module_code) REFERENCES Module(module_code)
GO 

ALTER TABLE Module_Degree_Bridge
ADD FOREIGN KEY(degree_code) REFERENCES DegreeCourse(degree_code)
GO 

ALTER TABLE Module
ADD CONSTRAINT check_semester_type
	CHECK (semester_type = 'f' OR semester_type = 's' OR semester_type = 'y')
