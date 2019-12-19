-- SUB QUERY: select statement placed inside parentheses insdie of another select
-- A sql query takes in tables and returns table. So we could use the output of queries into the input of another query

-- All the states that are larger than 
USE sql_bootcamp;
SELECT
	avg(sq_mile_land)
FROM states;

SELECT
	full_name,
    sq_mile_land
FROM states
WHERE sq_mile_land > 70685
ORDER BY sq_mile_land DESC;

SELECT
	full_name,
    sq_mile_land
FROM states
WHERE sq_mile_land > (
	SELECT
		AVG(sq_mile_land)
	FROM states
    )
ORDER BY sq_mile_land DESC;

-- Find all the presidents from the south

-- Find all the southern states
SELECT
	abbreviation
FROM states
WHERE region = "South";

-- Find the presidents from those states
SELECT
	first_name,
    last_name
FROM presidents
WHERE home_state IN (
	SELECT
		abbreviation
	FROM states
	WHERE region = "South");
    
-- Use a subquery to find the total population of all states that are smaller (land size) than the average state

-- Find the average state size
SELECT
	avg(sq_mile_land)
FROM states

SELECT
	sum(population)
FROM states
WHERE sq_mile_land < (
	SELECT
		avg(sq_mile_land)
	FROM states);
    
-- All presidents born before the average birth date of a president

SELECT
	*
FROM presidents
WHERE birth < (
	SELECT 
		AVG(birth)
	FROM 
    
-- CORRELATED SUBQUERIES: inner query references the outer query
-- Find all staes with above average populations for thir regions
SELECT
	*
FROM states AS outer_states
WHERE population > (the average population for this states 

-- Find the state with the smallest population in each region
SELECT
	*
FROM states AS outer_states
WHERE population = (
	SELECT
		min(population)
	FROM states
    WHERE region = outer_states.region)
ORDER BY region;

