/*
Problem: Contest Leaderboard (HackerRank)

Retrieve the hacker_id and name of hackers who achieved full scores
in more than one distinct challenge. A full score is when the
submission score matches the maximum score for that challenge's
difficulty level.

Approach:
- Join Hackers, Submissions, Challenges, and Difficulty tables.
- Filter only full-score submissions.
- Count distinct challenges with full scores for each hacker.
- Return hackers with more than one full-score challenge.
- Sort by total full-score challenges (DESC) and hacker_id (ASC).
*/



SELECT 
    h.hacker_id, 
    h.name
FROM Hackers h
Join Submissions s
    ON h.hacker_id = s.hacker_id
JOIN Challenges c
    ON s.challenge_id = c.challenge_id
JOIN Difficulty d
    ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING count(distinct s.challenge_id) > 1
ORDER BY count(distinct s.challenge_id) DESC,
h.hacker_id ASC;