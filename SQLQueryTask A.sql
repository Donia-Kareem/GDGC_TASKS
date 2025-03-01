--Create Database
CREATE DATABASE SocialMedia;
USE SocialMedia;

--User Table
CREATE TABLE Users(
UserID  INT IDENTITY(1,1) PRIMARY KEY,
UserName VARCHAR(100) NOT NULL,
DOB DATE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL,
Gender VARCHAR(20) NOT NULL,
JoinDate DATETIME DEFAULT GETDATE()
);
-- Interaction Table 
CREATE TABLE Interactions(
InteracID INT IDENTITY(1,1) PRIMARY KEY,
Type  VARCHAR(50) NOT NULL,
InteracDate DATETIME DEFAULT GETDATE()
);
-- Post Table 
CREATE TABLE Posts(
PostID INT IDENTITY(1,1) PRIMARY KEY,
UserID INT NOT NULL,
Content TEXT NOT NULL,
PostDate DATETIME DEFAULT GETDATE(),
Visibility VARCHAR(20) NOT NULL,
FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- Comments Table 
CREATE TABLE Comments (
 CommentID INT IDENTITY(1,1) PRIMARY KEY,
 UserID INT NOT NULL,
 PostID INT NOT NULL,
 CommentDate DATETIME DEFAULT GETDATE(),
 Content TEXT NOT NULL,
 FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
 FOREIGN KEY (PostID) REFERENCES Posts(PostID) 
);
-- Interact Table 
CREATE TABLE Interact (
 UserID INT NOT NULL,
 PostID INT NOT NULL,
 InteractionID INT NOT NULL,
 PRIMARY KEY (UserID, PostID, InteractionID),
 FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
 FOREIGN KEY (PostID) REFERENCES Posts(PostID) ,
 FOREIGN KEY (InteractionID) REFERENCES Interactions(InteracID) 
);
-- Insert users
INSERT INTO Users(UserName,DOB,email,Gender) VALUES('Donia', '2004-08-03', 'Donia@gmail.com', 'Female'),
('Kareem', '1998-10-15', 'Kareem@gmail.com', 'Male');

-- Insert posts
INSERT INTO Posts (UserID, Content, Visibility) VALUES
(1, 'Hello, this is my first post!', 'Public'),
(2, 'I Love coffee very much!', 'Friends');
-- Insert comments
INSERT INTO Comments (UserID, PostID, Content) VALUES
(2, 1, 'Nice post'),
(1, 2, 'Looks delicious!');
-- Insert interactions
INSERT INTO Interactions (Type) VALUES
('Like'), ('Share');
-- Insert interact
INSERT INTO Interact (UserID, PostID, InteractionID) VALUES
(2, 1, 1), 
(1, 2, 2); 

-----Delete the Users table
DROP TABLE Users;
--Drop the entire SocialMedia database.
DROP DATABASE SocialMedia ;



