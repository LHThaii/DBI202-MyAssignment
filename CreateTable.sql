CREATE TABLE [Students](
	StudentID VARCHAR(10) PRIMARY KEY,
	StudentName NVARCHAR(30) NOT NULL,
	DoB date NOT NULL,
	Address VARCHAR(30) NOT NULL,
	PhoneNumber VARCHAR(10)
)
CREATE TABLE [Courses] (
	CourseID INT PRIMARY KEY,
	CourseCode VARCHAR(30) NOT NULL,
	CourseName NVARCHAR(30) NOT NULL,
	 
)
CREATE TABLE [Lecturers] (
	LectureID INT PRIMARY KEY,
	LectureName NVARCHAR (30) NOT NULL,
	LectureEmail NVARCHAR(30) NOT NULL,
	LecturePhone NVARCHAR(10)
	)
	CREATE TABLE [Group] (
	StudentID VARCHAR(10)NOT NULL FOREIGN KEY REFERENCES[Students](StudentID),
	GroupID VARCHAR(10) PRIMARY KEY,
	GroupName NVARCHAR(30) NOT NULL,
	CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
	LectureID INT FOREIGN KEY REFERENCES Lecturers(LectureID),
    	StartDate date, 
	EndDate date 
)
CREATE TABLE [Assessment](
	CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
	Category VARCHAR(30) NOT NULL PRIMARY KEY,
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


CREATE TABLE [Detailed Result](
	StudentID VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES[Students](StudentID),
	Category VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES[Assessment](Category),
	Item NVARCHAR(30) PRIMARY KEY,
	[Weight] INT NOT NULL,
	Value FLOAT NOT NULL,
	Comment NVARCHAR(30)
)
