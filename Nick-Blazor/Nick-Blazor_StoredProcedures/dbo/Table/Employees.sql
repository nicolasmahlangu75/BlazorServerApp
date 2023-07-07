CREATE TABLE [dbo].[Employees]
(
	[Idnumber] INT NOT NULL PRIMARY KEY IDENTITY,
	[FirstName] nvarchar(20) NOT NULL,
	[LastName] nvarchar(20) NOT NULL,
	[EmailAddress] nvarchar(50) NOT NULL,
	[Contact] nvarchar(10) NOT NULL
)
