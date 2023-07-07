﻿/*
Deployment script for Nicholus-StoredProceduresDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Nicholus-StoredProceduresDB"
:setvar DefaultFilePrefix "Nicholus-StoredProceduresDB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 2fd31557-fd58-4986-aa17-af80fbc904a9 is skipped, element [dbo].[Employees].[Id] (SqlSimpleColumn) will not be renamed to Idnumber';


GO
PRINT N'Creating Table [dbo].[Employees]...';


GO
CREATE TABLE [dbo].[Employees] (
    [Idnumber]     INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]    NVARCHAR (20) NOT NULL,
    [LastName]     NVARCHAR (20) NOT NULL,
    [EmailAddress] NVARCHAR (50) NOT NULL,
    [Contact]      NVARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Idnumber] ASC)
);


GO
PRINT N'Altering Procedure [dbo].[spUser_Delete]...';


GO
ALTER PROCEDURE [dbo].[spUser_Delete]
	(@Idnumber int)
AS
BEGIN
	DELETE 
	FROM dbo.[Employees]
	WHERE Idnumber = @Idnumber;
END
GO
PRINT N'Altering Procedure [dbo].[spUser_Get]...';


GO
ALTER PROCEDURE [dbo].[spUser_Get](
	@Idnumber int)
AS
BEGIN
	SELECT FirstName, LastName, EmailAddress, Contact
	FROM dbo.[Employees]
	WHERE Idnumber = @Idnumber;
END
GO
PRINT N'Altering Procedure [dbo].[spUser_GetAll]...';


GO
ALTER PROCEDURE [dbo].[spUser_GetAll]
AS
BEGIN
	SELECT *
	FROM dbo.[Employees];
END
GO
PRINT N'Altering Procedure [dbo].[spUser_Insert]...';


GO
ALTER PROCEDURE [dbo].[spUser_Insert](
@FirstName nvarchar(20),
@LastName nvarchar(20),
@EmailAddress nvarchar(50),
@Contact nvarchar(10))
AS
BEGIN
	INSERT INTO dbo.[Employees](FirstName, LastName, EmailAddress, Contact)
	VALUES(@FirstName, @LastName, @EmailAddress, @Contact);
END
GO
PRINT N'Altering Procedure [dbo].[spUser_Update]...';


GO
ALTER PROCEDURE [dbo].[spUser_Update]
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
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2fd31557-fd58-4986-aa17-af80fbc904a9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2fd31557-fd58-4986-aa17-af80fbc904a9')

GO

GO
If not exists(SELECT 1 FROM dbo.[Employees])
BEGIN
INSERT INTO dbo.[Employees](FirstName, LastName, EmailAddress, Contact)
VALUES('Nick','Williams','nickW@gmail.com','0766180918'),
('Puseletso','Mahlangu','Puse@gmail.com','0624457716'),
('Thabang','Ngobeni','tNgobeni@gmail.com','0657829088');
END
GO

GO
PRINT N'Update complete.';


GO