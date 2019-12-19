-- A calcution on a number of rows and gives you the result

USE sql_bootcamp;
-- Gives you the number of non-null rows
SELECT COUNT(*)
FROM states;

-- COUNT: total number of rows that match our search (non-null)
-- SUM: what you get adding up the rows
-- AVG: average value in the group of rows
-- MAX: max value in the group of rows
-- MIN: min value in the group of rows

USE sql_bootcamp_examples;

SELECT COUNT(title)
FROM shows;

-- Find number of states
USE sql_bootcamp;
SELECT COUNT(full_name)
FROM states;

-- Find the largest and smallest popultaions of a state
SELECT
	min(population),
    max(population)
FROM states;

-- Find the average population of the states in the Midwest region
SELECT 
	AVG(population)
FROM states 
WHERE region = "Midwest";

-- Find the average population of thes states in each region
SELECT 
	region,
    avg(population)
FROM states
GROUP BY region -- Any colunm that is not aggregated has to be included in the group by statement
-- Split, apply, combine
-- Group by tells it where to split the data. Function applies the function and then puts back together
ORDER BY avg(population) DESC;

-- Find the total population for each region in the US
SELECT
	region,
    SUM(population)
FROM states
GROUP BY region
ORDER BY sum(population) DESC;

-- Find the largest single state population for each region
SELECT
	region,
    max(population)
FROM states
GROUP BY region;

-- There was one year when more than one presidential autobiography was written. When was it?
SELECT 
	published_year,
	count(*)
FROM books
GROUP BY published_year
ORDER BY count(*) DESC;

-- Titles of the books published in that year
SELECT 
	title
FROM books
WHERE published_year = 1990;

-- How many times have each of the political parties been in power?
SELECT 
	party,
    count(*)
FROM presidents
GROUP BY party
ORDER BY count(*) DESC;

-- Table with state, party and number of presidents from that state/party combination
SELECT
	home_state,
    party,
    count(*)
FROM presidents
GROUP BY home_state, party -- grouped by on a tuple
ORDER BY count(*) DESC;

-- HAVING: Do some filtering after the aggregating has happened
SELECT
	home_state,
    count(home_state)
FROM presidents
GROUP BY home_state
HAVING count(home_state) > 1
ORDER BY count(home_state) DESC;

-- All the states who sent presidents to the white house only before the start of the 20th century
SELECT
	home_state,
    count(*)
FROM presidents
GROUP BY home_state
HAVING max(left_office) < "1900-01-01" 
ORDER BY count(*) DESC;

-- All the states that have sent more than one president from the same political party
SELECT
	home_state,
	party,
    count(*)
FROM presidents
GROUP BY home_state, party
HAVING count(*) > 1
ORDER BY count(*) DESC;



