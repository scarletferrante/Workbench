/*

- DB server holds soem databases. A database holds some tables. A tables holds some data
- Use SQL t oget data in/out of a table
- Lots of functions are built in
- When data is in multiple tables use joins to get them
- Subqueries are a powerful way of getting data without repeating yourself

SELECT
- You can simple return columns
- You can return functions

FROM
- From can also refer to a view, which is a specific saved query

WHERE
- Filters

GROUP BY
- Specifies the subset of records for aggregation functions in select statements
- SPLIT, APPLY, RECOMBINE
- The output will have one row for each unique combination of values for that tuple in the base data

HAVING
- Provides the ability to filter groups using arbitrary functions.
- Used to filter after aggregation

ORDER BY
- How should they be ordered/sorted
- Order by multiple fields

JOIN
- Linking rows between tables
- Left, right, inner, outer

*/

-- Find the 10 presidents from the states with the most water
SELECT
	first_name,
    last_name
FROM presidents
JOIN states ON presidents.home_state = states.abbreviation
	WHERE home_state = (
		SELECT
			abbreviation,
			max(sq_mile_water)
		FROM states
		GROUP BY abbreviation
		ORDER BY max(sq_mile_water) DESC
		LIMIT 10);
        
SELECT
	abbreviation,
    presidents.first_name,
    presidents.last_name,
	max(sq_mile_water)
FROM states
LEFT JOIN presidents ON states.abbreviation = presidents.home_state
GROUP BY abbreviation, presidents.first_name, presidents.last_name
ORDER BY max(sq_mile_water) DESC
LIMIT 10

/*

- The model for SQL is verbal, not visual. 
- Practice how you builld intuition

steve.iannaccone@generalassemb.ly
- SQLZoo
- Hacker Rank
*/
