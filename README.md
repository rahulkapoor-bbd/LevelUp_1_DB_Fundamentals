# LevelUp_1_DB_Fundamentals
Code for DB fundamentals level up

## Database Tables

* Venue
- Stores information about the venues in which examinations are written
- The table contains the following attributes:
  1. venue_id: varchar(50) - The identifier for each row in the table (each venue). Serves as Primary Key
  2. venue_name: varchar(100) - The name of the venue
  3. venue_location: varchar(10) - The location of the venue
  
* Exam_Venue_Bridge
- Bridging table (resolves many to many relationship) Stores the exams and the corresponding venue that exam is written in.
- The table contains the following attributes:
  1. exam_venue_bridge_id: int - The identifier for each row in the table. Serves as Primary Key
  2. examination_id: varchar(20) - Identifier for the exam. Serves as foreign key to Examination table.
  3. venue_id: varchar(50) - Identifier for the venue. Serves as foreign key to Venue table.
  4. examination_date: DateTime
  
* Examination
- Stores information about the examinations.
- The table contains the following attributes:
  1. examination_id: varchar(20) - The identifier for each row in the table (each examination). Serves as Primary Key
  2. module_code: varchar(10) - The modeule code for the subject for which the exam is written. Serves as foreign key to Module table.
  3. examination_type: char(1) - The type of the exam being written. Can be either Normal ('N') or Supplementary ('S')
