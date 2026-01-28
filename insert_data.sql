-- Name: Siddhant Singh
-- Roll Number: 23CS10085
-- Department: Computer Science and Engineering
-- DBMS Lab
-- Assignment Number: 2

-- Row Insertions

-- Inserting Values Into Entity Tables

INSERT INTO Courses VALUES
('COURSE000001', 'GenAI', 6, 'certificate'),
('COURSE000002', 'AI Basics', 4, 'certificate'),
('COURSE000003', 'Advanced AI', 8, 'degree'),
('COURSE000004', 'ML Foundations', 5, 'certificate');

INSERT INTO Topics VALUES
('TOPIC0000001', 'AI', 'Artificial Intelligence'),
('TOPIC0000002', 'ML', 'Machine Learning'),
('TOPIC0000003', 'DS', 'Data Science');

INSERT INTO Students VALUES
('STUD00000001', 'Rahul', 'rahul@mail.com', '1111111111', '2008-01-01', 17, 'Beginner', 'Medium', 'GEN', 'India', '2024-01-01'),
('STUD00000002', 'John', 'john@mail.com', '2222222222', '1955-01-01', 69, 'Advanced', 'High', 'GEN', 'USA', '2024-01-01'),
('STUD00000003', 'Aiko', 'aiko@mail.com', '3333333333', '2000-01-01', 25, 'Intermediate', 'Medium', 'GEN', 'Japan', '2024-01-01'),
('STUD00000004', 'Ananya', 'ananya@mail.com', '4444444444', '1999-01-01', 26, 'Advanced', 'High', 'GEN', 'India', '2024-01-01');

INSERT INTO Instructors VALUES
('INST00000001', 'Andrew Ng', 'andrew@ai.com', '9999999999', 'PhD in AI', 'Artificial Intelligence', '1976-01-01', 48, 'USA'),
('INST00000002', 'Yann LeCun', 'yann@ml.com', '8888888888', 'PhD in ML', 'Machine Learning', '1960-01-01', 65, 'France');

INSERT INTO PartnerUniversities VALUES
('UNIV0000001', 'IITKGP', 'Kharagpur', 'West Bengal', 'India', 721302),
('UNIV0000002', 'Stanford', 'Stanford', 'California', 'USA', 94305);

INSERT INTO EvaluationData VALUES
('ENROLL000001', '2024-01-10', 'A1', '90', 90, 'A'),
('ENROLL000002', '2024-01-12', 'A1', '85', 85, 'A'),
('ENROLL000003', '2024-01-15', 'A1', '95', 95, 'A'),
('ENROLL000004', '2024-01-20', 'A1', '88', 88, 'A');

INSERT INTO Books VALUES
('BOOK00000001', 'Artificial Intelligence: A Modern Approach', 'Stuart Russell'),
('BOOK00000002', 'Deep Learning', 'Ian Goodfellow'),
('BOOK00000003', 'Machine Learning Yearning', 'Andrew Ng');

INSERT INTO Videos VALUES
('VIDEO0000001', 'Intro to AI', 'https://video.ai/intro'),
('VIDEO0000002', 'Neural Networks Explained', 'https://video.ai/nn'),
('VIDEO0000003', 'Machine Learning Basics', 'https://video.ml/basics');

INSERT INTO Notes VALUES
('NOTE00000001', 'AI Fundamentals Notes'),
('NOTE00000002', 'Deep Learning Cheatsheet'),
('NOTE00000003', 'ML Revision Notes');

-- Inserting Values Into Relationship Tables

INSERT INTO CategorisedInto VALUES
('COURSE000001', 'TOPIC0000001'),
('COURSE000002', 'TOPIC0000001'),
('COURSE000003', 'TOPIC0000001'),
('COURSE000004', 'TOPIC0000002');

INSERT INTO Enrolled VALUES
('STUD00000001', 'COURSE000001', 'ENROLL000001'),
('STUD00000002', 'COURSE000001', 'ENROLL000002'),
('STUD00000003', 'COURSE000002', 'ENROLL000003'),
('STUD00000004', 'COURSE000001', 'ENROLL000004'),
('STUD00000004', 'COURSE000002', 'ENROLL000003');

INSERT INTO TaughtBy VALUES
('COURSE000001', 'INST00000001'),
('COURSE000002', 'INST00000001'),
('COURSE000003', 'INST00000002');

INSERT INTO InCollaboration VALUES
('COURSE000001', 'UNIV0000001'),
('COURSE000002', 'UNIV0000001'),
('COURSE000004', 'UNIV0000002');

INSERT INTO AffiliatedWith VALUES
('INST00000001', 'UNIV0000001'),
('INST00000001', 'UNIV0000002'),
('INST00000002', 'UNIV0000002');

INSERT INTO Prerequisites VALUES
('COURSE000001', 'COURSE000002'),
('COURSE000003', 'COURSE000001'),
('COURSE000004', 'COURSE000002');

INSERT INTO HasBooks VALUES
('COURSE000001', 'BOOK00000001'),
('COURSE000001', 'BOOK00000003'),
('COURSE000002', 'BOOK00000001'),
('COURSE000004', 'BOOK00000002');

INSERT INTO HasVideos VALUES
('COURSE000001', 'VIDEO0000001'),
('COURSE000001', 'VIDEO0000002'),
('COURSE000002', 'VIDEO0000001'),
('COURSE000004', 'VIDEO0000003');

INSERT INTO HasNotes VALUES
('COURSE000001', 'NOTE00000001'),
('COURSE000001', 'NOTE00000002'),
('COURSE000002', 'NOTE00000001'),
('COURSE000004', 'NOTE00000003');