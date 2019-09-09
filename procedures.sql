-- Creating procedures to run in the ADVENTUREWORKS database.

-- CREATE to create procefure
-- ALTER to alter procedure
-- Normal procedure
ALTER PROCEDURE contact_All
AS BEGIN
SELECT title, FIRSTNAME, Suffix
FROM Person.person
END;
EXEC contact_All

--Create a new procedure with input parameter
ALTER PROCEDURE procContact_All1
@title CHAR(10)
--@name CHAR(20)
AS BEGIN
SELECT title, FIRSTNAME 
FROM Person.person
WHERE title = @title --AND FIRSTNAME = @name
END;

EXEC procContact_All1 'Ms.' 

--PROCEDURE WITH MULTIPLE PARAMETERS AND DEFAULT VALUE
alter PROCEDURE procContact_MV  
@title CHAR(10) = NULL, @name VARCHAR(20)=NULL
AS BEGIN
SELECT * FROM Person.person
WHERE title = ISNULL(@title,title)
AND FIRSTNAME LIKE '%'+ISNULL(@name,firstname)+'%'
END;

EXEC procContact_MV 'Mr.', 'Robert'
EXEC procContact_MV @title = 'Sr.'

--PROCEDURE WITH OUTPUT PARAMETER
CREATE PROCEDURE contact_AllOUT
@title CHAR(10),
@titleCount int OUT
AS
SELECT @titleCount = count(*)
FROM Person.person
WHERE title = @title

DECLARE @count int

EXEC contact_AllOUT 'Ms.',
@titleCount = @count OUT
SELECT @count



-- display definitions of stored procedures with sp_helptext

sp_helptext contact_AllOUT

-- REB\NAME A PROCEDUREWITH sp_rename 'currentName', 'newName'

-- delete procedure with DROP PROCEDURE procedureName, procedureName, ...,


