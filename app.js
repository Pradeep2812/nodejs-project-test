const express = require('express');
const mysql = require('mysql');

const app = express();
const port = 3000;

// Create connection to MySQL
const db = mysql.createConnection({
  host: 'database-1.c7mo8gk2kc7g.ap-south-1.rds.amazonaws.com',
  user: 'admin',
  password: 'Nodejs_project',
  database: 'sample_db'
});

// Connect to MySQL
db.connect(err => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});

// Create a simple route
app.get('/', (req, res) => {
  res.send('Hello World');
});

// Create a route to insert data into the database
app.get('/adduser', (req, res) => {
  let user = {name: 'praveen', email: 'praveen@gmail.com'};
  let sql = 'INSERT INTO users SET ?';
  let query = db.query(sql, user, (err, result) => {
    if (err) throw err;
    res.send('User added...');
  });
});

app.get('/list-users', (req, res) => {
  let sql = 'SELECT * FROM users';
  let query = db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server started on port ${port}`);
});
