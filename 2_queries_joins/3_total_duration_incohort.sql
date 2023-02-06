SELECT SUM(duration) as total_duration
FROM students
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';
