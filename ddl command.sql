drop database if exists company_training;
CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);
alter table departments add primary key(department_id);

alter table employees add primary key (employee_id);

alter table departments add column location varchar(100);

alter table departments change column dept_name department_name varchar (50) not null;

alter table employees modify column salary decimal (12,2) not null;

alter table employees alter column status set default 'active';

alter table employees add constraint uq_employees_email unique (email);

rename table employees to staff;

alter table staff
add constraint
fk_staff_department foreign key (department_id)
references departments (department_id);

alter table staff
drop index uq_employees_email;

alter table staff drop foreign key fk_staff_department;

alter table staff drop primary key;

alter table staff add primary key (employee_id);

alter table departments drop column location;

create database company_management;

rename table company_training.departments to company_management.departments;

rename table company_training.staff to company_management.staff;

drop database company_training;

use company_management;

