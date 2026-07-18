--Query the list of CITY names from STATION that do not start 
--with vowels and do not end with vowels. Your result cannot contain 
--duplicates.

SELECT distinct city from Station
where left(city, 1) not in ('A', 'E', 'I', 'O', 'U')
and right (city, 1) not in ('A', 'E', 'I', 'O', 'U');
