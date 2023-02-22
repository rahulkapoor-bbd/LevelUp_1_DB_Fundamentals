USE ExamAllocation;
GO

-- UDF to return the total number of exams 
-- an invigilator is assigned to.

CREATE OR ALTER FUNCTION dbo.udfTotalExamsForInvigilator(@user_name varchar(100))
RETURNS int 
AS
BEGIN
    DECLARE @total_exams int;

    SELECT @total_exams = COUNT(*)
	FROM Invigilator_Exam_Bridge 
    WHERE user_name = @user_name

    RETURN @total_exams;
END
GO


-- Test with this
-- SELECT dbo.udfTotalExamsForInvigilator('dguile1');