-- Faculty table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL
);

-- Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


 Insert sample data:

INSERT INTO Faculty VALUES
(1, 'Science'),
(2, 'Engineering');

INSERT INTO Department VALUES
(101, 'Computer Science', 1),
(102, 'Physics', 1),
(103, 'Mechanical Engineering', 2);

INSERT INTO Course VALUES
(201, 'B.Sc Computer Science', 101),
(202, 'B.Sc Physics', 102),
(203, 'B.E Mechanical', 103);

INSERT INTO Student VALUES
(1, 'Arun', 201),
(2, 'Priya', 201),
(3, 'Rahul', 202),
(4, 'Divya', 203);


Display the normalized result:

SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    d.DepartmentName
FROM Student s
JOIN Course c
    ON s.CourseID = c.CourseID
JOIN Department d
    ON c.DepartmentID = d.DepartmentID
JOIN Faculty f
    ON d.FacultyID = f.FacultyID;

