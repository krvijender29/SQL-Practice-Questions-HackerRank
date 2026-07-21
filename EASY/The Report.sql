```sql
/*
Question:
Generate a report containing three columns: Name, Grade, and Marks.

Requirements:
- Display the student's actual name only if their grade is 8 or higher.
- For grades lower than 8, display NULL instead of the student's name.
- Sort the results by Grade in descending order.
- For students with grades 8–10, sort alphabetically by Name.
- For students with grades 1–7, sort by Marks in ascending order.
*/
```



SELECT
    CASE
        WHEN g.Grade < 8 THEN NULL
        ELSE s.Name
    END AS Name,
    g.Grade,
    s.Marks
FROM Students s
JOIN Grades g
    ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY
    g.Grade DESC,
    CASE
        WHEN g.Grade >= 8 THEN s.Name
    END ASC,
    CASE
        WHEN g.Grade < 8 THEN s.Marks
    END ASC;