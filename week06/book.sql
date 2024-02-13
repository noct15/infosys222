DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Writing;
DROP TABLE IF EXISTS StaffAssignment;
DROP TABLE IF EXISTS BookPrice;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS TransactionType;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS BookGrade;
DROP TABLE IF EXISTS Branch;

CREATE TABLE Branch
(branchNo INTEGER PRIMARY KEY NOT NULL,
 branchName TEXT,
 branchStreet TEXT,
 branchSuburb TEXT,
 branchCity TEXT
);

INSERT INTO Branch (branchName, branchStreet, branchSuburb, branchCity) VALUES ('McMillans Sylvia Park', '305 Sylvia Park Road', 'Mt Wellington', 'Auckland');
INSERT INTO Branch (branchName, branchStreet, branchSuburb, branchCity) VALUES ('McMillans One Tree Hill','1289 Campbell Road','One Tree Hill', 'Auckland');
INSERT INTO Branch (branchName, branchStreet, branchSuburb, branchCity) VALUES ('McMillans Hamilton', '23 Colombo Street', 'Hillwood Mall','Hamilton');
INSERT INTO Branch (branchName, branchStreet, branchSuburb, branchCity) VALUES ('McMillans North Shore','78 Albany Street', 'Albany Mall','North Shore');

CREATE TABLE Publisher
(pubCode INTEGER PRIMARY KEY NOT NULL,
 pubName TEXT,
 pubCity TEXT,
 pubCityCode TEXT,
 parentPubCode INTEGER,
 FOREIGN KEY (parentPubCode) REFERENCES Publisher (pubCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (1,'Bridgeman Publishers','Wellington','WI', NULL);
INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (2,'Chuck Sawyer Books','New Plymouth','NP',1);
INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (3,'Lake House Books','Christchurch','CC',1);
INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (4,'Barclay Books','Auckland', 'AK',1);
INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (5,'Metcalf Publishers','Hamilton','HA',2);
INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (6,'Hatfield and Sons','Dunedin','CC',2);
INSERT INTO Publisher (pubCode, pubName, pubCity, pubCityCode, parentPubCode) VALUES (7,'McMillan Publishing Ltd','Kingston','KT',2);

CREATE TABLE Author
(authorNo INTEGER PRIMARY KEY NOT NULL,
 authorFirstName TEXT,
 authorLastName TEXT,
 authorStreet TEXT,
 authorSuburb TEXT,
 authorCity TEXT
);

INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('De Silva','Clarice', '21 Park View Street', 'Park View', 'Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Stevens','Rob', '123 Hungry Lane', 'Meadowbank','Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Peiris','Louis', '463 Galle Road','Moratuwa', 'Napier');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Parker','Clive','21 Anderson Glen Road','Glen Innes','Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Mendis','Theodora','75D Glenvar Road','Torbay', 'Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Bingly','Lisa', '14E Glenfield Road','Glenfield','Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('St.Louis','Gabriella','1163 Remuera Road','Remuera','Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Coorey','Beatrice','456 Dominion Road','Mt Eden','Auckland');
INSERT INTO Author (authorFirstName, authorLastName, authorStreet, authorSuburb, authorCity) VALUES ('Koorey','Beatrice','12 Peach Parade','Remuera','Auckland');

CREATE TABLE Book
(bookCode INTEGER PRIMARY KEY NOT NULL,
 bookTitle TEXT,
 bookType TEXT,
 paperback TEXT CHECK (paperback IN ('Y','N'))
);

INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (110,'Far from the Crowd','PSY','Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (111,'A Loud Game','FIC','Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (112,'The Artist','FIC','Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (113,'Passage to Freedom','HOR','N');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (114,'Tornado','MYS','Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (115,'Knockdown','MYS','Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (116,'Judo','HOR','Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (117,'Sneaky Stories',NULL,'Y');
INSERT INTO Book (bookCode, bookTitle, bookType, paperback) VALUES (999,'Pilgrim''s Progress',NULL,'N');

CREATE TABLE BookPrice
(bookCode INTEGER NOT NULL,
 startDate DATE NOT NULL,
 endDate DATE,
 price REAL,
 PRIMARY KEY (bookCode, startDate),
 FOREIGN KEY (bookCode) REFERENCES Book (bookCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (110, '2007-08-01','2007-08-10', 32.50);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (111, '2007-08-01','2008-12-31', 132.50);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (110, '2007-08-11','2008-12-31', 82.50);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (112, '2007-08-01','2008-12-31', 300.00);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (113, '2007-08-01','2008-12-31', 47.10);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (114, '2007-08-01','2007-08-10', 98.10);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (115, '2007-08-01','2008-12-31', 23.45);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (114, '2007-08-11','2008-12-31', 56.24);
INSERT INTO BookPrice (bookCode, startDate, endDate, price) VALUES (116, '2007-08-01','2008-12-31', 84.50);

CREATE TABLE Writing
(bookCode INTEGER NOT NULL,
 authorNo INTEGER NOT NULL,
 pubCode INTEGER,
 edition INTEGER,
 pubDate DATE,
 PRIMARY KEY (bookCode, authorNo),
 FOREIGN KEY (bookCode) REFERENCES Book (bookCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION,
 FOREIGN KEY (authorNo) REFERENCES Author (authorNo)
 ON UPDATE NO ACTION ON DELETE NO ACTION,
 FOREIGN KEY (pubCode) REFERENCES Publisher (pubCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (110, 1, 4, 1, '2006-08-31');
INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (111, 1, 1, 1, '2004-07-13');
INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (112, 2, 2, 2, '2000-01-02');
INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (113, 3, 2, 1, '2003-03-01');
INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (114, 4, 7, 3, '2007-06-15');
INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (115, 4, 5, 1, '1972-01-23');
INSERT INTO Writing (bookCode, authorNo, pubCode, edition, pubDate) VALUES (116, 6, 6, 2, '1985-02-24');

CREATE TABLE TransactionType
(transactionTypeID INTEGER PRIMARY KEY NOT NULL,
 transactionType TEXT
);

INSERT INTO TransactionType (transactionType) VALUES ('SOLD');
INSERT INTO TransactionType (transactionType) VALUES ('RECEIVED');

CREATE TABLE Inventory
(transactionNo INTEGER PRIMARY KEY NOT NULL,
 transactionDate DATE,
 bookCode INTEGER,
 branchNo INTEGER,
 quantity INTEGER,
 transactionTypeID INTEGER,
 FOREIGN KEY (bookCode) REFERENCES Book (bookCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION,
 FOREIGN KEY (branchNo) REFERENCES Branch (branchNo)
 ON UPDATE NO ACTION ON DELETE NO ACTION,
 FOREIGN KEY (transactionTypeID) REFERENCES TransactionType (transactionTypeID)
 ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 110, 1, 200, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 111, 2, 200, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 112, 1, 100, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 112, 2, 300, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 114, 2, 100, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 114, 3, 200, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 114, 4, 300, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 116, 1, 100, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 116, 2, 400, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-10', 116, 3, 200, 2);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-08-10', 110, 1, 100, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-08-15', 111, 2, 90, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-08-31', 112, 1, 100, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-31', 112, 2, 156, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-28', 114, 2, 40, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-20', 114, 2, 2, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-20', 114, 3, 1, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-08-15', 114, 3, 20, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-15', 114, 3, 1, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-18', 114, 4, 3, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-08-12', 116, 2, 4, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-08-13', 114, 4, 3, 1);
INSERT INTO Inventory (transactionDate, bookCode, branchNo, quantity, transactionTypeID) VALUES ('2007-07-12', 116, 3, 2, 1);

CREATE TABLE BookGrade
(bookGrade TEXT PRIMARY KEY NOT NULL,
 minValue REAL,
 maxValue REAL
);

INSERT INTO BookGrade (bookGrade, minValue, maxValue) VALUES ('Very High', 150.00, 1999.99);
INSERT INTO BookGrade (bookGrade, minValue, maxValue) VALUES ('High', 100.00, 149.99);
INSERT INTO BookGrade (bookGrade, minValue, maxValue) VALUES ('Medium', 50.00, 99.99);
INSERT INTO BookGrade (bookGrade, minValue, maxValue) VALUES ('Low', 25.00, 49.99);
INSERT INTO BookGrade (bookGrade, minValue, maxValue) VALUES ('Very Low', 0.00, 24.99);

CREATE TABLE Role
(roleID INTEGER PRIMARY KEY NOT NULL,
 role TEXT
);

INSERT INTO Role (role) VALUES ('Branch Manager');
INSERT INTO Role (role) VALUES ('Sales Person');
INSERT INTO Role (role) VALUES ('Office Admin');

CREATE TABLE Staff
(staffCode INTEGER PRIMARY KEY NOT NULL,
 staffFirstName TEXT,
 staffLastName TEXT,
 staffStreet TEXT,
 staffSuburb TEXT,
 staffCity TEXT
);

INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Deepak', 'Gupta','78 Xerox Road', 'Celeste', 'Hamilton');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Stephen', 'Marks','45 Albert Place','Mt Albert','Auckland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Frances', 'Spencer','34 Slumber Lane','Napier','Nelson');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('James', 'McDonald','56 May Fair Road','Mayfair','Dunedin');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Ethel', 'Todd','324 Crooked House','Crooked Suburb','Westland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Karen', 'Jones','591 Sherry Berry Avenue','Devonport','Auckland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Sean', 'Henderson','1123 Oxford Street','Karangahape','Auckland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Viana', 'Tawa','654 Maple Road','Manukau Heights','Manukau');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Sherene', 'Hewage','656 Spider Forest Street','Forest Hill','Auckland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Brendan', 'Pikes','894 Cooks Street','St Heliers','Auckland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Martin', 'Cruise','18 St Johns Road','St Johns','Auckland');
INSERT INTO Staff (staffFirstName, staffLastName, staffStreet, staffSuburb, staffCity) VALUES ('Charles', 'Schindler','35 St Stevens Avenue','Kohimarama','Auckland');

CREATE TABLE StaffAssignment
(assignmentID INTEGER PRIMARY KEY NOT NULL,
 roleID INTEGER,
 branchNo INTEGER,
 staffCode INTEGER,
 startDate DATE,
 endDate DATE,
 salary REAL,
 FOREIGN KEY (roleID) REFERENCES Role (roleID)
 ON UPDATE NO ACTION ON DELETE NO ACTION,
 FOREIGN KEY (branchNo) REFERENCES Branch (branchNo)
 ON UPDATE NO ACTION ON DELETE NO ACTION,
 FOREIGN KEY (staffCode) REFERENCES Staff (staffCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (1, 1, 1, '2007-07-01', NULL, 72000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (1, 2, 2, '2007-08-01','2020-12-31', 64000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (1, 3, 3, '2007-07-01','2020-12-31', 45000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (1, 4, 4, '2007-08-01','2020-12-31', 54000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (2, 1, 5, '2007-08-08','2009-01-01', 48000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (2, 2, 6, '2007-07-08', NULL, 35000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (2, 3, 7, '2007-12-08','2010-09-09', 40000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (2, 4, 8, '2007-08-08', NULL, 40000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (3, 1, 9, '2007-11-08', NULL, 45000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (3, 2, 10, '2007-08-10', NULL, 50000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (3, 3, 11, '2007-08-10', NULL, 45000);
INSERT INTO StaffAssignment (roleID, branchNo, staffCode, startDate, endDate, salary) VALUES (3, 4, 12, '2007-08-10','2015-10-05', 50000);
