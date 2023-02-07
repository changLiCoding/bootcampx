SELECT cohorts.name as cohort_name, COUNT(students.*) as student_count
FROM students
JOIN cohorts
ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
ORDER BY COUNT(students.*);
