-- The following codes CONTAINS Employee database and sample data and based on sample records, it answers
-- follwoing questions:

-- 1.	Use appropriate data types and write the SQL statements to create the tables defined in the schema above. 

-- 2.	Write SQL Statements to return the following data from the Employee database:
-- 
-- a)	The name (in ascending order), the starting salary and department id of each employee within a descending order of department ids. (5%) 
-- b)	Give the number of employees for each of the pension schemes offered by the company. Result listing should include the name of each scheme and its corresponding number of employees who join the scheme. (5%) 
-- c)	Give the total number of employees who are not managers but currently receive an annual salary of over £35,000. (5%) 
-- d)	List the id and name of each employee along with his/her manager’s name. (5%)



--The following statements create the DEPARTMENT table in Employee Database.
CREATE TABLE DEPARTMENT
 (
    DEPT_ID VARCHAR2(10)PRIMARY KEY,
    NAME VARCHAR2(25)
 );

--The following statements create the SALARY_GRADE table in Employee Database.
CREATE TABLE SALARY_GRADE
 (
    SALARY_CODE VARCHAR2(10)PRIMARY KEY,
    START_SALARY NUMBER,
    FINISH_SALARY NUMBER
 );

--The following statements create the PENSION_SCHEME table in Employee Database.
CREATE TABLE PENSION_SCHEME
 (
    SCHEME_ID VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(25),
    RATE NUMBER(2,1)
 );

SELECT 
    * 
FROM 
    SALARY_GRADE;

--The following statements create the EMPLOYEE table in Employee Database.
CREATE TABLE EMPLOYEE
 (
    EMP_ID VARCHAR2(10) PRIMARY KEY, 
    NAME VARCHAR2(25),
    ADDRESS VARCHAR2(25),
    DOB DATE,
    JOB VARCHAR2(25),
    SALARY_CODE VARCHAR2(10),
    DEPT_ID VARCHAR2(10),
    MANAGER VARCHAR2 (10),
    SCHEME_ID VARCHAR2(10),
    FOREIGN KEY(SALARY_CODE) 
    REFERENCES SALARY_GRADE(SALARY_CODE)
    ON DELETE CASCADE,
    FOREIGN KEY (DEPT_ID) 
    REFERENCES DEPARTMENT(DEPT_ID)
    ON DELETE CASCADE,
    FOREIGN KEY (SCHEME_ID) 
    REFERENCES PENSION_SCHEME(SCHEME_ID)
    ON DELETE CASCADE
 );
--DROP TABLE EMPLOYEE
--The following statement inserts a new row into the DEPARTMENT table:
INSERT INTO DEPARTMENT 
VALUES('D10','Administration');

INSERT INTO DEPARTMENT 
VALUES('D20','Finance');

INSERT INTO DEPARTMENT 
VALUES('D30','Sales');

INSERT INTO DEPARTMENT 
VALUES('D40','Maintenance');

INSERT INTO DEPARTMENT 
VALUES('D50','IT Support');

SELECT * FROM department;

--The following statement inserts a new row into the SALARY_GRADE table:
INSERT INTO SALARY_GRADE 
VALUES('S1',15000,18000);

INSERT INTO SALARY_GRADE 
VALUES('S2',18001,22000);

INSERT INTO SALARY_GRADE 
VALUES('S3',22001,25000);

INSERT INTO SALARY_GRADE 
VALUES('S4',25001,29000);

INSERT INTO SALARY_GRADE 
VALUES('S5',29001,38000);

SELECT * FROM SALARY_GRADE;

--The following statement inserts a new row into the PENSION_SCHEME table:
INSERT INTO PENSION_SCHEME 
VALUES('S110','AXA',0.5);

INSERT INTO PENSION_SCHEME 
VALUES('S121','Premier',0.6);

INSERT INTO PENSION_SCHEME 
VALUES('S124','Stakeholder',0.4);

INSERT INTO PENSION_SCHEME 
VALUES('S116','Standard',0.4);

SELECT * FROM PENSION_SCHEME;

--The following statement inserts a new row into the EMPLOYEE table:
INSERT INTO EMPLOYEE 
VALUES('E101','Young,S.','199 london Road',to_date('05/03/76','DD/MM/YY'),'Clerk','S1','D10','E110','S116');

INSERT INTO EMPLOYEE 
VALUES('E301','April,H.','20 Glade close',to_date('10/03/79','DD/MM/YY'),'Sales Person','S2','D30','E310','S124');

INSERT INTO EMPLOYEE 
VALUES('E310','Newgate,E.','10 Heap Street',to_date('28/11/80','DD/MM/YY'),'Manager','S5','D30','','S121');

INSERT INTO EMPLOYEE 
VALUES('E501','Teach,E','22 railway road',to_date('12/02/72','DD/MM/YY'),'Analyst','S5','D50','','S121');

INSERT INTO EMPLOYEE 
VALUES('E102','Hawkins,M.','3 High Street',to_date('13/07/74','DD/MM/YY'),'Clerk','S1','D10','E110','S116');

INSERT INTO EMPLOYEE 
VALUES('E110','Watkins,J.','11 crescent road',to_date('25/06/69','DD/MM/YY'),'Manager','S5','D10','','S121');

SELECT 
    * 
FROM 
    EMPLOYEE;

--a)The name (in ascending order), the starting salary and department id of each employee within a descending order of department ids. 

SELECT 
    E.NAME,
    SD.START_SALARY,
    E.DEPT_ID 
FROM 
    EMPLOYEE E
JOIN SALARY_GRADE SD ON E.SALARY_CODE=SD.SALARY_CODE
ORDER BY 
    NAME,
    DEPT_ID DESC;

/*b)Give the number of employees for each of the pension schemes offered by the company. 
Result listing should include the name of each scheme and its corresponding number of employees who join the scheme. 
*/
SELECT 
    PS.NAME,
    COUNT(E.EMP_ID)
FROM 
    EMPLOYEE E 
INNER JOIN PENSION_SCHEME PS ON E.SCHEME_ID=PS.SCHEME_ID 
GROUP BY PS.NAME;

--c)Give the total number of employees who are not managers but currently receive an annual salary of over ?35,000. 
SELECT
        COUNT(E.EMP_ID) TOTAL_NUMBER_OF_EMPLOYEE,
        SD.FINISH_SALARY AS SALARY
from 
    EMPLOYEE E 
INNER JOIN SALARY_GRADE SD ON E.SALARY_CODE=SD.SALARY_CODE
where 
    SD.FINISH_SALARY>35000 AND E.EMP_ID NOT IN(
                                select 
                                    Manager 
                                from 
                                    Employee 
                                where 
                                    Manager IS NOT NULL 
                                    )    
GROUP BY SD.FINISH_SALARY;

--d)List the id and name of each employee along with his/her manager?s name.
SELECT 
    E1.EMP_ID,
    E1.NAME EMPLOYEE_NAME,
    E2.NAME MANAGER_NAME 
FROM 
    EMPLOYEE E1 
INNER JOIN EMPLOYEE E2 ON E1.MANAGER=E2.EMP_ID;



