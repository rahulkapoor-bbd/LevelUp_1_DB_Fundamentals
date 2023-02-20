use Master;
go
create database ExamAllocation;
go

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

/*creating the degree student bridge*/
create table Degree_Student_Bridge(
degree_student_bridgeID int identity(1,1) not null,
user_name varchar(100) unique not null,
/*degree_code varchar(10) unique not null,*/
primary key(degree_student_bridgeID),
foreign key(user_name) references Users,
/*foreign key(degree_code) references DegreeCourse(degree_code),*/

);
go

/*creating the degree student bridge*/
create table Invigilator_Exam_Bridge(
Invigilator_exam_bridgeID int identity(1,1) not null,
user_name varchar(100) unique not null,
/*examination_Id varchar(20) unique not null,*/
foreign key(user_name) references Users,
/*foreign key(examination_Id) references Examination(examination_Id),*/

);