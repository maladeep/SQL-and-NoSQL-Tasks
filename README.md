# SQL-and-NoSQL-Tasks-
The repo contains SQL and Sequential and distributed processing tasks solutions based on Data Management System. 


Part B: SQL programming

Consider the following Employee database and sample data. 

You may wish to add more data records. 
Employee (empId, name, address, DOB, job, salaryCode, deptId, manager, schemeId) Department (deptId, name) 
SalaryGrade (salaryCode, startSalary, finishSalary) 
PensionScheme (schemeId, name, rate)


Table  : Employee

| EmpID | Name              | Address             | DOB       | Job          | SalaryCode | DeptID | Manager | SchemeID |
|-------|-------------------|---------------------|------------|---------------|-------------|---------|----------|----------|
| E101  | Young, S.          | 199 London Road     | 05/03/76   | Clerk        | S1          | D10    | E110    | S116     |
| E301  | April, H.          | 20 Glade close      | 10/03/79   | Sales Person | S2          | D30    | E310    | S124     |
| E310  | Newgate, E.        | 10 Heap Street      | 28/11/80   | Manager      | S5          | D30    |          | S121     |
| E501  | Teach, E           | 22 railway road     | 12/02/72   | Analyst      | S5          | D50    |          | S121     |
| E102  | Hawkins, M.        | 3 High Street       | 13/07/74   | Clerk        | S1          | D10    | E110    | S116     |
| E110  | Watkins, J.        | 11 crescent road    | 25/06/69   | Manager      | S5          | D10    |          | S121     |




Table : Department

| DeptID	| Name |
|---------|--------|
| D10 | 	Administration |
| D20	| Finance |
| D30	| Sales |
| D40	| Maintenance |
| D50| v	IT Support |

Table : SalaryGrade

| SalaryCode | StartSalary | FinishSalary |
|------------|-------------|--------------|
| S1         | 15000       | 18000        |
| S2         | 18001       | 22000        |
| S3         | 22001       | 25000        |
| S4         | 25001       | 29000        |
| S5         | 29001       | 38000        |



Table PensionScheme

| SchemeID | Name         | rate |
|----------|--------------|------|
| S110     | AXA          | 0.5  |
| S121     | Premier      | 0.6  |
| S124     | Stakeholder  | 0.4  |
| S116     | Standard     | 0.4  |



1.	Use appropriate data types and write the SQL statements to create the tables defined in the schema above. 
(10%)

2.	Write SQL Statements to return the following data from the Employee database:

a)	The name (in ascending order), the starting salary and department id of each employee within a descending order of department ids. 
b)	Give the number of employees for each of the pension schemes offered by the company. Result listing should include the name of each scheme and its corresponding number of employees who join the scheme. 
c)	Give the total number of employees who are not managers but currently receive an annual salary of over £35,000. (5%) 
d)	List the id and name of each employee along with his/her manager’s name. 


Guidance: Please use standard SQL. Clearly indicate the primary keys and the foreign keys. State the SQL statements and give the results. The presentation of each query should have a text summary which includes 
i) the query itself, 
ii) the corresponding SQL statement solution, 
iii) the result of the execution of the statement and 
iv) evidence that you have used standard SQL and implemented each statement on a database (use screenshots or spool facility). A small data sample is given. When appropriate, you can create and insert additional data records in order to make sure that the queries return results.



-----

Part C: Sequential and distributed processing

Consider the following data structure for a sales data store, where all values are either integers or reals. Each record has eight attributes; the description specifies the list of permissible attribute values and format (metadata).

| Column Name | Data Type   |
|-------------|-------------|
| OrderNo     | Integer     |
| ProductNo   | Integer     |
| Price       | Real/float  |
| Quantity    | Integer     |
| Sales       | Real/float  |
| QtrId       | Quarter (1-4) |
| MonthId     | Integer (1-12) |
| YearId      | Integer     |


The following table contains sample records:

The following table contains sample records:

| OrderNo | ProductNo | Price | Quality | Sales    | QtrId | MonthId | YearID |
|---------|-----------|-------|---------|----------|-------|---------|--------|
| 10107   | 2         | 85.7  | 30      | 2587     | 1     | 2       | 2003   |
| 10107   | 5         | 95.8  | 39      | 3879.49  | 1     | 2       | 2003   |
| 10121   | 5         | 71.5  | 34      | 2700     | 1     | 2       | 2003   |
| 10134   | 2         | 94.74 | 41      | 3884.34  | 3     | 7       | 2004   |
| 10134   | 5         | 100   | 27      | 3307.77  | 3     | 7       | 2004   |
| 10159   | 14        | 100   | 49      | 5205.27  | 4     | 10      | 2005   |
| 10168   | 1         | 96.66 | 36      | 3479.66  | 4     | 10      | 2006   |
| 10180   | 12        | 100   | 42      | 4695.6   | 4     | 11      | 2006   |


The managers of the company would like to determine, for each product, the number of products which were sold in each month of each year. 

1.	 Assuming that the data is stored in a relational database produce, with justification, the SQL code to determine, for each product, the number of products which were sold in each month of each year.
2.	Assuming that the data is too large to be processed in a centralized manner in a relational database, and that it is stored in an ordinary file, produce a decentralised solution which applies MapReduce to the data processing. Justify your decisions and all the steps of your solution. Use diagrams if required. 


> More detail on report can be available on request. 


