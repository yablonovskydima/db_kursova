USE service_center_mia;

ALTER TABLE clients
ADD 
    valid_from DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN
		CONSTRAINT df_clients_valid_from DEFAULT SYSUTCDATETIME(),
    valid_to DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN
		CONSTRAINT df_clients_valid_to DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (valid_from, valid_to);

ALTER TABLE clients
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.clients_history));



ALTER TABLE vehicles
ADD 
    valid_from DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN 
        CONSTRAINT df_vehicles_valid_from DEFAULT SYSUTCDATETIME(),
    valid_to DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN 
        CONSTRAINT df_vehicles_valid_to DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (valid_from, valid_to);

ALTER TABLE vehicles
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.vehicles_history));


ALTER TABLE employees
ADD 
    valid_from DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN 
        CONSTRAINT df_employees_valid_from DEFAULT SYSUTCDATETIME(),
    valid_to DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN 
        CONSTRAINT df_employees_valid_to DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (valid_from, valid_to);

ALTER TABLE employees
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.employees_history));



ALTER TABLE vehicle_registrations
ADD 
    valid_from DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN 
        CONSTRAINT df_vehicle_reg_valid_from DEFAULT SYSUTCDATETIME(),
    valid_to DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN 
        CONSTRAINT df_vehicle_reg_valid_to DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
    PERIOD FOR SYSTEM_TIME (valid_from, valid_to);

ALTER TABLE vehicle_registrations
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.vehicle_registrations_history));

--simple selects

SELECT * 
FROM clients
WHERE valid_to = '9999-12-31 23:59:59.9999999';

SELECT * 
FROM clients
FOR SYSTEM_TIME ALL
WHERE id = 1;

SELECT * 
FROM employees
FOR SYSTEM_TIME ALL

SELECT * 
FROM vehicles
FOR SYSTEM_TIME ALL
WHERE owner_id = 1;

SELECT *
FROM vehicle_registrations
WHERE valid_to = '9999-12-31 23:59:59.9999999';