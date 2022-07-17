CREATE TABLE [Student](
	StudentID VARCHAR(10) PRIMARY KEY,
	StudentName NVARCHAR(30) NOT NULL,
	gender BIT,
	DoB DATE NOT NULL,
	Address VARCHAR(30) NOT NULL	
)

CREATE TABLE [Course] (
	CourseID INT PRIMARY KEY,
	CourseName NVARCHAR(30) NOT NULL
)

CREATE TABLE [Lecturer] (
	LecturerID INT PRIMARY KEY,
	LecturerName NVARCHAR (30) NOT NULL
)

CREATE TABLE [Group] (
	GroupID VARCHAR(10) PRIMARY KEY,
	GroupName NVARCHAR(30) NOT NULL
)

CREATE TABLE [Group_student](
	StudentID VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES [Student](StudentID),
	GroupID VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES [Group](GroupID)
)

CREATE TABLE [Group_lecturer](
	LectureID INT FOREIGN KEY REFERENCES [Lecturer](LecturerID),
	GroupID VARCHAR(10)NOT NULL FOREIGN KEY REFERENCES[Group](GroupID)
)

CREATE TABLE [Group_course](
	CourseID INT FOREIGN KEY REFERENCES [Course](CourseID),
	GroupID VARCHAR(10)NOT NULL FOREIGN KEY REFERENCES[Group](GroupID)
)
  
CREATE TABLE [Lecturer_Course](
	LectureID INT FOREIGN KEY REFERENCES [Lecturer](LecturerID),
	CourseID INT FOREIGN KEY REFERENCES [Course](CourseID)
)
	
CREATE TABLE Assessment(
	AssessmentID INT PRIMARY KEY,
	AssessmentName VARCHAR(150),
	WEIGHT FLOAT,
	CourseID INT FOREIGN KEY REFERENCES [Course](CourseID)
)

CREATE TABLE RESULT(
	RESULTID INT PRIMARY KEY,
	StudentID VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES [Student](StudentID),
	AssessmentID INT FOREIGN KEY REFERENCES [Assessment](AssessmentID),
	CourseID INT FOREIGN KEY REFERENCES [Course](CourseID),
	Score FLOAT
)
	

