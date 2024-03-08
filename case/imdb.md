# 💼 Case study
### IMDB: Content management system
[©](https://creativecommons.org/licenses/by/4.0/) [Johnny Chan](mailto:jh.chan@auckland.ac.nz) | 🗓 2024-03-08



## Specification
- The following specification captures only part of the current release of IMDB at the time of writing, a content management system that is used by millions of people to access and contribute to the world's largest collection of movie and TV information

- This case is aimed for learning and practicing data modelling; it is not affiliated with nor supported by any organisation



## Background
- [IMDB](https://en.wikipedia.org/wiki/IMDb) is created with one goal: to provide the best possible information on movies, television series and other types of media. It is also a crowdsourcing platform where registered users can contribute to the online database with reviews, plot summaries, ratings, and more

- It operates as a [web application](https://www.imdb.com/) with search functionality, where any user could look up the information about any media



## User
- While anyone could access IMDB without registration, only registered user can contribute to the online database 

- For each user, username, email, and joined date are stored as part of the registration. The user would need to specify if they represent an organisation or not

- User could contribute by writing a review for a title, rating a title, rating a review, writing a plot for a title and updating additional names for a title in a country



## Title
- IMDB stores each media as a title. Each title has a name, runtime (i.e. duration) and short summary description. A title always belongs to a title type: movie, TV series, TV episode and so on. For a TV episode title, the database captures the season number, the episode number and the TV series that it is associated with

- Each title must have be associated with at least one language, but it could relate to more than one languages. Similarly, each title must be associated with at least one country of origin, but it could relate to more than one countries of origin

- A title must have at least one release date associated with one particular country, but it could have more than one release dates, where each of them associates with a different country



## Review
- A review has the following attributes: id, heading, review date, and review detail. Each review is contributed by a user for a title. User is required to declare if the review contains spoiler or not

- User could choose to rate a title with or without writing a review. They choose a value between 1 to 10 stars

- User could rate a review to indicate if the review is useful or not



## Plot and AKA
- A title could have zero to many plots. There are two plot types, summary and synopsis, and each plot belongs to one plot type. A user could contribute at most one plot summry and one plot synopsis to one title. By default any newly submitted plot is not shown until it has been approved

- Apart from the official name, a title may have many as-known-as (AKA) names. Each AKA must be associated with one title and one country; but for the same title and the same country there could be more than one AKAs they are associated with. Each AKA may have a remark (e.g. alternative title, working title), and it may associate with a language



# 🌏 THE END

Don't forget IMDB is awesome!

[🖨](?print-pdf)
