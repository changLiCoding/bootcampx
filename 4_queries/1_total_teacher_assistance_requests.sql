SELECT Count(assistance_requests.*) as total_assistances, name
FROM teachers
JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
WHERE name = 'Waylon Boehm'
GROUP BY name;
