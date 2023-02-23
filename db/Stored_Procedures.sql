USE ExamAllocation;

GO
    /*Stored procedures*/
    CREATE PROCEDURE selectAllUsers AS
SELECT
    *
FROM
    Users
GO
;

EXEC selectAllUsers;

/*Selecting all students*/
CREATE PROCEDURE selectAllStudents AS
SELECT
    user_firstname
FROM
    Users
WHERE
    Users.user_type = 'S'
GO
    EXEC selectAllStudents;

/*Displaying students with their degree counts*/
CREATE PROCEDURE displayStudentDegreeCount AS
SELECT
    Users.user_name,
    count(*) AS degree_count
FROM
    Degree_Student_Bridge,
    Users
WHERE
    Users.user_name = Degree_Student_Bridge.user_name
GROUP BY
(Users.user_name)
GO
    EXEC displayStudentDegreeCount;