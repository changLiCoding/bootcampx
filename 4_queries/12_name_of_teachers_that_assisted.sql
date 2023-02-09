SELECT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
JOIN students
ON students.id = assistance_requests.student_id
JOIN teachers
ON teachers.id = assistance_requests.teacher_id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
;
