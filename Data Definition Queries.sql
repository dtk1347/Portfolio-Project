-- -----------------------------------------------------
-- Group 22: Rockin' River Rafting Trip Management Database
-- Authors: Daniel Kaufman and Russell Myers
-- -----------------------------------------------------

SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;
-------------------------
-- CREATE Guides Table --
-------------------------
CREATE OR REPLACE TABLE Guides (
    guideID INT AUTO_INCREMENT PRIMARY KEY,
    guideName VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    phoneNumber VARCHAR(15) NOT NULL
);
-------------------------
-- CREATE Rivers Table---
-------------------------
CREATE OR REPLACE TABLE Rivers (
    riverID INT AUTO_INCREMENT PRIMARY KEY,
    riverName VARCHAR(50) NOT NULL,
    miles DECIMAL NOT NULL,
    isClosed BOOLEAN
);

-------------------------
-- CREATE Rafts Table----
-------------------------
CREATE OR REPLACE TABLE Rafts (
    raftID INT AUTO_INCREMENT PRIMARY KEY,
    raftName VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    isDamaged BOOLEAN
);
-------------------------
-- CREATE Courses Table -
-------------------------
CREATE OR REPLACE TABLE Courses (
    courseID INT AUTO_INCREMENT PRIMARY KEY,
    courseName VARCHAR(50) NOT NULL,
    completionTime INT NOT NULL,
    difficulty VARCHAR(50) NOT NULL,
    riverID INT NOT NULL,
    FOREIGN KEY (riverID) REFERENCES Rivers(riverID)
);
-------------------------
-- Create Schedules Table
-------------------------
CREATE OR REPLACE TABLE Schedules (
    scheduleID INT AUTO_INCREMENT PRIMARY KEY,
    scheduleDate DATE NOT NULL,
    courseID INT NOT NULL,
    raftID INT NOT NULL,
    guideID INT NOT NULL,
    FOREIGN KEY (courseID) REFERENCES Courses(courseID),
    FOREIGN KEY (raftID) REFERENCES Rafts(raftID),
    FOREIGN KEY (guideID) REFERENCES Guides(guideID)
);
-------------------------
-- CREATE CourseCertifications Table
-------------------------
CREATE OR REPLACE TABLE CourseCertifications (
    courseID INT,
    guideID INT,
    certificationDate DATETIME NOT NULL,
    PRIMARY KEY (courseID, guideID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID),
    FOREIGN KEY (guideID) REFERENCES Guides(guideID)
);
-------------------------
-- CREATE CourseRafts Table
-------------------------
CREATE OR REPLACE TABLE CourseRafts (
    courseID INT,
    raftID INT,
    isAllowed BOOLEAN NOT NULL,
    PRIMARY KEY (courseID, raftID),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID),
    FOREIGN KEY (raftID) REFERENCES Rafts(raftID)
);
-------------------------
-- INSERT Sample Data for Guides
-------------------------
INSERT INTO Guides (guideName, experience, phoneNumber) VALUES 
('John Doe', 5, '555-1234'),
('Jane Smith', 7, '555-5678'),
('Emily Davis', 3, '555-9012');

-------------------------
-- INSERT Sample Data for Rivers
-------------------------
INSERT INTO Rivers (riverName, miles, isClosed) VALUES 
('Bear River', 120.5, FALSE),
('Eagle River', 80.3, FALSE),
('Snake River', 100.2, TRUE);

-------------------------
-- INSERT Sample Data for Rafts
-------------------------
INSERT INTO Rafts (raftName, capacity, type, isDamaged) VALUES 
('Raft A', 8, 'Inflatable', FALSE),
('Raft B', 6, 'Hard Shell', TRUE),
('Raft C', 10, 'Inflatable', FALSE);

-------------------------
-- INSERT Sample Data for Courses
-------------------------
INSERT INTO Courses (courseName, completionTime, difficulty, riverID) VALUES 
('Easy Breezy', 120, 'Beginner', 1),
('Rock and Roll', 180, 'Intermediate', 2),
('White Water Challenge', 240, 'Advanced', 3);

-------------------------
-- INSERT Sample Data for Schedules
-------------------------
INSERT INTO Schedules (scheduleDate, courseID, raftID, guideID) VALUES 
('2024-07-16', 1, 1, 1),
('2024-07-17', 2, 2, 2),
('2024-07-18', 3, 3, 3);

-------------------------
-- INSERT Sample Data for CourseCertifications
-------------------------
INSERT INTO CourseCertifications (courseID, guideID, certificationDate) VALUES 
(1, 1, '2024-01-01 09:00:00'),
(2, 2, '2024-01-02 09:00:00'),
(3, 3, '2024-01-03 09:00:00');

-------------------------
-- INSERT Sample Data for CourseRafts
-------------------------
INSERT INTO CourseRafts (courseID, raftID, isAllowed) VALUES 
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, FALSE);

SET FOREIGN_KEY_CHECKS=1;
COMMIT;