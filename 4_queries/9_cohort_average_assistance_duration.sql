-- SELECT SUM(average_assistance_time) as average_total_duration
-- FROM assistance_requests
-- JOIN students
-- ON assistance_requests.student_id = students.id
-- JOIN cohorts
-- ON students.cohort_id = cohorts.id
-- WHERE average_assistance_time in (
--   SELECT cohorts.name as name, AVG(assistance_requests.completed_at - assistance_requests.started_at) as average_assistance_time

--   FROM assistance_requests
--   JOIN students
--   ON students.id = assistance_requests.student_id
--   JOIN cohorts
--   ON cohorts.id = students.cohort_id

--   GROUP BY cohorts.name
--   ORDER BY average_assistance_time

-- )
SELECT avg (total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;
