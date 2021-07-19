-- Database --

DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;
USE employee_db;

-- department Table --
CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);

-- role Table --
CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

-- employees Table 
CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (manager_id) REFERENCES employee(id)
);

-- vlaues for department table --
INSERT INTO department (name)
VALUES ('Engineer'),
('Sales'),
('Finance'),
('Legal');

-- values for role table --
INSERT INTO role (title, salary, department_id)
VALUES ('Lead Engineer', 160000, 3),
('Engineer', 100000, 4),
('Sales Lead', 80000, 10),
('Sales Person', 60000, 11),
('Lawyer', 180000, 20);

-- values for employee table --
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Tom', 'Segura', 10, null),
('Joan', 'Rivers', 11, 10),
('Larry', 'David', 11, 10),
('Bernie', 'Mac', 20, null),
('Amy', 'Schumer', 3, null),
('Carol', 'Burnett', 4, 3),
('Rodney', 'Dangerfield', 4, 3),
('Iliza', 'Shlesinger', 20, null),
('Ali', 'Wong', 10, null),
('Dave', 'Chappelle', 11, 10);



