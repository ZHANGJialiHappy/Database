DROP TABLE IF EXISTS ClubMembership;
DROP TABLE IF EXISTS Rates;
DROP TABLE IF EXISTS Participates;
DROP TABLE IF EXISTS Hiker;
DROP TABLE IF EXISTS Club;
DROP TABLE IF EXISTS BrandRepresentative; 
DROP TABLE IF EXISTS BRAND;
DROP TABLE IF EXISTS WorksFor;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Certification;
DROP TABLE IF EXISTS Guides;
DROP TABLE IF EXISTS Guide;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Prerequisite;
DROP TABLE IF EXISTS Contains;
DROP TABLE IF EXISTS Destination;
DROP TABLE IF EXISTS Package;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Trip;


CREATE TABLE Brand (
    ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR(100) UNIQUE
);

CREATE TABLE BrandRepresentative (
    ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    BrandID INT REFERENCES Brand(ID),
    Payment DECIMAL(10, 2) -- Payment received by the representative
);

CREATE TABLE Person(
    ID  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    SSN VARCHAR(11) UNIQUE,
    Phone VARCHAR NOT NULL UNIQUE
);

CREATE TABLE Hiker (
    HikerID INT PRIMARY KEY REFERENCES Person(ID),
    HighestPeak VARCHAR(100), -- Assuming highest peak is stored as a string
    ReID INT REFERENCES BrandRepresentative(ID)
);


CREATE TABLE Guide (
    GuideID INT PRIMARY KEY REFERENCES Person(ID),
    Specialization VARCHAR(100) -- Assuming specialization is stored as a string
);

CREATE TABLE Company (
    ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE WorksFor (
    PeopleID INT REFERENCES Guide(GuideID),
    CompanyID INT REFERENCES Company(ID),
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (PeopleID, CompanyID)
);

CREATE TABLE Certification (
    Name VARCHAR(100) NOT NULL,
    GuideID INT NOT NULL REFERENCES Guide(GuideID),
    IssueDate DATE NOT NULL,
    Academy VARCHAR(100) NOT NULL,
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'E', 'F')),
    PRIMARY KEY(Name, GuideID)
);

CREATE TABLE Product (
    ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Destination (
    ID INT PRIMARY KEY REFERENCES Product(ID),
    Name VARCHAR(100) NOT NULL,
    TrackName VARCHAR(100) NOT NULL,
    Distance DECIMAL(8, 2) NOT NULL,
    Elevation INT NOT NULL,
    DifficultyRating VARCHAR(50) NOT NULL,
    CONSTRAINT uk_destination_name_trackname UNIQUE (Name, TrackName)
);

CREATE TABLE Prerequisite (
    DestinationID INT REFERENCES Destination(ID),
    PrerequisiteID INT REFERENCES Destination(ID),
    PRIMARY KEY (DestinationID, PrerequisiteID)
);

CREATE TABLE Package (
    ID INT PRIMARY KEY REFERENCES Product(ID),
    Name VARCHAR(100) NOT NULL,
    DifficultyRating VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Contains (
    PackageID INT REFERENCES Package(ID),
    DestinationID INT REFERENCES Destination(ID),
    PRIMARY KEY (PackageID, DestinationID)
);

CREATE TABLE Club (
    ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    EstablishmentDate DATE NOT NULL,
    ReID INT REFERENCES BrandRepresentative(ID)
);

CREATE TABLE ClubMembership (
    ClubID INT REFERENCES Club(ID),
    HikerID INT REFERENCES Hiker(HikerID),
    PRIMARY KEY (ClubID, HikerID)
);

CREATE TABLE Trip (
    ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    StartDate DATE NOT NULL
);


CREATE TABLE Participates (
    HikerID INT NOT NULL REFERENCES Hiker(HikerID),
    TripID INT NOT NULL REFERENCES Trip(ID),
    PRIMARY KEY (HikerID, TripID)
);

CREATE TABLE Guides(
    GuideID INT NOT NULL REFERENCES Guide(GuideID),
    TripID INT NOT NULL REFERENCES Trip(ID),
    PRIMARY KEY (GuideID, TripID)
);

CREATE TABLE Rates (
    HikerID INT,
    TripID INT,
    GuideID INT,
    Date DATE NOT NULL,
    Rating VARCHAR(50) NOT NULL,
    FOREIGN KEY(HikerID, TripID) REFERENCES Participates(HikerID, TripID),
    FOREIGN KEY(GuideID, TripID) REFERENCES Guides(GuideID, TripID),
    PRIMARY KEY (HikerID,TripID, GuideID)
)

