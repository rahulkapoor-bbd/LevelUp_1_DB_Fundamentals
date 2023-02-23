# LevelUp_1_DB_Fundamentals
Code for DB fundamentals level up

## Group Members
- Zeerak Baig (zeerak@bbd.co.za)
- Rahul Kapoor (rahulk@bbd.co.za)
- Jesse Van Der Merwe (jesse@bbd.co.za)

## Topic
The topic for our group is **Exam Allocation**

## Database Description
The database contains tables related to Users, Exams, Degrees, Modules and Examinations. It allows for a simple model to store basic information about students, the segrees they are registerd for, the modules making up a degree and the exam(s) for modules. The exam venues and details of indivigilators are also able to be stored.


## Database Tables
__Degree_Course__
- Stores basic information about the degrees that this university offers. 
- The table contains the following attributes:
  1. degree_code: varchar(10) - The (primary key) code used to identify the degree in the table.
  2. degree_name: varchar(200) - The name of the degree, which can be quite lengthy. 
  3. duration: int - the number of years that this degree takes to complete (first try).
  
__Module__
- Stores information about the modules that this university offers across various degrees.
- The table contains the following attributes:
  1. module_code: varchar(10) - The (primary key) code used to identify the module in the table.
  2. module_name: varchar(50) - The name of the module.
  3. semester_type: char(1) - Describes when the semester takes place in the year: "f" - first, "s" - second, "y" - full year
  
__Module_Degree_Bridge__
- Bridging table (resolves many to many relationship) between the degrees offered at this university, and the corresponding modules in each degree.
- The table contains the following attributes:
  1. module_degree_bridge_id: int - The identifier for each row in the table. Serves as Primary Key
  2. degree_code: varchar(10) - Identifier for the degree. Serves as foreign key to Degree_Course table.
  3. module_code: varchar(10) - Identifier for the module. Serves as foreign key to Module table.  

__Venue__
- Stores information about the venues in which examinations are written
- The table contains the following attributes:
  1. venue_id: varchar(50) - The identifier for each row in the table (each venue). Serves as Primary Key
  2. venue_name: varchar(100) - The name of the venue
  3. venue_location: varchar(10) - The location of the venue
  
__Exam_Venue_Bridge__
- Bridging table (resolves many to many relationship) Stores the exams and the corresponding venue that exam is written in.
- The table contains the following attributes:
  1. exam_venue_bridge_id: int - The identifier for each row in the table. Serves as Primary Key
  2. examination_id: varchar(20) - Identifier for the exam. Serves as foreign key to Examination table.
  3. venue_id: varchar(50) - Identifier for the venue. Serves as foreign key to Venue table.
  4. examination_date: DateTime
  
__Examination__
- Stores information about the examinations.
- The table contains the following attributes:
  1. examination_id: varchar(20) - The identifier for each row in the table (each examination). Serves as Primary Key
  2. module_code: varchar(10) - The modeule code for the subject for which the exam is written. Serves as foreign key to Module table.
  3. examination_type: char(1) - The type of the exam being written. Can be either Normal ('N') or Supplementary ('S')
