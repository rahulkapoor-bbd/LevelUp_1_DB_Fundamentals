/*Users table data*/
USE ExamAllocation;

GO
INSERT INTO
    Users (
        user_name,
        user_type,
        user_firstname,
        user_surname,
        user_email
    )
VALUES
    (
        'sshevels0',
        'S',
        'Spense',
        'Shevels',
        'sshevels0@google.co.uk'
    );

INSERT INTO
    Users (
        user_name,
        user_type,
        user_firstname,
        user_surname,
        user_email
    )
VALUES
    (
        'dguile1',
        'I',
        'Dinny',
        'Guile',
        'dguile1@xing.com'
    );

INSERT INTO
    Users (
        user_name,
        user_type,
        user_firstname,
        user_surname,
        user_email
    )
VALUES
    (
        'bmarc2',
        'I',
        'Bernie',
        'Marc',
        'bmarc2@deliciousdays.com'
    );

INSERT INTO
    Users (
        user_name,
        user_type,
        user_firstname,
        user_surname,
        user_email
    )
VALUES
    (
        'ipollie3',
        'S',
        'Ibrahim',
        'Pollie',
        'ipollie3@army.mil'
    );

/*venue*/
INSERT INTO
    Venue (venue_id, venue_name, venue_location)
VALUES
    ('PATQ', 'Pinnacle', 'Prai');

INSERT INTO
    Venue (venue_id, venue_name, venue_location)
VALUES
    ('EBAW', 'Flotek', 'Scott');

INSERT INTO
    Venue (venue_id, venue_name, venue_location)
VALUES
    ('ZPLC', 'Federal', 'Eastlawn');

INSERT INTO
    Venue (venue_id, venue_name, venue_location)
VALUES
    ('KLIC', 'Applied', 'Kings');

INSERT INTO
    Venue (venue_id, venue_name, venue_location)
VALUES
    ('LRSB', 'Plains', 'Buhler');

/*modules*/
INSERT INTO
    Module(module_code, module_name, semester_type)
VALUES
    ('COMP1001', 'Computer Science 1', 'f');


INSERT INTO
    Module(module_code, module_name, semester_type)
VALUES
    ('COMP1002', 'Computer Science 2', 's');


INSERT INTO
    Module(module_code, module_name, semester_type)
VALUES
    ('ELEN1001', 'Introduction to Electronics A', 'f');


INSERT INTO
    Module(module_code, module_name, semester_type)
VALUES
    ('ELEN1002', 'Introduction to Electronics B', 's');

INSERT INTO
    Module(module_code, module_name, semester_type)
VALUES
    ('MATH1000', 'Mathematics 1', 'y');


/*Degree course*/
INSERT INTO
    Degree_Course (degree_code, degree_name, duration)
VALUES
    ('SACS08', 'Computer Science', 3);

INSERT INTO
    Degree_Course (degree_code, degree_name, duration)
VALUES
    ('SAMS39', 'Mathematics', 3);

INSERT INTO
    Degree_Course (degree_code, degree_name, duration)
VALUES
    ('SAEE24', 'Electrical Engineering', 4);

INSERT INTO
    Degree_Course (degree_code, degree_name, duration)
VALUES
    ('SACE56', 'Computer Engineering', 4);

INSERT INTO
    Degree_Course (degree_code, degree_name, duration)
VALUES
    ('SAIE56', 'Information Engineering', 4);

/*Module_Degree_Bridge*/
INSERT INTO
    Module_Degree_Bridge (degree_code, module_code)
VALUES
    ('SACS08', 'COMP1001');


INSERT INTO
    Module_Degree_Bridge (degree_code, module_code)
VALUES
    ('SACS08', 'COMP1002');

INSERT INTO
    Module_Degree_Bridge (degree_code, module_code)
VALUES
    ('SAIE56', 'ELEN1001');

INSERT INTO
    Module_Degree_Bridge (degree_code, module_code)
VALUES
    ('SAIE56', 'ELEN1002');


INSERT INTO
    Module_Degree_Bridge (degree_code, module_code)
VALUES
    ('SAMS39', 'MATH1000');

/*Degree_student_bridge*/
INSERT INTO
    Degree_Student_Bridge (user_name, degree_code)
VALUES
    ('sshevels0', 'SACS08');


INSERT INTO
    Degree_Student_Bridge (user_name, degree_code)
VALUES
    ('dguile1', 'SAIE56');

INSERT INTO
    Degree_Student_Bridge (user_name, degree_code)
VALUES
    ('bmarc2', 'SAMS39');

INSERT INTO
    Degree_Student_Bridge (user_name, degree_code)
VALUES
    ('ipollie3', 'SAEE24');

INSERT INTO
    Degree_Student_Bridge (user_name, degree_code)
VALUES
    ('ipollie3', 'SAMS39');


/*Examination*/
INSERT INTO
    Examination (examination_id, module_code, examination_type)
VALUES
    ('E001', 'COMP1001', 'n');


INSERT INTO
    Examination (examination_id, module_code, examination_type)
VALUES
    ('E001S', 'COMP1001', 's');


INSERT INTO
    Examination (examination_id, module_code, examination_type)
VALUES
    ('E002', 'ELEN1001', 'n');


INSERT INTO
    Examination (examination_id, module_code, examination_type)
VALUES
    ('E002S', 'ELEN1001', 's');


/*Invigilator Exam bridge*/
INSERT INTO
    Invigilator_Exam_Bridge (user_name, examination_id)
VALUES
    ('dguile1', 'E001');

INSERT INTO
    Invigilator_Exam_Bridge (user_name, examination_id)
VALUES
    ('dguile1', 'E001S');


INSERT INTO
    Invigilator_Exam_Bridge (user_name, examination_id)
VALUES
    ('sshevels0', 'E002');

INSERT INTO
    Invigilator_Exam_Bridge (user_name, examination_id)
VALUES
    ('sshevels0', 'E002S');


/*Exam_venue_bridge*/
INSERT INTO
    Exam_Venue_Bridge (examination_id, venue_id, examination_date)
VALUES
    ('E001', 'PATQ', '2023-03-01 08:00:00');

INSERT INTO
    Exam_Venue_Bridge (examination_id, venue_id, examination_date)
VALUES
    ('E001S', 'EBAW', '2023-03-15 08:00:00');

INSERT INTO
    Exam_Venue_Bridge (examination_id, venue_id, examination_date)
VALUES
    ('E002', 'ZPLC', '2023-03-02 08:00:00');

INSERT INTO
    Exam_Venue_Bridge (examination_id, venue_id, examination_date)
VALUES
    ('E002S', 'KLIC', '2023-03-16 08:00:00');