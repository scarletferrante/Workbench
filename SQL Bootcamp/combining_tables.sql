-- UNION: If 2 queries hae the same number and types of columns, you can union them. 
-- Returns a big table with all the same entries

SELECT
	name
FROM employees

UNION

SELECT 
	first_name
FROM presidents

-- Column need to have the same types and be in the same order by

-- JOINS: adding fields not adding records
-- Inner Join: Join two tables. Only give me records where those two records exist on both tables
-- Left Join: Join two tables. Give me every record back from the first table 
-- and only the subset of the right table that overlaps (matches) with the left table
-- Right Join: Right
-- Outter Join: Keep everything either way

-- Find the home states and state populations oF the 5 presidetns with teh lowest populations
SELECT
	home_state,
    first_name,
    population
FROM presidents
LEFT JOIN states ON states.abbreviation = presidents.home_state -- The order matters for the ON. 
ORDER BY population 
LIMIT 5;

-- How many of the ten most dangerous elements are metals
USE sql_bootcamp_examples;
SELECT
	m.name,
	count(*)
FROM metals as m
INNER JOIN dangerous_elements as d ON m.atomic_number = d.atomic_number
GROUP BY m.name;

-- Find the 3 presidents who have writeen most autobiographical boosk
SELECT 
	first_name,
    last_name,
    count(*)
FROM books
INNER JOIN presidents ON books.author_id = presidents.id 
GROUP BY books.author_id
ORDER BY count(*) DESC
LIMIT 3;

-- SUB-QUERIES
-- SELF JOINS: you can join a table to itself

SELECT
	*
FROM employees AS e
INNER JOIN employees AS m ON e.reports_to = m.id;
-- Where did the CEO go? She disappears because she doesn't report to anyone

-- Many to Many Join
-- An author can write many posts, and a post can have many authors. How do we represent this?
-- If we want to find all fo Alice's posts we need to do multiple joins. 
SELECT *
FROM buzzfeed_articles AS posts
INNER JOIN buzzfeed_post_author AS pa ON posts.id = pa.post_id;

-- Then we join that table to the authors table
SELECT *
FROM buzzfeed_articles AS posts
INNER JOIN buzzfeed_post_author AS pa ON posts.id = pa.post_id
INNER JOIN buzzfeed_authors AS authors ON pa.author_id = authors.id;



