
SHOW TABLES;
/*
CREATE TABLE foods (
	price INT,
    name VARCHAR(32),
    store VARCHAR(32)
);
*/
-- DESCRIBE foods;
/*
Null - is this table allowed to have missing or null values
Default - if I dont assign a value the default is...
*/
INSERT INTO foods
	(price, name, store)
VALUES
	(8, "Chuck Steak", "Supermarket");
INSERT INTO foods
	(price, name)
VALUES
	(7, "Almond Flour")
