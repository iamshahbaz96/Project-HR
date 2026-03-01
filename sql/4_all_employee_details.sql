USE startup;

SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    d.designation AS emp_designation,
    -- Step 4 & 5 Fix: Getting Manager name and title
    m.first_name AS manager_first_name, 
    m.last_name AS manager_last_name,
    md.designation AS manager_designation,
    s.salary
FROM emp e
-- 1. Correct: Join for Employee's Designation
JOIN desg d ON e.desg_id = d.desg_id
-- 2. Correct: Join for Salary
JOIN salary s ON e.emp_id = s.emp_id
-- 3. FIX: Join to find out who this specific employee reports to
LEFT JOIN reporting r ON e.emp_id = r.emp_id
-- 4. FIX: Join to the employee table again to get the manager's profile
LEFT JOIN emp m ON r.reports_to = m.emp_id
-- 5. FIX: Join to the designation table to get the manager's title
LEFT JOIN desg md ON m.desg_id = md.desg_id
ORDER BY e.emp_id;