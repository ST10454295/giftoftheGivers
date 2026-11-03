CREATE DATABASE GOTG;
GO
USE GOTG;
GO


CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(70) NOT NULL,
    Role NVARCHAR(20) NOT NULL
);


CREATE TABLE ReliefProjects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ManagerID INT NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    DisasterType NVARCHAR(50) NOT NULL,
    Location NVARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    FOREIGN KEY (ManagerID) REFERENCES Users(UserID)
);
GO

CREATE TABLE Volunteers (
    VolunteerID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    ProjectID INT NULL,
    IDNumber NVARCHAR(13) NOT NULL UNIQUE,
    Phone NVARCHAR(20) NOT NULL,
    Skills NVARCHAR(100),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProjectID) REFERENCES ReliefProjects(ProjectID)
);


CREATE TABLE Donations (
    DonationID INT IDENTITY(1,1) PRIMARY KEY,
    DonorID INT NOT NULL,
    ProjectID INT NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Type NVARCHAR(50) NOT NULL,
    FOREIGN KEY (DonorID) REFERENCES Users(UserID),
    FOREIGN KEY (ProjectID) REFERENCES ReliefProjects(ProjectID)
);


CREATE TABLE ResourceAllocations (
    AllocationID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    ResourceType NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES ReliefProjects(ProjectID)
);

