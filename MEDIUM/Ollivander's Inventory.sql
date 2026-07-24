/*
Problem: Ollivander's Inventory

Harry Potter and his friends are at Ollivander's Wand Shop. Hermione decides
the best way to choose a wand is by finding the non-evil wand with the minimum
number of gold galleons required for each unique combination of power and age.

Write a query to display the following columns:
- id
- age
- coins_needed
- power

Requirements:
- Consider only non-evil wands (is_evil = 0).
- For each (power, age) combination, return the wand with the minimum
  coins_needed.
- Sort the output by power in descending order.
- If more than one wand has the same power, sort them by age in descending order.
*/

SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp
    ON w.code = wp.code
WHERE is_evil = 0 AND
    w.coins_needed = (
        select min(w2.coins_needed)
        from wands w2
        join Wands_Property wp2
            on w2.code = wp2.code
        where w2.power = w.power and
                wp2.age = wp.age and 
                is_evil = 0
    )
ORDER by 
w.power DESC,
wp.age DESC;
