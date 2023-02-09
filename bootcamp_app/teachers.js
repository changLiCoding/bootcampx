const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const sqlQuery = `
  SELECT teachers.name as teacher, cohorts.name as cohort
  FROM assistance_requests
  JOIN students
  ON students.id = assistance_requests.student_id
  JOIN teachers
  ON teachers.id = assistance_requests.teacher_id
  JOIN cohorts
  ON students.cohort_id = cohorts.id
  WHERE cohorts.name iLIKE $1
  GROUP BY teachers.name, cohorts.name
  LIMIT $2
;
`;

const [, , cohort, limit] = process.argv;
const sqlParams = [`%${cohort}%`, limit];
console.log('active');
pool.query(sqlQuery, sqlParams)
  .then((query) => {
    const queryRes = query.rows;
    console.log(queryRes);
    queryRes.forEach((ele) => {
      console.log(`${ele.cohort}: ${ele.teacher}`);
    });
  });
