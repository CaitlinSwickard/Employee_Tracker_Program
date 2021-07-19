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
    const userChoice1 = await inquirer.prompt([
      {
        name: 'userOption',
        type: 'list',
        message: 'What would you like to do?',
        choices: [
          'Add employee?',
          'Add role?',
          'Add department?',
          'View all employees?',
          'View role?',
          'View department?',
          'Update employee role?',
          'Exit?'
        ],
      }
    ]);
    doUsersChoice(userChoice1.userOption);
  } catch (e) {
    console.log(e);
  }
});


// const doUsersChoice = async (userChoice) => {

//   if (userChoice === 'Add employee?') {
//     addEmployee();
//   }
//   if (userChoice === 'Add role?') {
//     addRole();
//   }
//   if (userChoice === 'Add department?') {
//     addDepartment();
//   }
//   if (userChoice === 'View all employees?') {
//     viewEmployee();
//   }
//   if (userChoice === 'View role?') {
//     viewRole();
//   }
//   if (userChoice === 'View department?') {
//     viewDepartment();
//   }
//   if (userChoice === 'Update employee role?') {
//     updateEmpRole();
//   }
//   if (userChoice === 'Exit?') {
//     exit();
//   }
// };
