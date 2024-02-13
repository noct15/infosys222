# 🗄 Week 08
### SQL
[©](https://creativecommons.org/licenses/by/4.0/) [Johnny Chan](mailto:jh.chan@auckland.ac.nz)



## 🕒 Previously ...

- Function

- Join

- Subquery



## 📌 Agenda
- Constraint (Revisit)

- Expression
	- CASE and CAST

- Relational operation
	- UNION, UNION ALL, INTERSECT and EXCEPT

- View and trigger



## Constraint
- Data integrity is maintained by constraint. A constraint is a control measure used to restrict the value that can be stored in a column. The database would issue a constraint violation when the restriction is not followed

- These constraints are supported in SQLite:
	- PRIMARY KEY
	- UNIQUE
	- NOT NULL
	- DEFAULT
	- CHECK
	- FOREIGN KEY


## PRIMARY KEY
- In SQLite, an INTEGER PRIMARY KEY column is created when a table is created, whether a PRIMARY KEY constraint is explicitly defined or not
	- It is an integer column named [ROWID](https://www.sqlite.org/lang_createtable.html#rowid)
	- If the keyword [AUTOINCREMENT](https://www.sqlite.org/autoinc.html) is used when defining an INTEGER PRIMARY KEY column, the value of that column will never be recycled

- A PRIMARY KEY must be both UNIQUE and NOT NULL*


## UNIQUE
- A UNIQUE constraint requires that all values in a column or a group of columns to be distinct from other

- It is similar to a PRIMARY KEY constraint, except that a single table may have any number of UNIQUE constraints

```sql
CREATE TABLE Contact (
 id INTEGER PRIMARY KEY NOT NULL,
 name TEXT,
 phone TEXT,
 UNIQUE (name,phone)
);

```
- 🤔 Is NULL value acceptable to a column declared UNIQUE?


## NOT NULL
- A NOT NULL constraint ensures that value in the column may never be NULL; it could only be attached to a column definition but not specified as a table constraint

	- INSERT statement may not add NULL to the column
	- UPDATE statement may not change existing value to NULL

- Attempting to set the value to NULL in these operations causes a constraint violation

- 🤔 How does the NOT NULL constraint in SQL relate to data modelling?


## DEFAULT

- A DEFAULT constraint prevents the absence of a value by specifying a default value for a column; the default value of any column is always NULL unless a DEFAULT constraint is defined

- In SQLite, the default value specified in a DEFAULT constraint could be a literal or a special case-independent keyword:
	- CURRENT_TIME, CURRENT_DATE or CURRENT_TIMESTAMP*

- A DEFAULT constraint could be used together with a NOT NULL constraint

```sql
CREATE TABLE MyTime (
 id INTEGER PRIMARY KEY NOT NULL,
 mytime DATE NOT NULL DEFAULT (DATETIME('now', 'localtime'))
);

```


## CHECK
- A CHECK constraint allows expression to be defined to test values whenever an INSERT or UPDATE statement is run against a column of a table

- Example: We could use a CHECK constraint to restrict the length of a particular column:

```sql
CREATE TABLE Contact (
id INTEGER PRIMARY KEY NOT NULL,
name TEXT,
phone TEXT,
CHECK (LENGTH(phone)>=7)
);

```


## FOREIGN KEY
- A FOREIGN KEY constraint ensures that where a key value in one table logically refers to data in another table, the data in the other table actually exists; it protects the referential integrity by enforcing the relationships between tables

```sql
CREATE TABLE BookPrice
(bookCode INTEGER NOT NULL,
 startDate DATE NOT NULL,
 endDate DATE,
 price REAL,
 PRIMARY KEY (bookCode, startDate),
 FOREIGN KEY (bookCode) REFERENCES Book (bookCode)
 ON UPDATE NO ACTION ON DELETE NO ACTION
);
```


## Integrity action
- In the occasion of an UPDATE or DELETE of a parent row that may impact the associated child rows, the integrity action specifies what should happen:

	- NO ACTION
	- RESTRICT
	- SET NULL
	- SET DEFAULT
	- CASCADE

- The default integrity action is NO ACTION which would issue a constraint violation as it happens


## Referential integrity in SQLite
- By default, SQLite has turned off the support of referential integrity which means the foreign key constraint would not work properly. To turn it on, the following command must be executed at the beginning of the database session:

```
sqlite> PRAGMA foreign_keys = ON;

```

<br />

- 📚 Further: [Foreign key support in SQLite](https://www.sqlite.org/foreignkeys.html)


## Quiz 01
- Given a Dept table with two columns (ID and name) exists, create a table called Emp with the following specifications:

	- 5 columns: ID, name, startDate, email and deptID
	- ID should be defined as an INTEGER PRIMARY KEY
	- no NULL values for name, startDate and deptID
	- the default value of startDate is the current timestamp
	- email should be UNIQUE and must have a ‘@’
	- define a FOREIGN KEY constraint on deptID that supports cascade update and restrict delete



## CASE expression
- A CASE expression works like a IF-THEN-ELSE in other programming languages; it allows us to do different things on each row of a SELECT statement based on the value of a column

```sql
SELECT staffCode, role, salary, CASE
WHEN LOWER(role) = 'branch manager' THEN salary*0.9
WHEN LOWER(role) = 'sales person' THEN salary
WHEN LOWER(role) = 'office admin' THEN salary*1.15
END revisedSalary
FROM StaffAssignment s, Role r
WHERE s.roleID = r.roleID;

```


## CAST expression
- A CAST expression is used to convert data from one type to another

```sql
SELECT staffCode, CAST(salary AS INTEGER) salary
FROM StaffAssignment;
```
```txt
staffCode   salary
----------  ----------
1           72000
2           64000
3           45000
4           54000
5           48000
...
```

- It is useful when we need a certain typed value as input to a function


## Quiz 02
- Write a single SQL statement to list all rows from the StaffAssignment table with the columns staffCode and startDate; but instead of displaying the date you convert that into a day (i.e. Monday, Tuesday etc) using the appropriate function and expression



## Relational operation
- The concept of relational operation is to take one or more relations as input and produce a relation as output! This allows relational operations to be nested together (i.e. subquery)

- The SELECT statement in SQLite supports all relational operations defined in ANSI SQL (which map to the original relational operators defined by Codd) with the exception of right and full outer joins

- In SQLite, these relational operations support compound SELECT statement:

	- UNION / UNION ALL
	- INTERSECT
	- EXCEPT


## UNION / UNION ALL
- UNION is considered to be a fundamental relational operation. It combines the result of two SELECT statements into one, given they have the exact same projection of column

- Duplicated rows would be omitted and shown only once in UNION; all rows would be shown as they are in UNION ALL
	- A NULL value is considered equal to other NULL value, and distinct from all non-NULL values

- There could only be one ORDER BY clause for a UNION or UNION ALL

```sql
SELECT * FROM Book
WHERE UPPER(bookType) = 'HOR'
UNION
SELECT * FROM Book
WHERE UPPER(paperback) = 'Y'
ORDER BY bookCode;
```
<!-- .element: contenteditable="true" -->


## INTERSECT
- INTERSECT behaves similarly to UNION, but instead of showing the non-duplicating rows from the two SELECT statements, it shows only the duplicating rows in the result (but not in duplication)

```sql
SELECT * FROM Book
WHERE UPPER(bookType) = 'HOR'
INTERSECT
SELECT * FROM Book
WHERE UPPER(paperback) = 'Y'
ORDER BY bookCode;
```
```txt
bookCode    bookTitle   bookType    paperback
----------  ----------  ----------  ----------
116         Judo        HOR         Y

```


## EXCEPT
- EXCEPT works similarly to UNION; it shows the rows resulted from the first SELECT statement but not the second one. Therefore unlike other relational operation, the order of the two SELECT statements matter

```sql
SELECT * FROM Book
WHERE UPPER(bookType) = 'HOR'
EXCEPT
SELECT * FROM Book
WHERE UPPER(paperback) = 'Y'
ORDER BY bookCode;
```
```txt
bookCode    bookTitle           bookType    paperback
----------  ------------------  ----------  ----------
113         Passage to Freedom  HOR         N
```



## VIEW
- View behaves like a derived table since its content is derived from the result of a SELECT statement; table is persistent, but view is dynamically generated

- In SQLite, view is read-only

```sql
CREATE VIEW LatestBookPrice AS
SELECT p1.bookCode, p2.startDate, p1.endDate, p1.price
FROM BookPrice p1,
   (SELECT bookCode, MAX(startDate) startDate
    FROM BookPrice
    GROUP BY bookCode) p2
WHERE p1.bookCode = p2.bookCode
AND p1.startDate = p2.startDate;

DROP VIEW LatestBookPrice;

```

- 🤔 What is the advantage of using a view?



## TRIGGER
- A trigger executes specific SQL statement when certain event occurs
	- BEFORE or AFTER for table; INSTEAD OF for view
	- INSERT, DELETE, UPDATE or UPDATE OF column ON table or view
	- WHEN clause (optional); OLD or NEW reference

```sql
CREATE TABLE Log(x);

CREATE TRIGGER InsertBookLog AFTER INSERT ON BOOK
BEGIN
	INSERT INTO Log VALUES(
	'insert book: title= ' || NEW.bookTitle ||
	' on ' || DATETIME('now', 'localtime')
	);
END;

INSERT INTO Book VALUES(888,'Johnny is the King','HOR','Y');

DROP TRIGGER InsertBookLog;
```


## Quiz 03
- Based on [Quiz 01](#/3/9), write a trigger to perform a cascade update for all related rows in the Emp table, when the ID of a row in the Dept table is updated



## 🗒 Summary
- By now you have learnt:

	- how to define constraint

	- how to use CASE and CAST

	- how to use UNION, UNION ALL, INTERSECT and EXCEPT

	- how to CREATE VIEW and TRIGGER


## 📚 Reading
- Essential
	- [Chapter 4: Advanced SQL for SQLite](https://auckland.rl.talis.com/users/C899F913-6185-B4B9-3892-600310630A5F/bookmarks/0A98B2D0-BCA9-F7B4-4A35-FFC7B4A73815.html)

- Further
	- [Foreign key support in SQLite](https://www.sqlite.org/foreignkeys.html)

	- [Trigger in SQLite](https://www.sqlite.org/lang_createtrigger.html)


## 🗓 Schedule
Week | Lecture
--- | ---
01 | Introduction ✓
02 | Relational model ✓
03 | Data modelling ✓
04 | Data modelling ✓
05 | Normalisation ✓
06 | SQL ✓
07 | SQL ✓
08 | SQL ✓
09 | SQL
10 | DBMS fundamentals
11 | Data warehouse
12 | Review and beyond



# 🌏 THE END
Don't forget database is awesome!

[🖨](?print-pdf)
