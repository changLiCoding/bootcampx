SELECT day, COUNT(assignments.*) as total_assignments
FROM assignments
GROUP BY day
ORDER BY day;
