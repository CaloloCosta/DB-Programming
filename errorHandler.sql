--use AdventureWorks
-- CREATES A NEW PROCEDURE FOR ERROR HANDLING
-- altering the procedure
 ALTER PROCEDURE spErrorHandler
 AS
 BEGIN
 SELECT
 ERROR_LINE() AS 'Line',
 ERROR_MESSAGE() AS 'Message',
 ERROR_NUMBER() AS 'Error Number',
 ERROR_PROCEDURE() AS 'Procedure Name',
 ERROR_SEVERITY() AS 'Severity', 
 ERROR_STATE() AS 'State'
 END


 AlTER PROC ErrorProcedure
 AS BEGIN
 BEGIN TRY
 SELECT 54/1
 END TRY
 BEGIN CATCH
 EXEC spErrorHandler
 END CATCH
 END

 EXEC ErrorProcedure


CREATE PROC classExercice
	AS BEGIN
		SELECT DepartmentID AS DeptID, Name, GroupName,
		CASE GroupName
			WHEN 'Research and Development' THEN 'Room A'
			WHEN 'Sales and Marketing'THEN 'Room B'
			WHEN 'Manufacturing' THEN 'Roomc'
		ELSE 'Room D'
		END AS ConfRoom
		FROM HumanResources.Department
	END

EXEC classExercice
