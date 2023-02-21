USE Master;
GO

CREATE DATABASE ExamAllocation;
GO

USE ExamAllocation;
GO

CREATE TABLE dbo.Venue(
	venue_id varchar(50) NOT NULL,
	venue_name varchar(50) NULL,
	venue_location varchar(10) NULL
	);
GO

ALTER TABLE dbo.Venue
ADD CONSTRAINT Pk_Venue PRIMARY KEY CLUSTERED (venue_id ASC);
GO

CREATE TABLE dbo.Examination(
	examination_id varchar(20) NOT NULL,
	module_code varchar(10) NULL,
	examination_type char(1) NULL,
	);
GO

ALTER TABLE dbo.Examination
ADD CONSTRAINT Pk_Examination PRIMARY KEY CLUSTERED (examination_id ASC);

--ALTER TABLE dbo.Examination
--ADD FOREIGN KEY (module_code) REFERENCES Module(module_code);
--GO

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