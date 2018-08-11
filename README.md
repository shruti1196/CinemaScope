# CinemaScope

An online portal for reservation of movie tickets. Data is being crawled using Selenium from in.bookmyshow.com and stored in a MongoDB database. A Movie Recommendation System is designed using User-based and Item-based Collaborative Filtering.

## Getting Started

The repository contains a Netbeans IDE Java Web Project in the folder "CinemaScope". 

The "Database" folder contains JSON files that can be imported to a MongoDB database using "mongoimport" command.

### Prerequisites

Netbeans IDE, MongoDB

### Installing

Select the "Open Project" option on Netbeans IDE and browse to the file location containing the "CinemaScope" folder.

Import JSON files in "Database" folder to your MongoDB database.

```
mongoimport --db CinemaScope --collection <collection_name> --file <file_location>
```

## Authors

* **Shruti Sahu** - [whinyteen96](https://github.com/whinyteen96)
* **Jharna Barlawala** 




