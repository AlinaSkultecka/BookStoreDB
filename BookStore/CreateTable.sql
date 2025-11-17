--CREATE DATABASE BookStore;

CREATE TABLE Publisher (
	PublisherID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR (255),
	Address VARCHAR (255)
	);
	
CREATE TABLE Author (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    UNIQUE (FirstName, LastName, DateOfBirth)
);

CREATE TABLE Book (
    ISBN13 CHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Language VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    IssueDate DATE NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID),
    UNIQUE (Title, AuthorID)
);

CREATE TABLE Shop (
	ShopID INT IDENTITY(1,1) PRIMARY KEY,
	ShopName VARCHAR (255) NOT NULL,
	Address VARCHAR (255)
	);

CREATE TABLE StockBalance (
    ShopID INT NOT NULL,
    ISBN13 CHAR(13) NOT NULL,
    BookAmount INT NOT NULL CHECK (BookAmount >= 0),
    PRIMARY KEY (ShopID, ISBN13),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
    FOREIGN KEY (ISBN13) REFERENCES Book(ISBN13)
);

CREATE TABLE Member (
	MemberID INT IDENTITY(1,1) PRIMARY KEY,
	NumberOfOrders INT
	);

CREATE TABLE Customer (
	PersonalNumber VARCHAR(12) PRIMARY KEY,
	FirstName VARCHAR (255) NOT NULL,
	LastName VARCHAR (255) NOT NULL,
	Address VARCHAR (255),
	MemberID INT NULL,
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
	);

CREATE TABLE CustomerOrder (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE NOT NULL,
    PersonalNumber VARCHAR(12) NOT NULL,
    ShopID INT NOT NULL,
    ISBN13 CHAR(13) NOT NULL,
    BookAmount INT NOT NULL CHECK (BookAmount > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    TotalPrice AS (BookAmount * Price) PERSISTED,
    FOREIGN KEY (PersonalNumber) REFERENCES Customer(PersonalNumber),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID),
    FOREIGN KEY (ISBN13) REFERENCES Book(ISBN13)
);