CREATE PROCEDURE [dbo].[spUser_Update]
(@Idnumber int,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@EmailAddress nvarchar(50),
@Contact nvarchar(10))
AS
BEGIN
	UPDATE dbo.[Employees]
	SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Contact = @Contact
	WHERE Idnumber = @Idnumber;
END
