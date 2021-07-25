-- Database --
DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

-- departments table
CREATE TABLE departments (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(30),
  PRIMARY KEY (id)
);

-- role table
CREATE TABLE role (
  id INT AUTO_INCREMENT NOT NULL,
  title VARCHAR(30),
  salary DECIMAL(10,2),
  department_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- employees table
CREATE TABLE employees (
  id INT AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INT NOT NULL,
  manager_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES role(id),
  FOREIGN KEY (manager_id) REFERENCES employees(id)
);

-- vlaues for departments table --
INSERT INTO departments (name) VALUES 
('Engineer'),
('Sales'),
('HR'),
('Legal');

-- values for role table --
INSERT INTO role (title, salary, department_id) VALUES 
('Lead Engineer', 160000, 1),
('Engineer', 100000, 1),
('Sales Lead', 85000, 2),
('Sales Person', 60000, 2),
('HR', 95000, 3),
('Lawyer', 180000, 4);


-- values for employees table --
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES 
('Ali', 'Wong', 1, null),
('Carol', 'Burnett', 2, 1),
('Rodney', 'Dangerfield', 2, 1),
('Amy', 'Schumer', 1, null),
('Dave', 'Chappelle', 2, 4),
('Tom', 'Segura', 3, null),
('Joan', 'Rivers', 4, 6),
('Larry', 'David', 4, 6),
('Iliza', 'Shlesinger', 5, null),
('Bernie', 'Mac', 6, null);





