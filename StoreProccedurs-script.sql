CREATE PROCEDURE usp_AddUser
    @Username NVARCHAR(50),
    @PasswordHash NVARCHAR(100),
    @Firstname NVARCHAR(50),
    @Lastname NVARCHAR(50),
    @Device NVARCHAR(50),
    @IpAddress NVARCHAR(50),
    @CreatedAt DATETIME
AS
BEGIN
    INSERT INTO Users (Username, PasswordHash, FirstName, LastName, Device, IpAddress, CreatedAt)
    VALUES (@Username, @PasswordHash, @Firstname, @Lastname, @Device, @IpAddress, @CreatedAt);
    
    SELECT CAST(SCOPE_IDENTITY() AS INT);
END
GO

CREATE PROCEDURE usp_AddUserLogin
    @UserId INT,
    @IpAddress NVARCHAR(50),
    @Device NVARCHAR(50),
    @Browser NVARCHAR(50),
    @LoginTime DATETIME
AS
BEGIN
    INSERT INTO UserLogin (UserId, IpAddress, Device, Browser, LoginTime)
    VALUES (@UserId, @IpAddress, @Device, @Browser, @LoginTime);
END
GO

CREATE PROCEDURE usp_UpdateUserBalance
    @Username NVARCHAR(50),
    @Balance DECIMAL(18, 2)
AS
BEGIN
    UPDATE Users SET Balance = @Balance WHERE Username = @Username;
END
GO

CREATE PROCEDURE usp_GetUserByUsername
    @Username NVARCHAR(50)
AS
BEGIN
    SELECT * FROM Users WHERE Username = @Username;
END
GO

CREATE PROCEDURE usp_GetUserBalance
    @Username NVARCHAR(50)
AS
BEGIN
    SELECT Balance FROM Users WHERE Username = @Username;
END
GO

CREATE PROCEDURE usp_DoesUserExist
    @Username NVARCHAR(50)
AS
BEGIN
    SELECT COUNT(1) FROM Users WHERE Username = @Username;
END
GO
