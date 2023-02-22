USE ExamAllocation;
GO

/*Stored procedures*/
Create procedure selectAllUsers
as 
select * from Users
go;

Exec selectAllUsers;

/*Selecting all students*/
Create Procedure selectAllStudents
as
Select user_firstname from Users where Users.user_type = 'S' 
go

Exec selectAllStudents;

/*Displaying students with their degree counts*/
Create Procedure displayStudentDegreeCount
as
Select Users.user_name, count(*) as degree_count from Degree_Student_Bridge, Users
where Users.user_name = Degree_Student_Bridge.user_name
group by(Users.user_name)
go

Exec displayStudentDegreeCount;

