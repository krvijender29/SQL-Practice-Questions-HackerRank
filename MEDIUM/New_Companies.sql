/*
Amber's conglomerate corporation just acquired some new 
companies. Each of the companies follows this hierarchy:

                founder
                │
                ▼
                Lead_Manager
                │
                ▼
                Senior_Manager
                │
                ▼
                Manager
                │
                ▼
                Employee

Given the table schemas below, write a query to print the 
company_code, founder name, total number of lead managers, 
total number of senior managers, total number of managers, and 
total number of employees. Order your output by ascending 
company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. 
For example, if the company_codes are C_1, C_2, and C_10, then the 
ascending company_codes will be C_1, C_10, and C_2. */

SELECT 
    c.company_code,
    c.founder,
    count(distinct l.lead_manager_code),
    count(distinct s.senior_manager_code),
    count(distinct m.manager_code),
    count(distinct e.employee_code)
    from company c
LEFT JOIN lead_manager l
    on c.company_code = l.company_code
LEFT JOIN senior_manager s
    on l.lead_manager_code = s.lead_manager_code
LEFT JOIN manager m
    on s.senior_manager_code = m.senior_manager_code
LEFT JOIN employee e
    on m.manager_code = e.manager_code 
GROUP by c.company_code, c.founder
order by c.company_code;