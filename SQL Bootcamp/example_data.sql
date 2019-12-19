-- One database with 3 tables
USE sql_bootcamp;
SHOW tables;

SELECT *
FROM states;

SELECT 
	first_name,
    last_name
FROM presidents;

-- ORDER BY
-- The first and last name of the presidents with earliest birthdates
SELECT 
	first_name,
    last_name,
    birth
FROM presidents
ORDER BY birth 
LIMIT 3

-- Order the results by this column. Default ascending. 
-- Order by two columns. Rank by the first column than the second. 
-- Slower. 
-- Off set: skip the first 4 rows, then show me the first 3

-- The top 5 states with the largest populations
SELECT 
	full_name
FROM states
ORDER BY population DESC
LIMIT 5;

-- WHERE
-- Wildcard characters: _ Matches a single character % Matches zer or more characters 

SELECT *
FROM books
WHERE published_year = 1981
	OR author_id = 7

SELECT *
FROM presidents
WHERE first_name > "M" -- Greater than with letters is the second half of the alphabet
	AND last_name > "M";
    
-- FILTERING
-- Find the full names and populations of states with fewer than a million residents. 
-- Order them by population with smallest first
SELECT
	full_name,
    population
FROM states
WHERE population < 1000000
ORDER BY population ASC;

-- All the presidents who died in office
SELECT
	first_name,
    last_name
FROM presidents
WHERE death < left_office; -- dealth = left_office

-- Names and birthplaces of all living presidents
SELECT
	first_name,
    last_name,
    home_state
FROM presidents
WHERE death is NULL; 

-- Names of all presidents alive during WW II
SELECT 
	first_name,
    last_name
FROM presidents
WHERE birth < "1945-09-02"
	AND dealth > "1939-09-01"
    -- a lot of functions to extract date/time 

-- WILDCARDS    
USE sql_bootcamp_examples
SELECT *
FROM metals
WHERE name LIKE "%ium";

SELECT *
FROM metals
WHERE name LIKE "%an%";
    
-- TUPLES: a set of a record's fields. A static set of things. 
-- (first_name, last_name) Order matters
-- ("Abraham", "Lincoln")
-- help us filter and find unique values in data
USE sql_bootcamp
SELECT
	first_name,
    home_state
FROM presidents
WHERE (last_name, home_state) = ("Adams", "MA");


    


