CREATE TABLE Account (
  accNo INTEGER PRIMARY KEY NOT NULL,
  balance REAL,
  type TEXT
);

INSERT INTO Account VALUES (11111, 1234.50, 'saving');
INSERT INTO Account VALUES (22222, 7654.32, 'check');
INSERT INTO Account VALUES (99999, -8888.0, 'loan');

CREATE TABLE Holder (
  accNo INTEGER NOT NULL,
  name TEXT NOT NULL,
  address TEXT,
  PRIMARY KEY (accNo, name),
  FOREIGN KEY (accNo) REFERENCES Account (accNo)
);

INSERT INTO Holder VALUES (11111, 'Dexter Morgan', '666 Miami Road');
INSERT INTO Holder VALUES (22222, 'Steven Roger', '222 Patriot Street');
INSERT INTO Holder VALUES (22222, 'Peggy Carter', '999 Mavel Avenue');
INSERT INTO Holder VALUES (99999, 'John Reese', '314 Machine Place');
