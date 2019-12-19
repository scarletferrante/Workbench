-- CREATE DATABASE my_database;
USE my_database;
 
CREATE TABLE my_table(
	name VARCHAR(20),
    number INT
);

INSERT INTO my_table
	(name, number)
VALUES
	("apple", 50),
    ("tomato", 10);
DESCRIBE my_table;
SELECT * FROM my_table;
SHOW TABLES;

USE test_db;
UPDATE foods
SET store = "Whole Foods"
WHERE name = "Almond Flour"; -- Without the WHERE statement it will update every value in that column

SELECT *
FROM test_db.foods;
