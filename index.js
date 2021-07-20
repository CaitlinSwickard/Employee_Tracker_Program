// dependencies
const mysql = require('mysql');
const inquirer = require('inquirer');
require('console.table');

// mysql connection
const connection = mysql.createConnection({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: 'password',
  database: 'employee_db',
});

// connection and initial prompt questions
connection.connect(async (err) => {
  if (err) throw err;
  console.log(`connected as id ${connection.threadId}\n`);
  try {
    const mainQuestions = await inquirer.prompt([
      {
        name: 'userOption',
        type: 'list',
        message: 'What would you like to do?',
        choices: [
          'View all employees?',
          'View roles?',
          'View departments?',
          'Add employee?',
          'Add role?',
          'Add department?',
          'Update employee role?',
          'Exit?'
        ],
      }
    ]);
    selections(mainQuestions.userOption);
  } catch (e) {
    console.log(e);
  }
});


const selections= async (userChoice) => {

  if (userChoice === 'View all employees?') {
    viewEmployee();
  }
  if (userChoice === 'View roles?') {
    viewRole();
  }
  if (userChoice === 'View departments?') {
    viewDepartment();
  }
  if (userChoice === 'Add employee?') {
    addEmployee();
  }
  if (userChoice === 'Add role?') {
    addRole();
  }
  if (userChoice === 'Add department?') {
    addDepartment();
  }
  if (userChoice === 'Update employee role?') {
    updateEmpRole();
  }
  if (userChoice === 'Exit?') {
    console.log('Thank you for using Employee Tracker.')
    exit();
  }
};

const viewEmployee = () => {
  connection.query('SELECT * FROM employees', (err, employees) => {
    if (err) throw err; 
    console.table(employees);
    connection.end();
  });
};

const viewRole = () => {
  connection.query('SELECT * FROM role', (err, role) => {
    if (err) throw err; 
    console.table(role);
    connection.end();
  });
};

const viewDepartment= () => {
  connection.query('SELECT * FROM departments', (err, departments) => {
    if (err) throw err;
    console.table(departments);
    connection.end();
  });
};

// const addEmployee = () => {
//   connection.query
// }

// const addRole = () => {
//   connection.query
// }

// const addDepartment = () => {
//   connection.query
// }

// const updateEmpRole = () => {
//   connection.query
// }

// function exit() {
// does this need to exist or can i exit the function from the main prompt??
// }