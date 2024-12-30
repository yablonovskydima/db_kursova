USE service_center_mia

ALTER TABLE clients
ADD CONSTRAINT chk_clients_birth_date 
CHECK (birth_date <= CURRENT_TIMESTAMP);

ALTER TABLE clients
ADD CONSTRAINT chk_clients_passport_number 
CHECK (passport_number > 0);

ALTER TABLE clients
ADD CONSTRAINT chk_clients_phone_number 
CHECK (phone_number LIKE '+380[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE clients
ADD CONSTRAINT chk_clients_email_format 
CHECK (email LIKE '%_@__%.__%');

ALTER TABLE employees
ADD CONSTRAINT chk_employees_hire_date 
CHECK (hire_date <= CURRENT_TIMESTAMP);

ALTER TABLE employees
ADD CONSTRAINT chk_employees_email_format 
CHECK (email LIKE '%_@__%.__%');

ALTER TABLE vehicle_registrations
ADD CONSTRAINT chk_vehicle_registrations_dates 
CHECK (expiration_date IS NULL OR expiration_date >= registration_date);

ALTER TABLE vehicle_registrations
ADD CONSTRAINT chk_vehicle_registrations_number_format 
CHECK (registration_number LIKE '[А-ЯA-ZЄІЇ][А-ЯA-ZЄІЇ][0-9][0-9][0-9][0-9][А-ЯA-ZЄІЇ][А-ЯA-ZЄІЇ]');

ALTER TABLE vehicles
ADD CONSTRAINT chk_vehicle_year 
CHECK (year_of_manufacturing BETWEEN 1886 AND YEAR(CURRENT_TIMESTAMP));

ALTER TABLE vehicles
ADD CONSTRAINT chk_vehicle_engine_capacity 
CHECK (engine_capacity > 0);

ALTER TABLE vehicles
ADD CONSTRAINT chk_vehicle_color_length 
CHECK (LEN(color) BETWEEN 3 AND 50);

ALTER TABLE drivers_licenses
ADD CONSTRAINT chk_drivers_licenses_dates 
CHECK (expiration_date >= issue_date);

ALTER TABLE drivers_licenses
ADD CONSTRAINT chk_drivers_license_number_positive 
CHECK (license_number > 0);

ALTER TABLE auto_services
ADD CONSTRAINT chk_auto_services_amount 
CHECK (amount > 0);

ALTER TABLE auto_services
ADD CONSTRAINT chk_auto_services_name_length 
CHECK (LEN(auto_service_name) <= 100);

ALTER TABLE requests
ADD CONSTRAINT chk_requests_date 
CHECK (request_date <= CURRENT_TIMESTAMP);

ALTER TABLE payments
ADD CONSTRAINT chk_payments_amount 
CHECK (amount > 0);

ALTER TABLE payments
ADD CONSTRAINT chk_payments_date 
CHECK (payment_date <= CURRENT_TIMESTAMP);

ALTER TABLE fines
ADD CONSTRAINT chk_fines_amount 
CHECK (fine_amount > 0);

ALTER TABLE fines
ADD CONSTRAINT chk_fines_date 
CHECK (fine_date <= CURRENT_TIMESTAMP);

ALTER TABLE fines
ADD CONSTRAINT chk_fines_reason_length 
CHECK (LEN(fine_reason) <= 255);

ALTER TABLE inspections
ADD CONSTRAINT chk_inspections_date 
CHECK (inspection_date <= CURRENT_TIMESTAMP);

ALTER TABLE accidents
ADD CONSTRAINT chk_accidents_date 
CHECK (accident_date <= CURRENT_TIMESTAMP);

ALTER TABLE accidents
ADD CONSTRAINT chk_accident_location_length 
CHECK (LEN(accident_location) <= 255);

ALTER TABLE vehicle_owners_history
ADD CONSTRAINT chk_vehicle_ownership_dates 
CHECK (ownership_end_date IS NULL OR ownership_end_date >= ownership_start_date);

ALTER TABLE vehicle_insurances
ADD CONSTRAINT chk_vehicle_insurances_dates 
CHECK (coverage_end_date >= coverage_start_date);

ALTER TABLE vehicle_insurances
ADD CONSTRAINT chk_vehicle_insurances_premium 
CHECK (premium_amount > 0);

ALTER TABLE vehicle_insurances
ADD CONSTRAINT chk_vehicle_insurances_status_length 
CHECK (LEN(vehicle_insurance_status) <= 50);
