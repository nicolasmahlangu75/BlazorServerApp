CREATE PROCEDURE [dbo].[spUser_Insert](
@FirstName nvarchar(20),
@LastName nvarchar(20),
@EmailAddress nvarchar(50),
@Contact nvarchar(10))
AS
BEGIN
	INSERT INTO dbo.[Employees](FirstName, LastName, EmailAddress, Contact)
	VALUES(@FirstName, @LastName, @EmailAddress, @Contact);
END
