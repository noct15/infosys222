# 🗄 Week 02
### Relational model
[©](https://creativecommons.org/licenses/by/4.0/) [Johnny Chan](mailto:jh.chan@auckland.ac.nz)



## 🕒 Previously ...
- Database and DBMS

- The intuitive concept of a relation as a two-dimensional table

- Basic SQL statement
	- SELECT-FROM-WHERE



## 📌 Agenda
- What is the relational data model?

- What is SQL?



## The relational data model
- A model is an _abstraction_ of the reality or part of the reality

- A data model is a precise and conceptual way of describing and specifying the data stored in a database
	- structure of the data
	- operation on the data
	- constraint on the data

- The relational data model is a data model where all data takes the form of relation


## Tuple
> A tuple is an __ordered list__ of __values__

- A relation consists of tuples. Tuples are usually written in parentheses with commas separating the values or components, e.g.

	```(Interstellar, 2014, 169, colour)```

	which contains the four values: Interstellar, 2014, 169, and colour

- 📢 The order of values in a tuple is important, i.e., the tuple ```(Interstellar, 169, 2014, colour)``` is different from the tuple above


## Relation
> A relation is a __set__ of tuples

- A relation is always defined on certain __domains__:
	- the sets from which the values in the tuples come from

- Example: The tuple ```(Interstellar, 2014, 169, colour)``` could be part of a relation defined on the domains of:
	- text
	- integer
	- integer
	- { 'colour', 'black and white' }

- 📢 The order of components does not matter in a set


## Attribute
- In order to refer to the different components in a tuple, we assign them names (called attributes)

- Example: For the tuple ```(Interstellar, 2014, 169, colour)``` we could choose the attributes title, year, length, and filmType

	The attribute _length_ would refer to the third component of the tuple with a value of 169


## Data type
- The value of an attribute belongs to a domain; it is also known as a __data type__ of an attribute

- In SQL, each attribute must be defined with a data type, and the data type specificity and availability would depend on the particular DBMS. However, the following are commonly available among different implementations:

	- TEXT for text strings
	- INTEGER for integers
	- REAL for real numbers
	- DATE for Gregorian dates


## The relation Movie
title | year | length | filmType
--- | --- | --- | ---
Interstellar | 2014 | 169 | colour
Nebraska | 2013 | 115 | black and white
Inception | 2010 | 148 | colour


## Same data different model

```xml
<movies>
	<movie title="Interstellar" filmType="colour">
		<Year>2014</Year>
		<Length>169</Length>
	</movie>
	<movie title="Nebraska" filmType="black and white">
		<Year>2013</Year>
		<Length>115</Length>
	</movie>
	<movie title="Inception" filmType="colour">
		<Year>2010</Year>
		<Length>148</Length>
	</movie>
</movies>
```
<!-- .element: contenteditable="true" -->


## Schema
- In the relational data model, a relation is often described using a schema which consists of:
	- the name of the relation
	- the set of its attributes (with or without data types)

- Example: The relation Movie can be described by the schema:

	- ```Movie (title, year, length, filmType)```
	- ```Movie (title TEXT, year INTEGER, length INTEGER, filmType TEXT)```

- The schemas of all relations in a database form a __database schema__


## Relation instance
- A relation is not static; it changes over time:
	- inserting new tuples
	- updating existing tuples
	- deleting tuples

- A set of tuples of a relation at a particular moment is known as an instance of that relation. As a convention DBMS maintains only one version of any relation - the current instance

- It is less common for the schema of a relation to change, and it could be very expensive when that happens (🤔 Why?)


## Primary key
- There are many constraints on relations that the relational data model allows. The most fundamental one is the primary key constraint

- A set of attributes forms a __key__ for a relation if we do not allow two tuples in a relation instance to have the same values in all the attributes of the key
	- 🤔 Why is this important?

- Artificial key is often used in the real world situation to provide absolute uniqueness to each tuple of a relation

- 🤔 Underline/highlight the attribute(s) that could form the key:

	Movie (<span class="fragment highlight-red">title</span>, <span class="fragment highlight-red">year</span>, length, filmType)


## Foreign key
- Another type of constraint on relations is the foreign key constraint. A foreign key specifies that an attribute from a tuple in one relation maps to a tuple in another relation

- Example: The relations Movie and FilmType

    - Movie (<span class="fragment highlight-red">title, year</span>, length, <span class="fragment highlight-blue">filmType</span>)
    - FilmType (<span class="fragment highlight-red">filmType</span>, description)

- 🤔 Why do we need foreign key in a relational data model?

Note: When there are two (or more) relations, they could form a relationship among themselves. The nature of any relationship could be one-to-one, one-to-many, or many-to-many, but the relational model could only handle one-to-one and one-to-many. And each relationship would depend on a foreign key in one of the relations. We will discuss all these concepts further in coming lectures.



## Quiz 01
accNo | balance | type
--- | --- | ---
11111 | 1234.50 | saving
22222 | 7654.32 | check
99999 | -8888.00 | loan

- Given the relation __Account__, indicate clearly:

	- the tuples of the relation
	- the attributes of the relation
	- a suitable domain for each attribute
	- the relation schema for the relation with key



## Quiz 02
- Define a set of relations in schemas to model the data of a movie in [IMDb](http://www.imdb.com/)

- Make as many assumptions about the data as needed

[![Interstellar](interstellar.png)<!-- .element: style="width:50%; height:50%" -->](http://www.imdb.com/title/tt0816692/)



## SQL
- __Structured query language (SQL)__ is a declarative language used to describe and manipulate relational database. It was adopted as a standard by [ANSI](https://en.wikipedia.org/wiki/American_National_Standards_Institute) and [ISO](https://en.wikipedia.org/wiki/International_Organization_for_Standardization). However, most DBMS vendors implement their products similar but not identical to the standards

	- [Data definition language (DDL)](https://en.wikipedia.org/wiki/Data_definition_language)
	- [Data manipulation language (DML)](https://en.wikipedia.org/wiki/Data_manipulation_language)

- 🤔 How is SQL different from a programming language like Java?

- 📚 Further: [SQL from Wikipedia](http://en.wikipedia.org/wiki/SQL)


## Relation in SQL

- SQL defines a relation and stores it in a DBMS as a __table__ (with attribute becomes __column__ and tuple becomes __row__)

- The simplest way of declaring a schema of a relation in SQL begins with the keywords __CREATE TABLE__, followed by the relation name, and a list of attribute names with data types:

	```sql
	CREATE TABLE Movie (
		title TEXT,
		year INTEGER,
		length INTEGER,
		filmType TEXT
	);
	```

- 📢 All sample SQL codes are based on [SQLite](http://sqlite.org/lang.html) syntax


## Modifying relation schema
- To remove the entire relation R with all its tuples from the database:
	```sql
	DROP TABLE R;
	```

- To rename the relation R to S:
	```sql
	ALTER TABLE R RENAME TO S;
	```

- To add an attribute to the relation R:
	```sql
	ALTER TABLE R ADD COLUMN newColumn1 TEXT;
	ALTER TABLE R ADD COLUMN newColumn2 TEXT DEFAULT 'Yes';
	```

- 🤔 What is the default value of an attribute when it is not explicitly specified?

- 🤔 How to delete an existing attribute from the relation R?


## Declaring primary key constraint
- In SQL, key(s) is/are declared when a relation is defined from the schema:
	```sql
	CREATE TABLE Movie (
		title TEXT,
		year INTEGER,
		length INTEGER,
		filmType TEXT,
		PRIMARY KEY (title, year)
	);
	```


## Declaring other constraint
- Besides from the PRIMARY KEY, there are other constraints available for declaration:

	- NOT NULL
	- UNIQUE
	- FOREIGN KEY
	- CHECK
	- DEFAULT

- 📚 Further: [Constraints in SQLite](http://zetcode.com/db/sqlite/constraints/)


## INSERT, UPDATE and DELETE
- To insert a new tuple into the relation Movie:
	```sql
	INSERT INTO Movie VALUES
	('Interstellar', 2013, 168, 'colour');
	```

- To update the value of an attribute in an existing tuple:
	```sql
	UPDATE Movie
	SET year = 2014, length = 169
	WHERE title = 'Interstellar';
	```

- To delete a tuple:
	```sql
	DELETE FROM Movie
	WHERE title = 'Interstellar';
	```

- 🤔 Are these DDL or DML?



## Quiz 03
- Given the following relations:
	- Product (maker, model, type)
	- PC (model, speed, ram, hd, price)
	- Laptop (model, speed, ram, hd, screen, price)
	- Printer (model, colour, type, price)

- Write the SQL statement to declare:
	1. the schemas for the relations Product, PC, Laptop and Printer
	2. an alteration to the schema of the relation Laptop to add the attribute od (optical-disk type). Let the default value be 'none' if the laptop does not have an optical disk drive



## Quiz 04

1. Pick a relational DBMS of your choice ([SQLite](http://sqlite.org/) is recommended)
2. Create a new database called firstDB in the DBMS
3. Create a relation called Food with the following attributes: name, quantity, expiredDate, refrigerated. Choose appropriate data types for the attributes
4. Now, look up your food cabinet and the fridge, and pick 5 different food items
5. Create 5 tuples in the relation Food to represent the picked items
6. Use the SELECT statement learnt from Week 01 to check if all items are stored properly
7. (Optional) Take a screenshot of the result of (6) and share it



## 🗒 Summary
- By now you should:

	- know the vocabulary of the relational data model: relation, tuple, attribute, domain, schema, primary key, foreign key, constraint etc

	- know how to represent a relation using a schema

	- have some basic ideas of how to choose a primary key for a relation and what a foreign key is used for

	- understand that every decision builds on at least one assumption

	- have gained more knowledge in SQL


## 📚 Reading
- Essential
	- [The Relational Model of Data (p17-37)
](http://infolab.stanford.edu/~ullman/fcdb/ch2.pdf)

- Further
	- [Codd (1970): A Relational Model of Data for Large Shared Data Banks](https://auckland.rl.talis.com/users/C899F913-6185-B4B9-3892-600310630A5F/bookmarks/EC836A2D-ACC5-25AE-A61E-BD0DFCA98301.html)


## 🗓 Schedule
Week | Lecture
--- | ---
01 | Introduction ✓
02 | Relational model ✓
03 | Data modelling
04 | Data modelling
05 | Normalisation
06 | SQL
07 | SQL
08 | SQL
09 | SQL
10 | DBMS fundamentals
11 | Data warehouse
12 | Review and beyond



# 🌏 THE END
Don't forget database is awesome!

[🖨](?print-pdf)
