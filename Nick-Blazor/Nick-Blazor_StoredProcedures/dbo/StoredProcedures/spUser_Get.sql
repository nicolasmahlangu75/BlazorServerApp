CREATE PROCEDURE [dbo].[spUser_Get](
	@Idnumber int)
AS
BEGIN
	SELECT FirstName, LastName, EmailAddress, Contact
	FROM dbo.[Employees]
	WHERE Idnumber = @Idnumber;
END
