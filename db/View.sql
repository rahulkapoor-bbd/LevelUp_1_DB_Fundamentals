USE ExamAllocation;

GO
	CREATE VIEW StudentExamTimetable AS
SELECT
	DegreeCourse.degree_name AS 'Degree',
	Module.module_name AS 'Module',
	Examination.examination_id AS 'Exam',
	CONCAT(Users.user_firstname, ' ', Users.user_surname) AS 'Invidulator',
	Venue.venue_name AS 'Venue',
	CONVERT(
		VARCHAR(10),
		Exam_Venue_Bridge.examination_date,
		103
	) AS 'Date',
	CONVERT(
		VARCHAR(10),
		CAST(Exam_Venue_Bridge.examination_date AS TIME),
		0
	) AS 'Time'
FROM
	Module
	LEFT JOIN Module_Degree_Bridge ON Module_Degree_Bridge.module_code = Module.module_code
	LEFT JOIN DegreeCourse ON Module_Degree_Bridge.degree_code = DegreeCourse.degree_code
	RIGHT JOIN Examination ON Module.module_code = Examination.module_code
	LEFT JOIN Exam_Venue_Bridge ON Exam_Venue_Bridge.examination_id = Examination.examination_id
	LEFT JOIN Venue ON Exam_Venue_Bridge.venue_id = Venue.venue_id
	LEFT JOIN Invigilator_Exam_Bridge ON Invigilator_Exam_Bridge.examination_Id = Examination.examination_id
	LEFT JOIN Users ON Invigilator_Exam_Bridge.user_name = Users.user_name