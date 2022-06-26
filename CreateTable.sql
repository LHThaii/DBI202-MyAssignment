CREATE TABLE [Students](
	StudentID INT PRIMARY KEY,
	StudentName VARCHAR(30) NOT NULL,
	DoB date NOT NULL,
	Address VARCHAR(30) NOT NULL,
	Gender VARCHAR (30) NOT NULL
	)
CREATE TABLE [Courses] (
	CourseID INT PRIMARY KEY,
	CourseCode VARCHAR(30) NOT NULL,
	CourseName VARCHAR(30) NOT NULL,
	StartDate date, 
	EndDate date )
CREATE TABLE [Assessment](
	CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
	AssessmentID INT PRIMARY KEY,
	Category VARCHAR(30) NOT NULL,
	[Type] NVARCHAR(30) not null CHECK ([type] in ('quiz','on-going','pratical exam','final exam')),
	Part INT NOT NULL,
	[Weight] FLOAT NOT NULL,
	[Completion Criteria] INT NOT NULL,
	Duration VARCHAR (30) NOT NULL,
	LO VARCHAR(30),
	[Question Type] VARCHAR(150) NOT NULL,
	[No Question] INT,
	[Knowledge and Skill] VARCHAR(150),
	[Grading Guide] VARCHAR(150),
	[Note] VARCHAR (150)
	)
CREATE TABLE [Transcript](
	
)
CREATE TABLE [Lecturers] (
	LectureID INT PRIMARY KEY,
	LectureName VARCHAR (30),
	LectureEmail NVARCHAR(30),
	LecturePhone NVARCHAR(10)
	)
CREATE TABLE [Semester](
	SemesterID INT PRIMARY KEY,
	SemesterName VARCHAR (30)
	)
CREATE TABLE [Group] (
	GroupID INT PRIMARY KEY,
	GroupName VARCHAR(30) NOT NULL,
	CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
	LectureID INT FOREIGN KEY REFERENCES Lecturers(LectureID)

	)
CREATE TABLE [Results at the end of semester](
	ROS INT PRIMARY KEY,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	CourseCode VARCHAR(30),
	CourseName VARCHAR(30),
	SemesterID INT FOREIGN KEY REFERENCES Semester(SemesterID),

	)