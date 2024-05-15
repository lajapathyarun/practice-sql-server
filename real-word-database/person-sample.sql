CREATE TABLE Persons
(
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO PERSONS
    (personid,lastname,firstname,address, city)
VALUES
    (1, 'arun', 'laja', 'No 3', 'chennai')

SELECT personid, lastname, firstname, address, city
FROM Persons;