-- FIELD OPERATIONS
-- https://dev.mysql.com/doc/refman/8.0/en/func-op-summary-ref.html

USE sql_bootcamp;

SELECT 
	first_name,
    last_name
FROM presidents
WHERE length(first_name) = max(first_name)
ORDER BY first_name
LIMIT 1;

-- Find the president with the longest first name
SELECT 
	first_name,
    length(first_name) AS first_name_length
FROM presidents
ORDER BY length(first_name) DESC;

-- President with the longest full name
SELECT
	first_name,
    last_name,
    length(concat(first_name,last_name)) AS full_name
FROM presidents
ORDER BY full_name DESC;

-- Find all the unique 3 letter endings of metal names
USE sql_bootcamp_examples;

SELECT distinct	
    right(name, 3)
FROM metals;


USE sql_bootcamp;
-- Presidents born in the current month
SELECT 
	concat(first_name, last_name),
    birth
FROM presidents
WHERE Month(birth) = 12;

SELECT *
FROM presidents
WHERE Month(Now()) = Month(birth);
-- All presidents in office for fewer than 2 years (730 days)
SELECT *
FROM presidents
WHERE datediff(left_office, took_office) < 730; -- DateDiff giving integer value of the number of days between the 2 days

-- Find the 3 states that have the lowest population density
SELECT
	full_name,
    population,
    sq_mile_land,
    population DIV sq_mile_land as density
FROM states
ORDER BY density
LIMIT 3;

-- Find the 5 states that have the highest proportion of water
SELECT 
	full_name,
	sq_mile_water,
    sq_mile_land,
    sq
FROM
    
