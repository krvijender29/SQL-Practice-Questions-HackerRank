/*
Problem: Challenges

Julia asked her students to create some coding challenges.
Write a query to print the hacker_id, name, and the total number of
challenges created by each student.

Requirements:
- Display hacker_id, name, and the total number of challenges created.
- Sort the result by the total number of challenges in descending order.
- If multiple students created the same number of challenges, sort them
  by hacker_id in ascending order.
- If the same challenge count occurs more than once and it is less than
  the maximum challenge count, exclude those students from the result.
*/


SELECT
    h.hacker_id,
    h.name,
    COUNT(c.challenge_id) AS total_challenges
FROM Hackers h
JOIN Challenges c
    ON h.hacker_id = c.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(c.challenge_id) = (
        SELECT MAX(challenge_count)
        FROM (
            SELECT COUNT(*) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        ) AS max_count
    )
    OR COUNT(c.challenge_id) IN (
        SELECT challenge_count
        FROM (
            SELECT
                COUNT(*) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        ) AS challenge_counts
        GROUP BY challenge_count
        HAVING COUNT(challenge_count) = 1
    )
ORDER BY
    total_challenges DESC,
    h.hacker_id ASC;