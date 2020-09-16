﻿/*
Deployment script for GuestHouse

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "GuestHouse"
:setvar DefaultFilePrefix "GuestHouse"
:setvar DefaultDataPath "C:\Users\Vivek Sengar\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Vivek Sengar\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [Master]...';


GO
CREATE SCHEMA [Master]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [Master].[RoomType]...';


GO
CREATE TABLE [Master].[RoomType] (
    [RoomTypeID] INT           NOT NULL,
    [Type]       NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED ([RoomTypeID] ASC)
);


GO
PRINT N'Creating [Master].[PaymentTypes]...';


GO
CREATE TABLE [Master].[PaymentTypes] (
    [PaymentTypeID] INT           IDENTITY (1, 1) NOT NULL,
    [PaymentType]   NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([PaymentTypeID] ASC)
);


GO
PRINT N'Creating [Master].[GuestHouseIndex]...';


GO
CREATE TABLE [Master].[GuestHouseIndex] (
    [GuestHouseID] INT           NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([GuestHouseID] ASC)
);


GO
PRINT N'Creating [Master].[BookingStatus]...';


GO
CREATE TABLE [Master].[BookingStatus] (
    [BookingStatusID] INT           IDENTITY (1, 1) NOT NULL,
    [BookingStatus]   NVARCHAR (30) NOT NULL,
    CONSTRAINT [PK_BookingStatus] PRIMARY KEY CLUSTERED ([BookingStatusID] ASC)
);


GO
PRINT N'Creating [dbo].[Employee]...';


GO
CREATE TABLE [dbo].[Employee] (
    [EmployeeID]   INT            NOT NULL,
    [FirstName]    NVARCHAR (50)  NOT NULL,
    [LastName]     NVARCHAR (50)  NOT NULL,
    [EmailAddress] NVARCHAR (100) NOT NULL,
    [MobileNo]     INT            NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
);


GO
PRINT N'Creating [dbo].[Guest]...';


GO
CREATE TABLE [dbo].[Guest] (
    [GuestId]      INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]    NVARCHAR (50) NOT NULL,
    [LastName]     NVARCHAR (50) NOT NULL,
    [EmailAddress] NVARCHAR (50) NOT NULL,
    [MobileNo]     NVARCHAR (50) NOT NULL,
    [ID]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK__Guest__0C423C126815141F] PRIMARY KEY CLUSTERED ([GuestId] ASC)
);


GO
PRINT N'Creating [dbo].[Payments]...';


GO
CREATE TABLE [dbo].[Payments] (
    [PaymentID]     INT             NOT NULL,
    [BookingID]     INT             NOT NULL,
    [PaymentTypeID] INT             NOT NULL,
    [PaymentAmount] DECIMAL (18, 2) NOT NULL,
    [isActive]      BIT             NOT NULL,
    PRIMARY KEY CLUSTERED ([PaymentID] ASC)
);


GO
PRINT N'Creating [dbo].[Registration]...';


GO
CREATE TABLE [dbo].[Registration] (
    [ID]           INT           NOT NULL,
    [FirstName]    NVARCHAR (50) NOT NULL,
    [LastName]     NVARCHAR (50) NULL,
    [EmailAddress] VARCHAR (50)  NOT NULL,
    [MobileNo]     NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([EmailAddress] ASC)
);


GO
PRINT N'Creating [dbo].[Rooms]...';


GO
CREATE TABLE [dbo].[Rooms] (
    [RoomID]          INT            IDENTITY (1, 1) NOT NULL,
    [RoomNumber]      NVARCHAR (8)   NOT NULL,
    [RoomPrice]       NVARCHAR (10)  NOT NULL,
    [RoomImage]       NVARCHAR (550) NULL,
    [BookingStatusID] INT            NOT NULL,
    [RoomTypeID]      INT            NOT NULL,
    [RoomCapacity]    INT            NOT NULL,
    [RoomDescription] NVARCHAR (550) NULL,
    [IsActive]        BIT            NULL,
    [GuestHouseID]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([RoomID] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[Payments]...';


GO
ALTER TABLE [dbo].[Payments]
    ADD DEFAULT ((1)) FOR [isActive];


GO
PRINT N'Creating unnamed constraint on [dbo].[Rooms]...';


GO
ALTER TABLE [dbo].[Rooms]
    ADD DEFAULT ((1)) FOR [IsActive];


GO
PRINT N'Creating [dbo].[spGetGuestById]...';


GO
Create procedure spGetGuestById
@ID int
as 
begin
	select FirstName,LastName,EmailAddress,MobileNo,ID 
	from Guest
	where GuestId=@ID
end
GO
PRINT N'Creating [dbo].[spInsertGuest]...';


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
	CREATE PROCEDURE [dbo].[spInsertGuest]
	(	
		@FirstName nvarchar(50),
		@LastName nvarchar(50),
		@EmailAddress nvarchar(50),
		@MobileNo nvarchar(50),
		@ID nvarchar(50)
	)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO dbo.Guest 
   (
		FirstName,
		LastName,
		EmailAddress,
		MobileNo,
		ID
   )
   VALUES(
	@FirstName,
	@LastName,
	@EmailAddress,
	@MobileNo,
	@ID
   
   )
END
GO
PRINT N'Creating [dbo].[spInsertRoom]...';


GO
CREATE PROCEDURE [dbo].[spInsertRoom]
(
	@RoomNumber nvarchar(8),
	@RoomPrice nvarchar(10),
	@RoomImage nvarchar(550),
	@BookingStatusID int ,
	@RoomTypeID int,
	@RoomCapacity int,
	@RoomDescription nvarchar(550),
	@GuestHouseID int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO dbo.Rooms
	(
	RoomNumber ,
	RoomPrice ,
	RoomImage ,
	BookingStatusID ,
	RoomTypeID ,
	RoomCapacity, 
	RoomDescription ,
	GuestHouseID 
	)
	VALUES
	(
	@RoomNumber ,
	@RoomPrice ,
	@RoomImage ,
	@BookingStatusID,
	@RoomTypeID ,
	@RoomCapacity ,
	@RoomDescription ,
	@GuestHouseID 
	)

END
RETURN 0
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '997ca34f-bcb9-479a-9ec0-88f0f35f89a6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('997ca34f-bcb9-479a-9ec0-88f0f35f89a6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4bfa91cf-0adc-4e6c-8925-16589ef5003b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4bfa91cf-0adc-4e6c-8925-16589ef5003b')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
