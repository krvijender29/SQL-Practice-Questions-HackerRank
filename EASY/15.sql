--Query the list of CITY names from STATION that do not end with 
--vowels. Your result cannot contain duplicates.

SELECT Distinct City 
from Station
where right (city,1) NOT IN ('A', 'E', 'I', 'O', 'U');
