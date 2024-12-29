CREATE TABLE clients
(
    id              BIGINT AUTO_INCREMENT NOT NULL,
    first_name      VARCHAR(100)          NOT NULL,
    last_name       VARCHAR(100)          NOT NULL,
    birth_date      DATE                  NOT NULL,
    passport_number INT                   NOT NULL,
    client_address  VARCHAR(150)          NOT NULL,
    email           VARCHAR(100),
    phone_number    VARCHAR(15),
    PRIMARY KEY (id)
);

CREATE TABLE positions
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    position_name        VARCHAR(50)           NOT NULL,
    position_description VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE employees
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    first_name   VARCHAR(100)          NOT NULL,
    last_name    VARCHAR(100)          NOT NULL,
    position_id  BIGINT                NOT NULL,
    hire_date    DATE                  NOT NULL,
    email        VARCHAR(100),
    phone_number VARCHAR(15),
    PRIMARY KEY (id),
    FOREIGN KEY (position_id) REFERENCES positions (id)
);

CREATE TABLE vehicle_brands
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100)          NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE vehicle_types
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    vehicle_type_name VARCHAR(50)           NOT NULL,
    description       VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE vehicle_registrations
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    owner_id            BIGINT                NOT NULL,
    registration_number VARCHAR(8)            NOT NULL,
    registration_date   DATE                  NOT NULL,
    expiration_date     DATE                  NULL,
    is_active           BOOLEAN               NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES clients (id)
);

CREATE TABLE vehicles
(
    id                    BIGINT AUTO_INCREMENT NOT NULL,
    registration_id       BIGINT                NOT NULL,
    brand_id              BIGINT                NOT NULL,
    model                 VARCHAR(100)          NOT NULL,
    year_of_manufacturing INT                   NOT NULL,
    vehicle_type_id       BIGINT                NOT NULL,
    engine_capacity       DECIMAL(10, 2)        NOT NULL,
    color                 VARCHAR(50)           NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (registration_id) REFERENCES vehicle_registrations (id),
    FOREIGN KEY (brand_id) REFERENCES vehicle_brands (id),
    FOREIGN KEY (vehicle_type_id) REFERENCES vehicle_types (id)
);

CREATE TABLE license_categories
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    category_code        VARCHAR(3)            NOT NULL,
    category_description VARCHAR(255)          NULL,
    PRIMARY KEY (id)
);

CREATE TABLE drivers_licenses
(
    id              BIGINT AUTO_INCREMENT NOT NULL,
    client_id       BIGINT                NOT NULL,
    license_number  INT                   NOT NULL,
    issue_date      DATE                  NOT NULL,
    expiration_date DATE                  NOT NULL,
    is_active       BOOLEAN               NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id)
);

CREATE TABLE drivers_licenses_categories
(
    drivers_license_id  BIGINT NOT NULL,
    license_category_id BIGINT NOT NULL,
    PRIMARY KEY (drivers_license_id, license_category_id),
    FOREIGN KEY (drivers_license_id) REFERENCES drivers_licenses (id),
    FOREIGN KEY (license_category_id) REFERENCES license_categories (id)
);

CREATE TABLE auto_services
(
    id                       BIGINT AUTO_INCREMENT NOT NULL,
    auto_service_name        VARCHAR(100)          NOT NULL,
    auto_service_description VARCHAR(250),
    amount                   DECIMAL(10, 2)        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE requests
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    client_id    BIGINT                NOT NULL,
    service_id   BIGINT                NOT NULL,
    request_date DATE                  NOT NULL,
    employee_id  BIGINT                NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (employee_id) REFERENCES employees (id),
    FOREIGN KEY (service_id) REFERENCES auto_services (id)
);

CREATE TABLE payments
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    client_id    BIGINT                NOT NULL,
    amount       DECIMAL(10, 2)        NOT NULL,
    service_id   BIGINT                NOT NULL,
    payment_date DATE                  NOT NULL,
    comments     VARCHAR(150),
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (service_id) REFERENCES auto_services (id)
);

CREATE TABLE fine_statuses
(
    id                      BIGINT AUTO_INCREMENT NOT NULL,
    fine_status_description VARCHAR(100)          NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE fines
(
    id             BIGINT AUTO_INCREMENT NOT NULL,
    client_id      BIGINT                NOT NULL,
    vehicle_id     BIGINT                NOT NULL,
    fine_amount    DECIMAL(10, 2)        NOT NULL,
    fine_date      DATE                  NOT NULL,
    fine_reason    VARCHAR(255)          NOT NULL,
    fine_status_id BIGINT                NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES clients (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
    FOREIGN KEY (fine_status_id) REFERENCES fine_statuses (id)
);

CREATE TABLE inspections
(
    id              BIGINT AUTO_INCREMENT NOT NULL,
    vehicle_id      BIGINT                NOT NULL,
    inspection_date DATE                  NOT NULL,
    result          VARCHAR(100)          NOT NULL,
    inspected_by    BIGINT                NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
    FOREIGN KEY (inspected_by) REFERENCES employees (id)
);

CREATE TABLE accidents
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    vehicle_id           BIGINT                NOT NULL,
    accident_date        DATE                  NOT NULL,
    accident_location    VARCHAR(255)          NOT NULL,
    accident_description VARCHAR(500),
    involved_vehicles    VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id)
);

CREATE TABLE vehicle_owners_history
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    vehicle_id           BIGINT                NOT NULL,
    owner_id             BIGINT                NOT NULL,
    ownership_start_date DATE                  NOT NULL,
    ownership_end_date   DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
    FOREIGN KEY (owner_id) REFERENCES clients (id)
);

CREATE TABLE vehicle_insurances
(
    id                       BIGINT AUTO_INCREMENT NOT NULL,
    vehicle_id               BIGINT                NOT NULL,
    insurance_provider       VARCHAR(100)          NOT NULL,
    policy_number            VARCHAR(50)           NOT NULL,
    coverage_start_date      DATE                  NOT NULL,
    coverage_end_date        DATE                  NOT NULL,
    premium_amount           DECIMAL(10, 2)        NOT NULL,
    vehicle_insurance_status VARCHAR(50)           NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id)
);