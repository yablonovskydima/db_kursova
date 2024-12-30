USE service_center_mia
GO

CREATE OR ALTER PROCEDURE sp_set_client
@id BIGINT = NULL OUTPUT,
@first_name VARCHAR(100) = NULL,
@last_name VARCHAR(100) = NULL,
@birth_date DATE = NULL,
@passport_number INT = NULL,
@client_address VARCHAR(150) = NULL,
@email VARCHAR(100) = NULL,
@phone_number VARCHAR(15) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM clients ORDER BY id DESC), 0)
        INSERT INTO clients(
            id, 
            first_name, 
            last_name, 
            birth_date, 
            passport_number, 
            client_address, 
            email, 
            phone_number
        )
        VALUES (
            @id, 
            @first_name, 
            @last_name, 
            @birth_date, 
            @passport_number, 
            @client_address, 
            @email, 
            @phone_number
        )
    END
    ELSE
    BEGIN
        UPDATE clients
        SET 
            first_name = ISNULL(@first_name, first_name),
            last_name = ISNULL(@last_name, last_name),
            birth_date = ISNULL(@birth_date, birth_date),
            passport_number = ISNULL(@passport_number, passport_number),
            client_address = ISNULL(@client_address, client_address),
            email = ISNULL(@email, email),
            phone_number = ISNULL(@phone_number, phone_number)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

GO
CREATE OR ALTER PROCEDURE sp_set_employee
@id BIGINT = NULL OUTPUT,
@first_name VARCHAR(100) = NULL,
@last_name VARCHAR(100) = NULL,
@position_id BIGINT = NULL,
@hire_date DATE = NULL,
@email VARCHAR(100) = NULL,
@phone_number VARCHAR(15) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM employees ORDER BY id DESC), 0)
        INSERT INTO employees(
            id, 
            first_name, 
            last_name, 
            position_id, 
            hire_date, 
            email, 
            phone_number
        )
        VALUES (
            @id, 
            @first_name, 
            @last_name, 
            @position_id, 
            @hire_date, 
            @email, 
            @phone_number
        )
    END
    ELSE
    BEGIN
        UPDATE employees
        SET 
            first_name = ISNULL(@first_name, first_name),
            last_name = ISNULL(@last_name, last_name),
            position_id = ISNULL(@position_id, position_id),
            hire_date = ISNULL(@hire_date, hire_date),
            email = ISNULL(@email, email),
            phone_number = ISNULL(@phone_number, phone_number)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_vehicle
@id BIGINT = NULL OUTPUT,
@owner_id BIGINT = NULL,
@registration_id BIGINT = NULL,
@brand_id BIGINT = NULL,
@model VARCHAR(100) = NULL,
@year_of_manufacturing INT = NULL,
@vehicle_type_id BIGINT = NULL,
@engine_capacity DECIMAL(10, 2) = NULL,
@color VARCHAR(50) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM vehicles ORDER BY id DESC), 0)
        INSERT INTO vehicles(
            id,
            owner_id,
            registration_id,
            brand_id,
            model,
            year_of_manufacturing,
            vehicle_type_id,
            engine_capacity,
            color
        )
        VALUES (
            @id,
            @owner_id,
            @registration_id,
            @brand_id,
            @model,
            @year_of_manufacturing,
            @vehicle_type_id,
            @engine_capacity,
            @color
        )
    END
    ELSE
    BEGIN
        UPDATE vehicles
        SET 
            owner_id = ISNULL(@owner_id, owner_id),
            registration_id = ISNULL(@registration_id, registration_id),
            brand_id = ISNULL(@brand_id, brand_id),
            model = ISNULL(@model, model),
            year_of_manufacturing = ISNULL(@year_of_manufacturing, year_of_manufacturing),
            vehicle_type_id = ISNULL(@vehicle_type_id, vehicle_type_id),
            engine_capacity = ISNULL(@engine_capacity, engine_capacity),
            color = ISNULL(@color, color)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_drivers_license
@id BIGINT = NULL OUTPUT,
@client_id BIGINT = NULL,
@license_number INT = NULL,
@issue_date DATE = NULL,
@expiration_date DATE = NULL,
@is_active BIT = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM drivers_licenses ORDER BY id DESC), 0)
        INSERT INTO drivers_licenses(
            id,
            client_id,
            license_number,
            issue_date,
            expiration_date,
            is_active
        )
        VALUES (
            @id,
            @client_id,
            @license_number,
            @issue_date,
            @expiration_date,
            @is_active
        )
    END
    ELSE
    BEGIN
        UPDATE drivers_licenses
        SET 
            client_id = ISNULL(@client_id, client_id),
            license_number = ISNULL(@license_number, license_number),
            issue_date = ISNULL(@issue_date, issue_date),
            expiration_date = ISNULL(@expiration_date, expiration_date),
            is_active = ISNULL(@is_active, is_active)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_fine
@id BIGINT = NULL OUTPUT,
@client_id BIGINT = NULL,
@vehicle_id BIGINT = NULL,
@fine_amount DECIMAL(10,2) = NULL,
@fine_date DATE = NULL,
@fine_reason VARCHAR(255) = NULL,
@fine_status_id BIGINT = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM fines ORDER BY id DESC), 0)
        INSERT INTO fines(
            id,
            client_id,
            vehicle_id,
            fine_amount,
            fine_date,
            fine_reason,
            fine_status_id
        )
        VALUES (
            @id,
            @client_id,
            @vehicle_id,
            @fine_amount,
            @fine_date,
            @fine_reason,
            @fine_status_id
        )
    END
    ELSE
    BEGIN
        UPDATE fines
        SET 
            client_id = ISNULL(@client_id, client_id),
            vehicle_id = ISNULL(@vehicle_id, vehicle_id),
            fine_amount = ISNULL(@fine_amount, fine_amount),
            fine_date = ISNULL(@fine_date, fine_date),
            fine_reason = ISNULL(@fine_reason, fine_reason),
            fine_status_id = ISNULL(@fine_status_id, fine_status_id)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_auto_service
@id BIGINT = NULL OUTPUT,
@auto_service_name VARCHAR(100) = NULL,
@auto_service_description VARCHAR(250) = NULL,
@amount DECIMAL(10,2) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM auto_services ORDER BY id DESC), 0)
        INSERT INTO.auto_services(
            id,
            auto_service_name,
            auto_service_description,
            amount
        )
        VALUES (
            @id,
            @auto_service_name,
            @auto_service_description,
            @amount
        )
    END
    ELSE
    BEGIN
        UPDATE auto_services
        SET 
            auto_service_name = ISNULL(@auto_service_name, auto_service_name),
            auto_service_description = ISNULL(@auto_service_description, auto_service_description),
            amount = ISNULL(@amount, amount)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_vehicle_owner_history
@id BIGINT = NULL OUTPUT,
@vehicle_id BIGINT = NULL,
@owner_id BIGINT = NULL,
@ownership_start_date DATE = NULL,
@ownership_end_date DATE = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM vehicle_owners_history ORDER BY id DESC), 0)
        INSERT INTO vehicle_owners_history(
            id,
            vehicle_id,
            owner_id,
            ownership_start_date,
            ownership_end_date
        )
        VALUES (
            @id,
            @vehicle_id,
            @owner_id,
            @ownership_start_date,
            @ownership_end_date
        )
    END
    ELSE
    BEGIN
        UPDATE vehicle_owners_history
        SET 
            vehicle_id = ISNULL(@vehicle_id, vehicle_id),
            owner_id = ISNULL(@owner_id, owner_id),
            ownership_start_date = ISNULL(@ownership_start_date, ownership_start_date),
            ownership_end_date = ISNULL(@ownership_end_date, ownership_end_date)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

GO
CREATE OR ALTER PROCEDURE sp_set_vehicle_insurance
@id BIGINT = NULL OUTPUT,
@vehicle_id BIGINT = NULL,
@insurance_provider VARCHAR(100) = NULL,
@policy_number VARCHAR(50) = NULL,
@coverage_start_date DATE = NULL,
@coverage_end_date DATE = NULL,
@premium_amount DECIMAL(10,2) = NULL,
@vehicle_insurance_status VARCHAR(50) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM vehicle_insurances ORDER BY id DESC), 0)
        INSERT INTO vehicle_insurances(
            id,
            vehicle_id,
            insurance_provider,
            policy_number,
            coverage_start_date,
            coverage_end_date,
            premium_amount,
            vehicle_insurance_status
        )
        VALUES (
            @id,
            @vehicle_id,
            @insurance_provider,
            @policy_number,
            @coverage_start_date,
            @coverage_end_date,
            @premium_amount,
            @vehicle_insurance_status
        )
    END
    ELSE
    BEGIN
        UPDATE vehicle_insurances
        SET 
            vehicle_id = ISNULL(@vehicle_id, vehicle_id),
            insurance_provider = ISNULL(@insurance_provider, insurance_provider),
            policy_number = ISNULL(@policy_number, policy_number),
            coverage_start_date = ISNULL(@coverage_start_date, coverage_start_date),
            coverage_end_date = ISNULL(@coverage_end_date, coverage_end_date),
            premium_amount = ISNULL(@premium_amount, premium_amount),
            vehicle_insurance_status = ISNULL(@vehicle_insurance_status, vehicle_insurance_status)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

GO
CREATE OR ALTER PROCEDURE sp_set_position
@id BIGINT = NULL OUTPUT,
@position_name VARCHAR(50) = NULL,
@position_description VARCHAR(255) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM positions ORDER BY id DESC), 0)
        INSERT INTO positions(
            id,
            position_name,
            position_description
        )
        VALUES (
            @id,
            @position_name,
            @position_description
        )
    END
    ELSE
    BEGIN
        UPDATE positions
        SET 
            position_name = ISNULL(@position_name, position_name),
            position_description = ISNULL(@position_description, position_description)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

GO
CREATE OR ALTER PROCEDURE sp_set_vehicle_brand
@id BIGINT = NULL OUTPUT,
@name VARCHAR(100) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM dbo.vehicle_brands ORDER BY id DESC), 0)
        INSERT INTO vehicle_brands(
            id,
            name
        )
        VALUES (
            @id,
            @name
        )
    END
    ELSE
    BEGIN
        UPDATE vehicle_brands
        SET 
            name = ISNULL(@name, name)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

GO
CREATE OR ALTER PROCEDURE sp_set_vehicle_type
@id BIGINT = NULL OUTPUT,
@vehicle_type_name VARCHAR(50) = NULL,
@description VARCHAR(255) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM vehicle_types ORDER BY id DESC), 0)
        INSERT INTO vehicle_types(
            id,
            vehicle_type_name,
            description
        )
        VALUES (
            @id,
            @vehicle_type_name,
            @description
        )
    END
    ELSE
    BEGIN
        UPDATE vehicle_types
        SET 
            vehicle_type_name = ISNULL(@vehicle_type_name, vehicle_type_name),
            description = ISNULL(@description, description)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END

GO
CREATE OR ALTER PROCEDURE sp_set_license_categories
@id BIGINT = NULL OUTPUT,
@category_code VARCHAR(3) = NULL,
@category_description VARCHAR(255) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM license_categories ORDER BY id DESC), 0)
        INSERT INTO license_categories(
            id,
            category_code,
            category_description
        )
        VALUES (
            @id,
            @category_code,
            @category_description
        )
    END
    ELSE
    BEGIN
        UPDATE license_categories
        SET 
            category_code = ISNULL(@category_code, category_code),
            category_description = ISNULL(@category_description, category_description)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_drivers_licenses_categories
@drivers_license_id BIGINT,
@license_category_id BIGINT
AS
BEGIN
BEGIN TRY
    IF NOT EXISTS (
        SELECT 1 
        FROM drivers_licenses_categories 
        WHERE drivers_license_id = @drivers_license_id AND license_category_id = @license_category_id
    )
    BEGIN
        INSERT INTO drivers_licenses_categories(
            drivers_license_id,
            license_category_id
        )
        VALUES (
            @drivers_license_id,
            @license_category_id
        )
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_requests
@id BIGINT = NULL OUTPUT,
@client_id BIGINT = NULL,
@service_id BIGINT = NULL,
@request_date DATE = NULL,
@employee_id BIGINT = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM requests ORDER BY id DESC), 0)
        INSERT INTO requests(
            id,
            client_id,
            service_id,
            request_date,
            employee_id
        )
        VALUES (
            @id,
            @client_id,
            @service_id,
            @request_date,
            @employee_id
        )
    END
    ELSE
    BEGIN
        UPDATE requests
        SET 
            client_id = ISNULL(@client_id, client_id),
            service_id = ISNULL(@service_id, service_id),
            request_date = ISNULL(@request_date, request_date),
            employee_id = ISNULL(@employee_id, employee_id)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_payments
@id BIGINT = NULL OUTPUT,
@client_id BIGINT = NULL,
@amount DECIMAL(10,2) = NULL,
@service_id BIGINT = NULL,
@payment_date DATE = NULL,
@comments VARCHAR(150) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM payments ORDER BY id DESC), 0)
        INSERT INTO payments(
            id,
            client_id,
            amount,
            service_id,
            payment_date,
            comments
        )
        VALUES (
            @id,
            @client_id,
            @amount,
            @service_id,
            @payment_date,
            @comments
        )
    END
    ELSE
    BEGIN
        UPDATE payments
        SET 
            client_id = ISNULL(@client_id, client_id),
            amount = ISNULL(@amount, amount),
            service_id = ISNULL(@service_id, service_id),
            payment_date = ISNULL(@payment_date, payment_date),
            comments = ISNULL(@comments, comments)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_fine_statuses
@id BIGINT = NULL OUTPUT,
@fine_status_description VARCHAR(100) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM fine_statuses ORDER BY id DESC), 0)
        INSERT INTO fine_statuses(
            id,
            fine_status_decription
        )
        VALUES (
            @id,
            @fine_status_description
        )
    END
    ELSE
    BEGIN
        UPDATE fine_statuses
        SET 
            fine_status_decription = ISNULL(@fine_status_description, fine_status_decription)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_inspections
@id BIGINT = NULL OUTPUT,
@vehicle_id BIGINT = NULL,
@inspection_date DATE = NULL,
@result VARCHAR(100) = NULL,
@inspected_by BIGINT = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM inspections ORDER BY id DESC), 0)
        INSERT INTO inspections(
            id,
            vehicle_id,
            inspection_date,
            result,
            inspected_by
        )
        VALUES (
            @id,
            @vehicle_id,
            @inspection_date,
            @result,
            @inspected_by
        )
    END
    ELSE
    BEGIN
        UPDATE inspections
        SET 
            vehicle_id = ISNULL(@vehicle_id, vehicle_id),
            inspection_date = ISNULL(@inspection_date, inspection_date),
            result = ISNULL(@result, result),
            inspected_by = ISNULL(@inspected_by, inspected_by)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_accidents
@id BIGINT = NULL OUTPUT,
@vehicle_id BIGINT = NULL,
@accident_date DATE = NULL,
@accident_location VARCHAR(255) = NULL,
@accident_description VARCHAR(500) = NULL,
@involved_vehicles VARCHAR(255) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM accidents ORDER BY id DESC), 0)
        INSERT INTO accidents(
            id,
            vehicle_id,
            accident_date,
            accident_location,
            accident_description,
            involved_vehicles
        )
        VALUES (
            @id,
            @vehicle_id,
            @accident_date,
            @accident_location,
            @accident_description,
            @involved_vehicles
        )
    END
    ELSE
    BEGIN
        UPDATE accidents
        SET 
            vehicle_id = ISNULL(@vehicle_id, vehicle_id),
            accident_date = ISNULL(@accident_date, accident_date),
            accident_location = ISNULL(@accident_location, accident_location),
            accident_description = ISNULL(@accident_description, accident_description),
            involved_vehicles = ISNULL(@involved_vehicles, involved_vehicles)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END


GO
CREATE OR ALTER PROCEDURE sp_set_notifications
@id BIGINT = NULL OUTPUT,
@client_id BIGINT = NULL,
@content VARCHAR(255) = NULL,
@notification_date DATE = NULL,
@status VARCHAR(50) = NULL
AS
BEGIN
BEGIN TRY
    IF @id IS NULL
    BEGIN
        SET @id = 1 + ISNULL((SELECT TOP(1) id FROM notifications ORDER BY id DESC), 0)
        INSERT INTO notifications(
            id,
            client_id,
            content,
            notification_date,
            status
        )
        VALUES (
            @id,
            @client_id,
            @content,
            @notification_date,
            @status
        )
    END
    ELSE
    BEGIN
        UPDATE notifications
        SET 
            client_id = ISNULL(@client_id, client_id),
            content = ISNULL(@content, content),
            notification_date = ISNULL(@notification_date, notification_date),
            status = ISNULL(@status, status)
        WHERE id = @id
    END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE()
END CATCH
END
