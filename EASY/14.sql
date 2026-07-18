--Query the list of CITY names from STATION that do not start with
-- vowels. Your result cannot contain duplicates.

SELECT Distinct City 
from Station
where left(city,1) NOT IN ('A', 'E', 'I', 'O', 'U');
