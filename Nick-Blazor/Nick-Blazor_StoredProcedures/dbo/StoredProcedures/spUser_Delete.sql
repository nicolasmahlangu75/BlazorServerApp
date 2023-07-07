CREATE PROCEDURE [dbo].[spUser_Delete]
	(@Idnumber int)
AS
BEGIN
	DELETE 
	FROM dbo.[Employees]
	WHERE Idnumber = @Idnumber;
END