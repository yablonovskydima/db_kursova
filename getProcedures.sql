USE service_center_mia
GO
CREATE OR ALTER PROCEDURE sp_get_clients
    @FirstName NVARCHAR(100) = NULL,
    @LastName NVARCHAR(100) = NULL,
    @BirthDate DATE = NULL,
    @PassportNumber INT = NULL,
    @ClientAddress NVARCHAR(150) = NULL,
    @Email NVARCHAR(100) = NULL,
    @PhoneNumber NVARCHAR(15) = NULL,
    @SortColumns NVARCHAR(200) = 'id',
    @SortDirection NVARCHAR(4) = 'ASC',
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SET NOCOUNT ON;

    IF @SortDirection NOT IN ('ASC', 'DESC')
        SET @SortDirection = 'ASC';

    DECLARE @SQL NVARCHAR(MAX) = N'
        WITH ClientsCTE AS (
            SELECT 
                ROW_NUMBER() OVER (ORDER BY ' + @SortColumns + ' ' + @SortDirection + ') AS RowNum,
                id,
                first_name,
                last_name,
                birth_date,
                passport_number,
                client_address,
                email,
                phone_number
            FROM clients
            WHERE 1=1';

    IF @FirstName IS NOT NULL
        SET @SQL += N' AND first_name LIKE ''%'' + @FirstName + ''%''';

    IF @LastName IS NOT NULL
        SET @SQL += N' AND last_name LIKE ''%'' + @LastName + ''%''';

    IF @BirthDate IS NOT NULL
        SET @SQL += N' AND birth_date = @BirthDate';

    IF @PassportNumber IS NOT NULL
        SET @SQL += N' AND passport_number = @PassportNumber';

    IF @ClientAddress IS NOT NULL
        SET @SQL += N' AND client_address LIKE ''%'' + @ClientAddress + ''%''';

    IF @Email IS NOT NULL
        SET @SQL += N' AND email LIKE ''%'' + @Email + ''%''';

    IF @PhoneNumber IS NOT NULL
        SET @SQL += N' AND phone_number LIKE ''%'' + @PhoneNumber + ''%''';

    SET @SQL += N'
        )
        SELECT *
        FROM ClientsCTE
        WHERE RowNum BETWEEN ((@PageNumber - 1) * @PageSize + 1) AND (@PageNumber * @PageSize)
        ORDER BY RowNum;
    ';

    EXEC sp_executesql @SQL,
        N'@FirstName NVARCHAR(100), @LastName NVARCHAR(100), @BirthDate DATE, @PassportNumber INT, 
          @ClientAddress NVARCHAR(150), @Email NVARCHAR(100), @PhoneNumber NVARCHAR(15), 
          @PageNumber INT, @PageSize INT',
        @FirstName = @FirstName,
        @LastName = @LastName,
        @BirthDate = @BirthDate,
        @PassportNumber = @PassportNumber,
        @ClientAddress = @ClientAddress,
        @Email = @Email,
        @PhoneNumber = @PhoneNumber,
        @PageNumber = @PageNumber,
        @PageSize = @PageSize;
END;

GO
CREATE OR ALTER PROCEDURE sp_get_employees
    @EmployeeID BIGINT = NULL,
    @FirstName NVARCHAR(100) = NULL,
    @LastName NVARCHAR(100) = NULL,
    @PositionID BIGINT = NULL,
    @HireDate DATE = NULL,
    @Email NVARCHAR(100) = NULL,
    @PhoneNumber NVARCHAR(15) = NULL,
    @PageSize INT = 10,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF @EmployeeID IS NOT NULL
    AND NOT EXISTS (SELECT * FROM dbo.employees WHERE id = @EmployeeID)
    BEGIN
        PRINT 'Incorrect value of @EmployeeID';
        RETURN;
    END;

    DECLARE @SQL NVARCHAR(MAX) = N'
        WITH EmployeesCTE AS (
            SELECT 
                ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + CASE WHEN @SortDirection = 0 THEN 'ASC' ELSE 'DESC' END + ') AS RowNum,
                id,
                first_name,
                last_name,
                position_id,
                hire_date,
                email,
                phone_number
            FROM dbo.employees
            WHERE 1=1';

    IF @EmployeeID IS NOT NULL
        SET @SQL += N' AND id = @EmployeeID';

    IF @FirstName IS NOT NULL
        SET @SQL += N' AND first_name LIKE @FirstName + ''%''';

    IF @LastName IS NOT NULL
        SET @SQL += N' AND last_name LIKE @LastName + ''%''';

    IF @PositionID IS NOT NULL
        SET @SQL += N' AND position_id = @PositionID';

    IF @HireDate IS NOT NULL
        SET @SQL += N' AND hire_date = @HireDate';

    IF @Email IS NOT NULL
        SET @SQL += N' AND email LIKE @Email + ''%''';

    IF @PhoneNumber IS NOT NULL
        SET @SQL += N' AND phone_number LIKE @PhoneNumber + ''%''';

    SET @SQL += N'
        )
        SELECT *
        FROM EmployeesCTE
        WHERE RowNum BETWEEN ((@PageNumber - 1) * @PageSize + 1) AND (@PageNumber * @PageSize)
        ORDER BY RowNum;
    ';

    EXEC sp_executesql @SQL,
        N'@EmployeeID BIGINT, @FirstName NVARCHAR(100), @LastName NVARCHAR(100), @PositionID BIGINT, @HireDate DATE, 
          @Email NVARCHAR(100), @PhoneNumber NVARCHAR(15), @PageNumber INT, @PageSize INT',
        @EmployeeID = @EmployeeID,
        @FirstName = @FirstName,
        @LastName = @LastName,
        @PositionID = @PositionID,
        @HireDate = @HireDate,
        @Email = @Email,
        @PhoneNumber = @PhoneNumber,
        @PageNumber = @PageNumber,
        @PageSize = @PageSize;
END;


GO
CREATE OR ALTER PROCEDURE sp_get_vehicles
    @VehicleID BIGINT = NULL,
    @OwnerID BIGINT = NULL,
    @RegistrationID BIGINT = NULL,
    @BrandID BIGINT = NULL,
    @Model NVARCHAR(100) = NULL,
    @YearOfManufacturing INT = NULL,
    @VehicleTypeID BIGINT = NULL,
    @EngineCapacity DECIMAL(10, 2) = NULL,
    @Color NVARCHAR(50) = NULL,
    @PageSize INT = 10,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF @VehicleID IS NOT NULL
    AND NOT EXISTS (SELECT * FROM dbo.vehicles WHERE id = @VehicleID)
    BEGIN
        PRINT 'Incorrect value of @VehicleID';
        RETURN;
    END;

    DECLARE @SQL NVARCHAR(MAX) = N'
        WITH VehiclesCTE AS (
            SELECT 
                ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + CASE WHEN @SortDirection = 0 THEN 'ASC' ELSE 'DESC' END + ') AS RowNum,
                id,
                owner_id,
                registration_id,
                brand_id,
                model,
                year_of_manufacturing,
                vehicle_type_id,
                engine_capacity,
                color
            FROM dbo.vehicles
            WHERE 1=1';

    IF @VehicleID IS NOT NULL
        SET @SQL += N' AND id = @VehicleID';

    IF @OwnerID IS NOT NULL
        SET @SQL += N' AND owner_id = @OwnerID';

    IF @RegistrationID IS NOT NULL
        SET @SQL += N' AND registration_id = @RegistrationID';

    IF @BrandID IS NOT NULL
        SET @SQL += N' AND brand_id = @BrandID';

    IF @Model IS NOT NULL
        SET @SQL += N' AND model LIKE @Model + ''%''';

    IF @YearOfManufacturing IS NOT NULL
        SET @SQL += N' AND year_of_manufacturing = @YearOfManufacturing';

    IF @VehicleTypeID IS NOT NULL
        SET @SQL += N' AND vehicle_type_id = @VehicleTypeID';

    IF @EngineCapacity IS NOT NULL
        SET @SQL += N' AND engine_capacity = @EngineCapacity';

    IF @Color IS NOT NULL
        SET @SQL += N' AND color LIKE @Color + ''%''';

    SET @SQL += N'
        )
        SELECT *
        FROM VehiclesCTE
        WHERE RowNum BETWEEN ((@PageNumber - 1) * @PageSize + 1) AND (@PageNumber * @PageSize)
        ORDER BY RowNum;
    ';

    EXEC sp_executesql @SQL,
        N'@VehicleID BIGINT, @OwnerID BIGINT, @RegistrationID BIGINT, @BrandID BIGINT, @Model NVARCHAR(100), 
          @YearOfManufacturing INT, @VehicleTypeID BIGINT, @EngineCapacity DECIMAL(10,2), @Color NVARCHAR(50), 
          @PageNumber INT, @PageSize INT',
        @VehicleID = @VehicleID,
        @OwnerID = @OwnerID,
        @RegistrationID = @RegistrationID,
        @BrandID = @BrandID,
        @Model = @Model,
        @YearOfManufacturing = @YearOfManufacturing,
        @VehicleTypeID = @VehicleTypeID,
        @EngineCapacity = @EngineCapacity,
        @Color = @Color,
        @PageNumber = @PageNumber,
        @PageSize = @PageSize;
END;

GO
CREATE OR ALTER PROCEDURE sp_get_vehicles_registrations
    @RegistrationID BIGINT = NULL,
    @OwnerID BIGINT = NULL,
    @RegistrationNumber VARCHAR(8) = NULL,
    @RegistrationDate DATE = NULL,
    @ExpirationDate DATE = NULL,
    @IsActive BIT = NULL,
    @PageSize INT = 10,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF @RegistrationID IS NOT NULL
    AND NOT EXISTS (SELECT * FROM dbo.vehicle_registrations WHERE id = @RegistrationID)
    BEGIN
        PRINT 'Incorrect value of @RegistrationID';
        RETURN;
    END;

    DECLARE @SQL NVARCHAR(MAX) = N'
        WITH VehicleRegistrationsCTE AS (
            SELECT 
                ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + CASE WHEN @SortDirection = 0 THEN 'ASC' ELSE 'DESC' END + ') AS RowNum,
                id,
                owner_id,
                registration_number,
                registration_date,
                expiration_date,
                is_active
            FROM dbo.vehicle_registrations
            WHERE 1=1';

    IF @RegistrationID IS NOT NULL
        SET @SQL += N' AND id = @RegistrationID';

    IF @OwnerID IS NOT NULL
        SET @SQL += N' AND owner_id = @OwnerID';

    IF @RegistrationNumber IS NOT NULL
        SET @SQL += N' AND registration_number LIKE @RegistrationNumber + ''%''';

    IF @RegistrationDate IS NOT NULL
        SET @SQL += N' AND registration_date = @RegistrationDate';

    IF @ExpirationDate IS NOT NULL
        SET @SQL += N' AND expiration_date = @ExpirationDate';

    IF @IsActive IS NOT NULL
        SET @SQL += N' AND is_active = @IsActive';

    SET @SQL += N'
        )
        SELECT *
        FROM VehicleRegistrationsCTE
        WHERE RowNum BETWEEN ((@PageNumber - 1) * @PageSize + 1) AND (@PageNumber * @PageSize)
        ORDER BY RowNum;
    ';

    EXEC sp_executesql @SQL,
        N'@RegistrationID BIGINT, @OwnerID BIGINT, @RegistrationNumber VARCHAR(8), @RegistrationDate DATE, 
          @ExpirationDate DATE, @IsActive BIT, @PageNumber INT, @PageSize INT',
        @RegistrationID = @RegistrationID,
        @OwnerID = @OwnerID,
        @RegistrationNumber = @RegistrationNumber,
        @RegistrationDate = @RegistrationDate,
        @ExpirationDate = @ExpirationDate,
        @IsActive = @IsActive,
        @PageNumber = @PageNumber,
        @PageSize = @PageSize;
END;

GO
CREATE OR ALTER PROCEDURE get_drivers_licences
    @LicenseID BIGINT = NULL,
    @ClientID BIGINT = NULL,
    @LicenseNumber INT = NULL,
    @IssueDate DATE = NULL,
    @ExpirationDate DATE = NULL,
    @IsActive BIT = NULL,
    @PageSize INT = 10,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF @LicenseID IS NOT NULL
    AND NOT EXISTS (SELECT * FROM dbo.drivers_licenses WHERE id = @LicenseID)
    BEGIN
        PRINT 'Incorrect value of @LicenseID';
        RETURN;
    END;

    DECLARE @SQL NVARCHAR(MAX) = N'
        WITH DriversLicensesCTE AS (
            SELECT 
                ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + CASE WHEN @SortDirection = 0 THEN 'ASC' ELSE 'DESC' END + ') AS RowNum,
                id,
                client_id,
                license_number,
                issue_date,
                expiration_date,
                is_active
            FROM dbo.drivers_licenses
            WHERE 1=1';

    IF @LicenseID IS NOT NULL
        SET @SQL += N' AND id = @LicenseID';

    IF @ClientID IS NOT NULL
        SET @SQL += N' AND client_id = @ClientID';

    IF @LicenseNumber IS NOT NULL
        SET @SQL += N' AND license_number = @LicenseNumber';

    IF @IssueDate IS NOT NULL
        SET @SQL += N' AND issue_date = @IssueDate';

    IF @ExpirationDate IS NOT NULL
        SET @SQL += N' AND expiration_date = @ExpirationDate';

    IF @IsActive IS NOT NULL
        SET @SQL += N' AND is_active = @IsActive';

    SET @SQL += N'
        )
        SELECT *
        FROM DriversLicensesCTE
        WHERE RowNum BETWEEN ((@PageNumber - 1) * @PageSize + 1) AND (@PageNumber * @PageSize)
        ORDER BY RowNum;
    ';

    EXEC sp_executesql @SQL,
        N'@LicenseID BIGINT, @ClientID BIGINT, @LicenseNumber INT, @IssueDate DATE, 
          @ExpirationDate DATE, @IsActive BIT, @PageNumber INT, @PageSize INT',
        @LicenseID = @LicenseID,
        @ClientID = @ClientID,
        @LicenseNumber = @LicenseNumber,
        @IssueDate = @IssueDate,
        @ExpirationDate = @ExpirationDate,
        @IsActive = @IsActive,
        @PageNumber = @PageNumber,
        @PageSize = @PageSize;
END;

GO
CREATE OR ALTER PROCEDURE sp_get_accidents
    @AccidentID BIGINT = NULL,
    @VehicleID BIGINT = NULL,
    @AccidentDate DATE = NULL,
    @AccidentLocation NVARCHAR(255) = NULL,
    @AccidentDescription NVARCHAR(500) = NULL,
    @InvolvedVehicles NVARCHAR(255) = NULL,
    @PageSize INT = 10,
    @PageNumber INT = 1,
    @SortColumn VARCHAR(128) = 'id',
    @SortDirection BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF @AccidentID IS NOT NULL
    AND NOT EXISTS (SELECT * FROM dbo.accidents WHERE id = @AccidentID)
    BEGIN
        PRINT 'Incorrect value of @AccidentID';
        RETURN;
    END;

    DECLARE @SQL NVARCHAR(MAX) = N'
        WITH AccidentsCTE AS (
            SELECT 
                ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + CASE WHEN @SortDirection = 0 THEN 'ASC' ELSE 'DESC' END + ') AS RowNum,
                id,
                vehicle_id,
                accident_date,
                accident_location,
                accident_description,
                involved_vehicles
            FROM dbo.accidents
            WHERE 1=1';

    IF @AccidentID IS NOT NULL
        SET @SQL += N' AND id = @AccidentID';

    IF @VehicleID IS NOT NULL
        SET @SQL += N' AND vehicle_id = @VehicleID';

    IF @AccidentDate IS NOT NULL
        SET @SQL += N' AND accident_date = @AccidentDate';

    IF @AccidentLocation IS NOT NULL
        SET @SQL += N' AND accident_location LIKE @AccidentLocation + ''%''';

    IF @AccidentDescription IS NOT NULL
        SET @SQL += N' AND accident_description LIKE @AccidentDescription + ''%''';

    IF @InvolvedVehicles IS NOT NULL
        SET @SQL += N' AND involved_vehicles LIKE @InvolvedVehicles + ''%''';

    SET @SQL += N'
        )
        SELECT *
        FROM AccidentsCTE
        WHERE RowNum BETWEEN ((@PageNumber - 1) * @PageSize + 1) AND (@PageNumber * @PageSize)
        ORDER BY RowNum;
    ';

    EXEC sp_executesql @SQL,
        N'@AccidentID BIGINT, @VehicleID BIGINT, @AccidentDate DATE, 
          @AccidentLocation NVARCHAR(255), @AccidentDescription NVARCHAR(500), @InvolvedVehicles NVARCHAR(255),
          @PageNumber INT, @PageSize INT',
        @AccidentID = @AccidentID,
        @VehicleID = @VehicleID,
        @AccidentDate = @AccidentDate,
        @AccidentLocation = @AccidentLocation,
        @AccidentDescription = @AccidentDescription,
        @InvolvedVehicles = @InvolvedVehicles,
        @PageNumber = @PageNumber,
        @PageSize = @PageSize;
END;
