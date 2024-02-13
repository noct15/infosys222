# 🗄 Week 01
### Introduction
[©](https://creativecommons.org/licenses/by/4.0/) [Johnny Chan](mailto:jh.chan@auckland.ac.nz)



## 📌 Agenda
- Why study database?

- What you would learn

- Overview of the course

- Course schedule



## Why study database?
- Because it is interesting! Database relates to a wide range of domains including information systems, computer science, engineering, mathematics, statistics, accounting, marketing and more

- Most software applications require a database

- [Data scientist](https://en.wikipedia.org/wiki/Data_science) uses database to handle large and distributed datasets

- The demand for database to host our ever growing data and information would only go up as complexity increases



## What you would learn
- By the end of the course, you would have gained a solid background in database design and implementation. Specifically:

	- use [data modelling](https://en.wikipedia.org/wiki/Data_modeling) to define and analyse data requirements
	- design a database in [entity-relationship (ER) model](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model) and translate that to the [relational model](https://en.wikipedia.org/wiki/Relational_model)
	- Utilise theoretical technique like [normalisation](https://en.wikipedia.org/wiki/Database_normalization) to improve database design and implementation
	- program basic to complex queries in [SQL](https://en.wikipedia.org/wiki/SQL) for both operational and analytical purposes
	- understand the [fundamentals](https://en.wikipedia.org/wiki/Database) of a relational database management system (DBMS) and its limitation
	- recognise database technologies beyond relational DBMS and understand [data ethics](https://data.govt.nz/toolkit/data-ethics/)



## Overview of the course
- What is a database?

- What is a DBMS?

- What is a relational database?

- How to design a relational database?

- How to implement and use a relational database?


## What is a database?
- According to the [Oxford Dictionary](http://www.oxforddictionaries.com/definition/english/database):

	> A structured set of data held in a computer, especially one that is accessible in various ways

- 🤔 How is a database different from a file system?

- It is a collection of information that exists over a long period of time; the term database refers to a collection of data that is managed by a database management system (DBMS)


## What is a DBMS?
> It is a system for providing __efficient__, __convenient__, and __safe__ storage of and __multi-user__ access to (possibly __massive__) amounts of __persistent__ data

- 🤔 Think of five examples when each of the bolded words applies

- The DBMS  [evolution](https://en.wikipedia.org/wiki/Database#History): hierarchical → network → relational → object-oriented → object-relational → NoSQL → NewSQL


## What is a relational database?
- All major general purpose DBMSs are based on the so-called [relational data model](https://en.wikipedia.org/wiki/Relational_model). It means that all data are stored in a number of named tables (with named columns), such as the following table __Account__:

accNo | balance | type
--- | --- | ---
11111 | 1234.50 | saving
22222 | 7654.32 | check
99999 | -8888.00 | loan

- For historical, mathematical reasons such table is referred to as a relation. This course focuses solely on [relational database](https://en.wikipedia.org/wiki/Relational_database) and relational DBMS


## How to design a relational database?
- It is often far from obvious to decide how to store data from an application as relations. A considerable part of the course will deal with a methodology for good relational database design

- 🤔 Suggest how to represent the following types of data as one or more relations: 1) a contact list, 2) a shopping cart

- 🤔 Can you avoid (or reduce) duplication of data?


## Database design methodology
- We will cover the dominant design methodology for relational database, which consists of three steps:

	1. Identify all relevant entities and relationships, and use an ER model to describe them
	2. Convert the ER model to a number of relations
	3. Eliminate (or reduce) redundancy by splitting up relations. This process is known as normalisation

- Data modelling can also be differentiated among three stages:
	- conceptual → logical → physical


## How to implement and use a relational database?
- The success of relational database is largely due to the existence of powerful programming language for writing database queries

- The most important of such language is [structured query language (SQL)](https://en.wikipedia.org/wiki/SQL):
	- convenience: queries can be written with little effort
	- efficiency: even for large datasets, a good DBMS can answer queries written in SQL very quickly



## SQL

accNo | balance | type
--- | --- | ---
11111 | 1234.50 | saving
22222 | 7654.32 | check
99999 | -8888.00 | loan

- Consider the relation __Account__, the SQL code to get the balance from accNo 22222:

```sql
SELECT balance
FROM Account
WHERE accNo = 22222;
```
<!-- .element: contenteditable="true" -->


## SQL: example

```sql
SELECT accNo, balance
FROM Account
WHERE type = 'loan'
AND balance < -10000;
```
<!-- .element: contenteditable="true" -->

```sql
SELECT *
FROM Account
WHERE accNo > balance;
```
<!-- .element: contenteditable="true" -->

📢 * is the shorthand for all columns/attributes


## SQL: more example

accNo | name | address
--- | --- | ---
11111 | Dexter Morgan | 666 Miami Road
22222 | Steven Roger | 222 Patriot Street
22222 | Peggy Carter | 999 Marvel Avenue
99999 | John Reese | 314 Machine Place

- Suppose we have a related relation __Holder__, the SQL code to get the names of holders with check accounts:

```sql
SELECT name
FROM Account, Holder
WHERE Account.accNo = Holder.accNo
AND Account.type = 'check';
```
<!-- .element: contenteditable="true" -->


## SQL: SELECT-FROM-WHERE
```sql
SELECT column1, column2, ...
FROM relation1
WHERE <conditions>;
```

```sql
SELECT column1, column2, ...
FROM relation1, relation2, ...
WHERE <join conditions>
AND <conditions>;
```


## SQL: Quiz
- Consider the relation [__Account__](#/6) again

	Write a SQL statement that lists all accounts (with accNo and type) that have a positive balance

```sql
SELECT ...
FROM ...
WHERE ...

```
<!-- .element: contenteditable="true" -->


## SQL: Syntax and semantics
- As demonstrated, SQL statement resembles asking question in English. Quite often, the effect of an SQL statement can be intuitively understood

- During the course you will learn how to compose much more complex statement in SQL. To do that you need a precise understanding of SQL’s:

	- Syntax: The way SQL statement could be written
	- Semantics: The meaning of a SQL statement


## SQL: More aspects
- SQL is based on a mathematical formalism called [relational algebra](https://en.wikipedia.org/wiki/Relational_algebra)

- In addition to queries, SQL can be used to express many types of database operations:
	- Define new relations
	- Perform changes to data (e.g. insert, update and delete)
	- Set up constraints and triggers
	- Manage users, permissions, etc
	- Control transactions in a multi-user environment



## Other topics in the course
- Besides from data modelling and SQL, this course also covers:

	- Database efficiency

	- Transaction management

	- Concurrency management

	- Data warehouse (OLAP)



## 🗒 Summary
- By now you should:

	- know what this course is about

	- know how you could do well in this course

	- know a little about some key concepts: database, DBMS, relation, SQL; and know how they fit into the course

	- understand SELECT-FROM-WHERE of SQL


## 📚 Reading
- Essential
	- [The Worlds of Database Systems (p1-9)](http://infolab.stanford.edu/~ullman/fcdb/ch1.pdf)

	- [Introduction from SQL for Web Nerds](http://philip.greenspun.com/sql/introduction.html)

- Further
	- [Database from Wikipedia](https://en.wikipedia.org/wiki/Database)


## 🗓 Schedule
Week | Lecture
--- | ---
01 | Introduction ✓
02 | Relational model
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
