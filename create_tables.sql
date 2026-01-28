-- Name: Siddhant Singh
-- Roll Number: 23CS10085
-- Department: Computer Science and Engineering
-- DBMS Lab
-- Assignment Number: 2

-- Table Definitions

-- Entity Tables

CREATE TABLE Courses (
    course_id CHAR(12) PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    duration INT,
    program_type VARCHAR(50)
);

CREATE TABLE Topics (
    topic_id CHAR(12) PRIMARY KEY,
    title VARCHAR(100),
    description VARCHAR(5000)
);

CREATE TABLE Students (
    student_id CHAR(12) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    date_of_birth DATE,
    age INT,
    skill_level VARCHAR(50),
    financial_condition VARCHAR(50),
    category VARCHAR(50),
    nationality VARCHAR(50),
    sign_up_date DATE
);

CREATE TABLE Instructors (
    instructor_id CHAR(12) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    qualifications VARCHAR(600),
    field_of_study VARCHAR(100),
    date_of_birth DATE,
    age INT,
    nationality VARCHAR(50)
);

CREATE TABLE PartnerUniversities (
    university_id CHAR(12) PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    pin_code INT
);

CREATE TABLE EvaluationData (
    enrollment_id CHAR(12) PRIMARY KEY,
    enrollment_date DATE,
    assignment_titles VARCHAR(600),
    assignment_scores VARCHAR(600),
    total_score INT CHECK (total_score >= 0 AND total_score <= 100),
    grade VARCHAR(5)
);

CREATE TABLE Books (
    book_id CHAR(12) PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100)
);

CREATE TABLE Videos (
    video_id CHAR(12) PRIMARY KEY,
    title VARCHAR(100),
    video_link VARCHAR(100)
);

CREATE TABLE Notes (
    note_id CHAR(12) PRIMARY KEY,
    title VARCHAR(100)
);

-- Relationship Tables

CREATE TABLE CategorisedInto (
    course_id CHAR(12),
    topic_id CHAR(12),
    PRIMARY KEY (course_id, topic_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (topic_id) REFERENCES Topics(topic_id)
);

CREATE TABLE Enrolled (
    student_id CHAR(12),
    course_id CHAR(12),
    enrollment_id CHAR(12),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (enrollment_id) REFERENCES EvaluationData(enrollment_id)
);

CREATE TABLE TaughtBy (
    course_id CHAR(12),
    instructor_id CHAR(12),
    PRIMARY KEY (course_id, instructor_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE InCollaboration (
    course_id CHAR(12),
    university_id CHAR(12),
    PRIMARY KEY (course_id, university_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (university_id) REFERENCES PartnerUniversities(university_id)
);

CREATE TABLE AffiliatedWith (
    instructor_id CHAR(12),
    university_id CHAR(12),
    PRIMARY KEY (instructor_id, university_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id),
    FOREIGN KEY (university_id) REFERENCES PartnerUniversities(university_id)
);

CREATE TABLE Prerequisites (
    course_id CHAR(12),
    prerequisite_course_id CHAR(12),
    PRIMARY KEY (course_id, prerequisite_course_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (prerequisite_course_id) REFERENCES Courses(course_id)
);

CREATE TABLE HasBooks (
    course_id CHAR(12),
    book_id CHAR(12),
    PRIMARY KEY (course_id, book_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE HasVideos (
    course_id CHAR(12),
    video_id CHAR(12),
    PRIMARY KEY (course_id, video_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE HasNotes (
    course_id CHAR(12),
    note_id CHAR(12),
    PRIMARY KEY (course_id, note_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (note_id) REFERENCES Notes(note_id)
);
