const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const studentQuery = `
  SELECT students.id as id, students.name as student_name, cohorts.name as cohort_name
  FROM students
  JOIN cohorts
  ON students.cohort_id = cohorts.id
  LIMIT 5;
  `;

const studentCohortQuery = `
  SELECT students.id as id, students.name as student_name, cohorts.name as cohort_name
  FROM students
  JOIN cohorts
  ON students.cohort_id = cohorts.id
  WHERE cohorts.name ILIKE $1
  LIMIT $2
  ;
`;

const [, , cohort, limit] = process.argv;
const sqlParams = [`%${cohort}%`, limit];


pool.query(studentQuery)
  .then(res => {
    console.log(res.rows);
  })
  .catch(err => console.error('query error', err.stack));

pool.query(studentQuery)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
    });
  });


pool.query(studentCohortQuery, sqlParams)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
    });
  }).catch(err => console.error('query error', err.stack));

