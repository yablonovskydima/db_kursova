DELIMITER //
CREATE PROCEDURE AddNewClient(
    IN firstName VARCHAR(100),
    IN lastName VARCHAR(100),
    IN birthDate DATE,
    IN passportNumber INT,
    IN clientAddress VARCHAR(150),
    IN email VARCHAR(100),
    IN phoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO clients (first_name, last_name, birth_date, passport_number, client_address, email, phone_number)
    VALUES (firstName, lastName, birthDate, passportNumber, clientAddress, email, phoneNumber);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetVehicleByRegistration(
    IN registrationNumber VARCHAR(8)
)
BEGIN
    SELECT v.id, v.model, vb.name AS brand, vt.vehicle_type_name AS type, v.color
    FROM vehicles v
             JOIN vehicle_brands vb ON v.brand_id = vb.id
             JOIN vehicle_types vt ON v.vehicle_type_id = vt.id
             JOIN vehicle_registrations vr ON v.registration_id = vr.id
    WHERE vr.registration_number = registrationNumber;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateFineStatus(
    IN fineId BIGINT,
    IN newStatusId BIGINT
)
BEGIN
    UPDATE fines
    SET fine_status_id = newStatusId
    WHERE id = fineId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddNewEmployee(
    IN firstName VARCHAR(100),
    IN lastName VARCHAR(100),
    IN positionId BIGINT,
    IN hireDate DATE,
    IN email VARCHAR(100),
    IN phoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO employees (first_name, last_name, position_id, hire_date, email, phone_number)
    VALUES (firstName, lastName, positionId, hireDate, email, phoneNumber);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetVehicleOwnershipHistory(
    IN vehicleId BIGINT
)
BEGIN
    SELECT vh.id, c.first_name, c.last_name, vh.ownership_start_date, vh.ownership_end_date
    FROM vehicle_owners_history vh
             JOIN clients c ON vh.owner_id = c.id
    WHERE vh.vehicle_id = vehicleId;
END //
DELIMITER ;