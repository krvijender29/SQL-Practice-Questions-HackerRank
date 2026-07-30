/*
==========================================
Problem: Contest Leaderboard
Platform: HackerRank
Difficulty: Medium
==========================================

Problem Statement:
The total score of a hacker is the sum of their maximum scores
for all challenges. Print the hacker_id, name, and total score
of each hacker.

Requirements:
1. For each hacker and challenge, consider only the highest score.
2. Calculate the total score by summing these maximum scores.
3. Exclude hackers whose total score is 0.
4. Sort the result by:
   - Total Score (Descending)
   - Hacker ID (Ascending)

Approach:
1. Find the maximum score for each (hacker_id, challenge_id).
2. Join the result with the Hackers table.
3. Sum the maximum scores for each hacker.
4. Filter out hackers with total_score = 0 using HAVING.
5. Order the final result as required.

Time Complexity: O(N log N) (depends on database implementation)
Space Complexity: O(N)
*/




SELECT
    h.hacker_id,
    h.name,
    SUM(T.max_score) AS total_score
FROM Hackers h
JOIN
(
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) T
ON h.hacker_id = T.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(T.max_score) > 0
ORDER BY total_score DESC, h.hacker_id ASC;
