-- Create School table
CREATE TABLE School (
  School_ID INT PRIMARY KEY,
  School_Name VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL
);

-- Create House table
CREATE TABLE House (
  House_ID INT PRIMARY KEY,
  House_Name VARCHAR(255) NOT NULL
);

-- Create Teacher table
CREATE TABLE Teacher (
  Teacher_ID INT PRIMARY KEY,
  First_Name VARCHAR(100) NOT NULL,
  Last_Name VARCHAR(100) NOT NULL,
  Course_ID INT,
  FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

-- Create Courses table
CREATE TABLE Courses (
  Course_ID INT PRIMARY KEY,
  Course_Name VARCHAR(255) NOT NULL
);

-- Create Student table
CREATE TABLE Student (
  Student_ID INT PRIMARY KEY,
  First_Name VARCHAR(100) NOT NULL,
  Last_Name VARCHAR(100) NOT NULL,
  House_ID INT,
  Level INT,
  Grade_ID INT,
  FOREIGN KEY (House_ID) REFERENCES House(House_ID),
   FOREIGN KEY (Grade_ID) REFERENCES Grade(Grade_ID)
);

-- Create Grade table
CREATE TABLE Grade (
  Grade_ID INT PRIMARY KEY,
  Student_ID INT,
  Grade VARCHAR(10) NOT NULL,
  FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

-- Inserting data into the tables

INSERT INTO School (School_ID, School_Name, Address)
VALUES (1, 'Springfield High', '123 Main St');

INSERT INTO House (House_ID, House_Name)
VALUES (1, 'Gryffindor');

INSERT INTO Courses (Course_ID, Course_Name)
VALUES (1, 'Mathematics');

INSERT INTO Teacher (Teacher_ID, First_Name, Last_Name, Course_ID)
VALUES (1, 'John', 'Doe', 1);

INSERT INTO Student (Student_ID, First_Name, Last_Name, House_ID, Level, Grade_ID)
VALUES (1, 'Alice', 'Johnson', 1, 9, 1);

INSERT INTO Grade (Grade_ID, Student_ID, Grade)
VALUES (1, 1, 'A+');

-- Full join

SELECT 
  s.Student_ID,
  s.First_Name,
  s.Last_Name,
  g.Grade_ID,
  g.Grade
FROM 
  Student s
  INNER JOIN Grade g
  ON s.Student_ID = g.Student_ID

UNION

SELECT 
  s.Student_ID,
  s.First_Name,
  s.Last_Name,
  NULL AS Grade_ID,
  NULL AS Grade
FROM 
  Student s
WHERE 
  s.Student_ID NOT IN (SELECT Student_ID FROM Grade)


-- Name starts with l

SELECT *
FROM Student
WHERE First_Name LIKE 'L%';

