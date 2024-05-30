-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4pB0YQ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- This import was altered because must have mislabled items which did not allow the program to run correctly. They were fixed post import. 

CREATE TABLE departments (
    "dept_no" CHAR(4) PRIMARY KEY,
    "dept_name" varchar(25) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id CHAR(5) NOT NULL, 
    birth_date DATE NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

ALTER TABLE employees
ADD CONSTRAINT fk_titles
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);


CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- SELECT * FROM dept_emp

CREATE TABLE dept_manager (
    "dept_no" varchar(25)   NOT NULL,
    "emp_no" int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    "title_id" CHAR(5)   NOT NULL,
    "title" varchar(25)   NOT NULL
);

ALTER TABLE titles
ADD CONSTRAINT pk_title_id PRIMARY KEY (title_id);

SELECT * FROM titles
