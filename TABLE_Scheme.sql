--Data Engineering

--Create a Table Schema for each of the 6 CSV Files

--1.Employees Table
CREATE TABLE Employees(
emp_no INT   NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
gender VARCHAR NOT NULL,
hire_date DATE NOT NULL

);

--2.Salaries Table
CREATE TABLE Salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
);

--3.Departments Table
CREATE TABLE Departments (
dept_no VARCHAR NOT NUll,
dept_name VARCHAR NOT NULL
);

--4.Department Employees Table
CREATE TABLE Dept_Emp (
emp_no INT NOT NULL,
dept_no VARCHAR NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
);

--5.Department Manager Table
CREATE TABLE Dept_Manager(
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
);

--6.Titles Table
CREATE TABLE Titles(
emp_no INT NOT NULL,
title VARCHAR NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL
);
