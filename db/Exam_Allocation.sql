USE Master;
GO
CREATE DATABASE ExamAllocation;
GO

USE ExamAllocation;
GO

CREATE TABLE DegreeCourse(
	degree_code varchar(10) NOT NULL PRIMARY KEY,
	degree_name varchar(200) NOT NULL,
	duration smalldatetime NOT NULL,
);
GO 

CREATE TABLE Module_Degree_Bridge(
	module_degree_bridgeID int identity(1,1) NOT NULL PRIMARY KEY,
	degree_code varchar(10) NOT NULL,
	module_code varchar(10) NOT NULL,
);
GO

CREATE TABLE Module(
	module_code varchar(10) NOT NULL PRIMARY KEY,
	module_name varchar(50) NOT NULL, 
	semester_type char(1) NOT NULL,
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
