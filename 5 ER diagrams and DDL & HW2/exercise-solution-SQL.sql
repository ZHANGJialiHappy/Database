-- 15
CREATE TABLE Ranking (
       ID INT,
       name VARCHAR(50) NOT NULL,
       startyear INT NOT NULL,
       PRIMARY KEY (ID),
       UNIQUE (name)
);

-- 16
CREATE TABLE IndivRanking (
       ID INT,
       gender CHAR(1) NOT NULL CHECK (gender ='M' OR gender = 'F' OR gender = 'O'),
       age INT NOT NULL CHECK (age >= 0),
       PRIMARY KEY (ID),
       FOREIGN KEY (ID) REFERENCES Ranking (ID)
);

-- 16
CREATE TABLE ClubRanking (
       ID INT,
       PRIMARY KEY (ID),
       FOREIGN KEY (ID) REFERENCES Ranking (ID)
);

-- 16
CREATE TABLE GlobalClubRanking (
       ID INT,
       PRIMARY KEY (ID),
       FOREIGN KEY (ID) REFERENCES ClubRanking (ID)
);

-- 16
CREATE TABLE NationalClubRanking (
       ID INT,
       nationality VARCHAR(50) NOT NULL,
       PRIMARY KEY (ID),
       UNIQUE (nationality),
       FOREIGN KEY (ID) REFERENCES ClubRanking (ID)
);

-- 1, 17
CREATE TABLE Dane (
       ID INT,
       name VARCHAR(50) NOT NULL,
       gender CHAR(1)  NOT NULL CHECK (gender ='M' OR gender = 'F' OR gender = 'O'),
       nationality VARCHAR(50) NOT NULL,
       rankingID INT NOT NULL,
       rank INT NOT NULL,
       PRIMARY KEY (ID),
       FOREIGN KEY (rankingID) REFERENCES IndivRanking(ID)
);

-- 2
CREATE TABLE Degree (
       daneID INT,
       level CHAR(3),
       subject VARCHAR(50),
       inst VARCHAR(50) NOT NULL,
       year INT NOT NULL,
       PRIMARY KEY (daneID, level, subject),
       FOREIGN KEY (daneID) REFERENCES Dane (ID)
);

-- 3, 18
CREATE TABLE Club (
       ID INT,
       name VARCHAR(59) NOT NULL,
       nationality VARCHAR(50) NOT NULL,
       nationalrankingID INT NOT NULL,
       nationalrank INT NOT NULL,
       globalrankingID INT NOT NULL,
       globalrank INT NOT NULL,
       PRIMARY KEY (ID),
       UNIQUE (name, nationality),
       FOREIGN KEY (nationalrankingID) REFERENCES NationalClubRanking(ID),
       FOREIGN KEY (globalrankingID) REFERENCES GlobalClubRanking(ID)
);

-- 4
CREATE TABLE Member (
       daneID INT,
       clubID INT,
       _start DATE,
       _end DATE NULL,       
       PRIMARY KEY (daneID, clubID, _start),
       FOREIGN KEY (daneID) REFERENCES Dane(ID),
       FOREIGN KEY (clubID) REFERENCES Club(ID)
);

-- 6
CREATE TABLE PDFemp (
       ID INT,
       name VARCHAR(50) NOT NULL,
       PRIMARY KEY (ID)
);

-- 5, 6
CREATE TABLE Tournament (
       ID INT,
       name VARCHAR(50) NOT NULL,
       venue VARCHAR(50) NOT NULL,
       date DATE NOT NULL,
       clubID INT NOT NULL,
       empID INT NOT NULL,
       PRIMARY KEY (ID),
       FOREIGN KEY (clubID) REFERENCES Club(ID),
       FOREIGN KEY (empID) REFERENCES PDFemp(ID)
);

-- 7, 9
CREATE TABLE League (
       ID INT,
       name VARCHAR(50) NOT NULL,
       number INT NOT NULL,
       time TIME NOT NULL,
       duration INT NOT NULL,
       gender CHAR(1)  NOT NULL CHECK (gender ='M' OR gender = 'F' OR gender = 'X'),
       tournamentID INT NOT NULL,
       PRIMARY KEY (ID),
       UNIQUE (tournamentID, number, gender),
       FOREIGN KEY (tournamentID) REFERENCES Tournament(ID)
);

-- 8
CREATE TABLE Participates (
       daneID INT,
       leagueID INT,
       _rank INT NULL,
       PRIMARY KEY (daneID, leagueID),
       FOREIGN KEY (daneID) REFERENCES Dane(ID),
       FOREIGN KEY (leagueID) REFERENCES League(ID)
);

-- 10
CREATE TABLE Pays (
       daneID INT,
       leagueID INT,
       clubID INT NOT NULL,
       fee INT NOT NULL,
       PRIMARY KEY (daneID, leagueID),
       FOREIGN KEY (daneID, leagueID) REFERENCES Participates (daneID, leagueID),
       FOREIGN KEY (clubID) REFERENCES Club(ID)
);

-- 11, 12
CREATE TABLE Problem (
       ID INT,
       name VARCHAR(50) NOT NULL,
       dancestep VARCHAR(50) NOT NULL,
       text VARCHAR(200) NOT NULL,
       PRIMARY KEY (ID),
       UNIQUE (name)
);

-- 11
CREATE TABLE ConsistsOf (
       leagueID INT,
       problemID INT,
       PRIMARY KEY (leagueID, problemID),
       FOREIGN KEY (leagueID) REFERENCES League(ID),
       FOREIGN KEY (problemID) REFERENCES Problem(ID)
);

-- 11
CREATE TABLE WrittenBy (
       problemID INT,
       PDFempID INT,
       PRIMARY KEY (problemID, PDFempID),
       FOREIGN KEY (problemID) REFERENCES Problem(ID),
       FOREIGN KEY (PDFempID) REFERENCES PDFemp(ID)
);

-- 13
CREATE TABLE TestCase (
       problemID INT,
       name VARCHAR(50),
       porder INT NOT NULL,
       input VARCHAR(2000) NULL,
       output VARCHAR(2000) NOT NULL,
       PRIMARY KEY (problemID, name),
       UNIQUE (problemID, porder),
       FOREIGN KEY (problemID) REFERENCES Problem(ID)
);

-- 14
CREATE TABLE Solves (
       daneID INT,
       leagueID INT,
       problemID INT,
       dscore INT NOT NULL CHECK (dscore >=0 AND dscore <=100),
       pscore INT NOT NULL CHECK (pscore >=0 AND pscore <=100),
       PRIMARY KEY (daneID, leagueID, problemID),
       FOREIGN KEY (daneID, leagueID) REFERENCES Participates (daneID, leagueID),
       FOREIGN KEY (leagueID, problemID) REFERENCES ConsistsOf (leagueID, problemID)
);

-- 19
CREATE TABLE Sponsor (
       ID INT,
       name VARCHAR(50) NOT NULL,
       nationality VARCHAR(50) NOT NULL,
       PRIMARY KEY (ID)
);

-- 19
CREATE TABLE ClubSponsors (
       sponsorID INT,
       clubID INT NOT NULL,
       text VARCHAR(200) NOT NULL,
       amount INT NOT NULL,
       PRIMARY KEY (sponsorID),
       FOREIGN KEY (sponsorID) REFERENCES Sponsor(ID),
       FOREIGN KEY (clubID) REFERENCES Club(ID)
);

-- 20
CREATE TABLE DaneSponsors (
       sponsorID INT,
       daneID INT,
       amount INT NOT NULL,
       PRIMARY KEY (sponsorID, daneID),
       FOREIGN KEY (sponsorID) REFERENCES Sponsor(ID),
       FOREIGN KEY (daneID) REFERENCES Dane(ID)
);
