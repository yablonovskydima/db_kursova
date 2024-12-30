

CREATE TABLE clients(
	id BIGINT IDENTITY(1,1) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	birth_date DATE NOT NULL,
	passport_number INT NOT NULL,
	client_address VARCHAR(150) NOT NULL,
	email VARCHAR(100),
    phone_number VARCHAR(15),
	CONSTRAINT pk_clients_id PRIMARY KEY(id)
);

CREATE TABLE positions (
    id BIGINT IDENTITY(1,1) NOT NULL,
    position_name VARCHAR(50) NOT NULL,
    position_description VARCHAR(255),
    CONSTRAINT pk_positions_id PRIMARY KEY (id)
);

CREATE TABLE employees (
    id BIGINT IDENTITY(1,1) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
     position_id BIGINT NOT NULL, 
    hire_date DATE NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(15),
	CONSTRAINT pk_employees_id PRIMARY KEY(id),
	CONSTRAINT fk_employees_position_id FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE vehicle_brands (
    id BIGINT IDENTITY(1,1) NOT NULL,
    name VARCHAR(100) NOT NULL,
    CONSTRAINT pk_vehicle_brands_id PRIMARY KEY (id)
);

CREATE TABLE vehicle_types (
    id BIGINT IDENTITY(1,1) NOT NULL,
    vehicle_type_name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    CONSTRAINT pk_vehicle_types_id PRIMARY KEY (id)
);

CREATE TABLE vehicle_registrations (
    id BIGINT IDENTITY(1,1) NOT NULL,
    owner_id BIGINT NOT NULL,
    registration_number VARCHAR(8) NOT NULL,
    registration_date DATE NOT NULL,
    expiration_date DATE NULL,
    is_active BIT NOT NULL,
    CONSTRAINT pk_vehicle_registrations_id PRIMARY KEY (id),
    CONSTRAINT fk_vehicle_registrations_owner_id FOREIGN KEY (owner_id) 
    REFERENCES clients (id)
);

CREATE TABLE vehicles (
    id BIGINT IDENTITY(1,1) NOT NULL,
    registration_id BIGINT NOT NULL,
    brand_id BIGINT NOT NULL,
    model VARCHAR(100) NOT NULL,
    year_of_manufacturing INT NOT NULL,
    vehicle_type_id BIGINT NOT NULL,
    engine_capacity DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50) NOT NULL,
    CONSTRAINT pk_vehicles_id PRIMARY KEY (id),
	CONSTRAINT fk_vehicles_registration_id FOREIGN KEY (registration_id) 
    REFERENCES vehicle_registrations (id),
    CONSTRAINT fk_vehicles_brand_id FOREIGN KEY (brand_id) REFERENCES vehicle_brands (id),
    CONSTRAINT fk_vehicles_type_id FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types (id)
);

CREATE TABLE license_categories (
    id BIGINT IDENTITY(1,1) NOT NULL,
    category_code VARCHAR(3) NOT NULL,
    category_description VARCHAR(255) NULL,
    CONSTRAINT pk_license_categories_id PRIMARY KEY (id)
);

CREATE TABLE drivers_licenses (
    id BIGINT IDENTITY(1,1) NOT NULL,
    client_id BIGINT NOT NULL,
    license_number INT NOT NULL,
    issue_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    is_active BIT NOT NULL,
    CONSTRAINT pk_drivers_licenses_id PRIMARY KEY (id),
    CONSTRAINT fk_drivers_licenses_client_id FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE drivers_licenses_categories (
    drivers_license_id BIGINT NOT NULL,
    license_category_id BIGINT NOT NULL,
    CONSTRAINT pk_drivers_licenses_categories 
    PRIMARY KEY (drivers_license_id, license_category_id),
    CONSTRAINT fk_drivers_licenses_categories_license_id 
    FOREIGN KEY (drivers_license_id) REFERENCES drivers_licenses (id),
    CONSTRAINT fk_drivers_licenses_categories_category_id 
    FOREIGN KEY (license_category_id) REFERENCES license_categories (id)
);

CREATE TABLE auto_services(
	id BIGINT IDENTITY(1,1) NOT NULL,
	auto_service_name VARCHAR(100) NOT NULL,
	auto_service_description VARCHAR(250),
	amount DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_auto_servicess_id PRIMARY KEY(id),
)

CREATE TABLE requests(
	id BIGINT IDENTITY(1,1) NOT NULL,
	client_id BIGINT NOT NULL,
	service_id BIGINT NOT NULL,
	request_date DATE NOT NULL,
	employee_id BIGINT NOT NULL,
	CONSTRAINT pk_requests_id PRIMARY KEY(id),
	CONSTRAINT fk_requests_client_id FOREIGN KEY(client_id) REFERENCES clients(id),
	CONSTRAINT fk_requests_employee_id FOREIGN KEY(employee_id) REFERENCES employees(id),
	CONSTRAINT fk_requests_service_id FOREIGN KEY(service_id) REFERENCES auto_services(id)
);

CREATE TABLE payments (
    id BIGINT IDENTITY(1,1) NOT NULL,
    client_id BIGINT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    service_id BIGINT NOT NULL,
    payment_date DATE NOT NULL,
	comments VARCHAR(150),
	CONSTRAINT pk_payments_id PRIMARY KEY(id),
    CONSTRAINT fk_payments_client_id FOREIGN KEY (client_id) REFERENCES clients(id),
	CONSTRAINT fk_payments_service_id FOREIGN KEY(service_id) REFERENCES auto_services(id)
);

CREATE TABLE fine_statuses(
	id BIGINT IDENTITY(1,1) NOT NULL,
	fine_status_description VARCHAR(100) NOT NULL,
	CONSTRAINT pk_fine_statuses_id PRIMARY KEY(id),
);

CREATE TABLE fines (
    id BIGINT IDENTITY(1,1) NOT NULL,
    client_id BIGINT NOT NULL,
    vehicle_id BIGINT NOT NULL,
    fine_amount DECIMAL(10,2) NOT NULL,
    fine_date DATE NOT NULL,
    fine_reason VARCHAR(255) NOT NULL,
    fine_status_id BIGINT NOT NULL,
	CONSTRAINT pk_fines_id PRIMARY KEY(id),
    CONSTRAINT fk_fines_client_id FOREIGN KEY (client_id) REFERENCES clients(id),
    CONSTRAINT fk_fines_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
	CONSTRAINT fk_fines_fine_statuses FOREIGN KEY (fine_status_id) REFERENCES fine_statuses(id)
);

CREATE TABLE inspections (
    id BIGINT IDENTITY(1,1) NOT NULL,
    vehicle_id BIGINT NOT NULL,
    inspection_date DATE NOT NULL,
    result VARCHAR(100) NOT NULL,
    inspected_by BIGINT NOT NULL,
	CONSTRAINT pk_inspections_id PRIMARY KEY(id),
    CONSTRAINT fk_inspections_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    CONSTRAINT fk_inspections_inspected_by FOREIGN KEY (inspected_by) REFERENCES employees(id)
);

CREATE TABLE accidents (
    id BIGINT IDENTITY(1,1) NOT NULL,
    vehicle_id BIGINT NOT NULL,
    accident_date DATE NOT NULL,
    accident_location VARCHAR(255) NOT NULL,
    accident_description VARCHAR(500),
    involved_vehicles VARCHAR(255),
	CONSTRAINT pk_accidents_id PRIMARY KEY(id),
    CONSTRAINT fk_accidents_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

CREATE TABLE vehicle_owners_history (
    id BIGINT IDENTITY(1,1) NOT NULL,
    vehicle_id BIGINT NOT NULL,
    owner_id BIGINT NOT NULL,
    ownership_start_date DATE NOT NULL,
    ownership_end_date DATE,
	CONSTRAINT pk_vehicle_owners_history_id PRIMARY KEY(id),
    CONSTRAINT fk_history_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    CONSTRAINT fk_history_owner_id FOREIGN KEY (owner_id) REFERENCES clients(id)
);


CREATE TABLE vehicle_insurances (
    id BIGINT IDENTITY(1,1) NOT NULL,
    vehicle_id BIGINT NOT NULL,
    insurance_provider VARCHAR(100) NOT NULL,
    policy_number VARCHAR(50) NOT NULL,
    coverage_start_date DATE NOT NULL,
    coverage_end_date DATE NOT NULL,
    premium_amount DECIMAL(10,2) NOT NULL,
    vehicle_insurance_status VARCHAR(50) NOT NULL,
    CONSTRAINT pk_vehicle_insurances_id PRIMARY KEY(id),
    CONSTRAINT fk_vehicle_insurances_vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

