SELECT id, name FROM students
WHERE cohort_id = 1;

SELECT COUNT(*) FROM students
WHERE cohort_id in (1,2,3);

SELECT name, id FROM students
WHERE phone IS null OR email IS null;

SELECT name, id, email, cohort_id
FROM students
WHERE email NOT LIKE '%gmail%'
AND phone IS NULL;


SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL;

SELECT name, email, phone
FROM students
WHERE end_date IS NOT NULL
AND github IS NULL;
