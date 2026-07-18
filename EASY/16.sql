--Query the list of CITY names from STATION that either do not start
-- with vowels or do not end with vowels. Your result cannot contain 
--duplicates

SELECT distinct City 
from Station
where left(city,1) NOT IN ('A', 'E', 'I', 'O', 'U')
 OR right(city,1) NOT IN ('A', 'E', 'I', 'O', 'U');
