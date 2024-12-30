

INSERT INTO clients (first_name, last_name, birth_date, passport_number, client_address, email, phone_number) VALUES 
('Ivan', 'Petrenko', '1985-03-15', 123456, 'Taras Shevchenko St., 10', 'ivan.petrenko@example.com', '+380631234567'), 
('Maria', 'Ivanenko', '1990-07-22', 234567, 'Sichovyh Striltsiv St., 5', 'maria.ivanenko@example.com', '+380631234568'), 
('Oleksandr', 'Sydorenko', '1982-11-05', 345678, 'Independence St., 20', 'oleksandr.sydorenko@example.com', '+380631234569'), 
('Anna', 'Kovalenko', '1995-12-15', 456789, 'Lesya Ukrainka St., 12', 'anna.kovalenko@example.com', '+380631234570'), 
('Viktor', 'Dmytrenko', '1988-01-30', 567890, 'Hrushevsky St., 14', 'viktor.dmytrenko@example.com', '+380631234571'), 
('Svitlana', 'Bondarenko', '1992-09-10', 678901, 'Stepan Bandera St., 8', 'svitlana.bondarenko@example.com', '+380631234572'), 
('Oleg', 'Serdyuk', '1980-05-21', 789012, 'Kotlyarevskyi St., 7', 'oleg.serdyuk@example.com', '+380631234573'), 
('Kateryna', 'Martynenko', '1997-04-14', 890123, 'Dovzhenko St., 15', 'katerina.martynenko@example.com', '+380631234574'), 
('Pavlo', 'Hryshchenko', '1984-10-25', 901234, 'Mykola Hohol St., 9', 'pavlo.hryshchenko@example.com', '+380631234575'), 
('Tetiana', 'Semenenko', '1991-06-18', 123890, 'Yaroslav the Wise St., 3', 'tetiana.semenenko@example.com', '+380631234576');

INSERT INTO positions (position_name, position_description) VALUES
('Manager', 'Manages the companys operations, interacts with clients'),
('Secretary', 'Performs administrative duties, maintains documentation'),
('Mechanic', 'Responsible for the maintenance of vehicles'),
('Service Expert', 'Provides consultations on service offerings'),
('Sales Specialist', 'Sells automotive services and spare parts'),
('Cashier', 'Processes payments and financial transactions'),
('Driver', 'Drives the company vehicles, ensures their safety'),
('Engineer', 'Develops new technologies for vehicle maintenance'),
('Administrator', 'Manages the office operations, responsible for organization'),
('Accountant', 'Maintains the companys accounting, oversees finances');

INSERT INTO employees (first_name, last_name, position_id, hire_date, email, phone_number) VALUES
('Mykola', 'Tymoshenko', 1, '2020-01-15', 'mykola.tymoshenko@example.com', '+380631234577'),
('Olha', 'Kovalenko', 2, '2019-05-20', 'olha.kovalenko@example.com', '+380631234578'),
('Ihor', 'Lysenko', 3, '2021-03-10', 'ihor.lysenko@example.com', '+380631234579'),
('Olena', 'Stashenko', 4, '2018-07-25', 'olena.stashenko@example.com', '+380631234580'),
('Serhii', 'Diakiv', 5, '2017-11-30', 'serhii.diakiv@example.com', '+380631234581'),
('Yaroslav', 'Vasylenko', 6, '2022-02-14', 'yaroslav.vasylenko@example.com', '+380631234582'),
('Viktoriya', 'Romashenko', 7, '2020-08-19', 'viktoriya.romashenko@example.com', '+380631234583'),
('Anatolii', 'Melnyk', 8, '2021-10-05', 'anatolii.melnyk@example.com', '+380631234584'),
('Kateryna', 'Hnatiuk', 9, '2019-04-30', 'katerina.hnatiuk@example.com', '+380631234585'),
('Petro', 'Zavadskiy', 10, '2020-06-15', 'petro.zavadskiy@example.com', '+380631234586');

INSERT INTO vehicle_brands (name) VALUES 
('Toyota'),
('Ford'),
('BMW'),
('Mercedes-Benz'),
('Honda'),
('Nissan'),
('Hyundai'),
('Volkswagen'),
('Kia'),
('Subaru');

INSERT INTO vehicle_types (vehicle_type_name, description) VALUES 
('Sedan', 'A sedan is a passenger car in a three-box configuration with separate compartments for engine, passenger, and cargo.'),
('SUV', 'A sport utility vehicle (SUV) is a car classification that combines elements of road-going passenger cars with off-road vehicles.'),
('Coupe', 'A coupe is a passenger car characterized by a fixed roof, a fixed rear window, and typically two doors.'),
('Hatchback', 'A hatchback is a car design featuring a rear door that swings upwards, providing access to the cargo area.'),
('Convertible', 'A convertible is a passenger car that can be driven with or without a roof in place.'),
('Pickup', 'A pickup truck is a light-duty truck with an enclosed cab and an open cargo area with low sides and a tailgate.'),
('Minivan', 'A minivan is a vehicle designed for personal use, with a high roof and multiple seating configurations.'),
('Wagon', 'A wagon, or station wagon, is a car body style that is similar to a sedan but with an extended rear cargo area.'),
('Crossover', 'A crossover SUV combines characteristics of road-going passenger cars with features of off-road vehicles.'),
('Sports Car', 'A sports car is designed for high speed and performance, often with a two-door configuration.');

INSERT INTO vehicle_registrations (owner_id, registration_number, registration_date, expiration_date, is_active) VALUES
(1, 'ABC1234', '2021-05-01', '2024-05-01', 1),
(2, 'XYZ5678', '2020-03-15', '2023-03-15', 0),
(3, 'LMN4321', '2022-08-10', '2025-08-10', 1),
(4, 'QWE8765', '2019-12-20', '2022-12-20', 0),
(5, 'RST9876', '2023-01-30', '2026-01-30', 1);

INSERT INTO vehicles (registration_id, brand_id, model, year_of_manufacturing, vehicle_type_id, engine_capacity, color) VALUES
(1, 1, 'Toyota Camry', 2020, 1, 2.5, 'Blue'),
(2, 5, 'Honda Civic', 2018, 2, 2.0, 'Red'),
(3, 2, 'Ford Focus', 2022, 1, 1.5, 'Black'),
(4, 3, 'BMW M5', 2017, 3, 2.4, 'White'),
(5, 6, 'Nissan Altima', 2021, 1, 2.5, 'Silver');

INSERT INTO license_categories (category_code, category_description) VALUES
('A', 'Motorcycles'),
('B', 'Cars'),
('C', 'Commercial Vehicles'),
('D', 'Buses'),
('BE', 'Car with a trailer'),
('CE', 'Trucks'),
('CE', 'Troleybuses');


INSERT INTO drivers_licenses (client_id, license_number, issue_date, expiration_date, is_active) VALUES
(1, 123456789, '2020-06-15', '2030-06-15', 1),
(2, 987654321, '2019-08-25', '2029-08-25', 0),
(3, 234567890, '2021-03-10', '2031-03-10', 1),
(4, 876543210, '2022-11-05', '2032-11-05', 1),
(5, 345678901, '2018-12-20', '2028-12-20', 0);


INSERT INTO drivers_licenses_categories (drivers_license_id, license_category_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 2),
(4, 2),
(4, 5),
(5, 2),
(5, 5),
(5, 6);

INSERT INTO auto_services (auto_service_name, auto_service_description, amount) VALUES
('Oil Change', 'Changing the engine oil and filter.', 30.00),
('Tire Rotation', 'Rotating tires for even wear.', 20.00),
('Brake Inspection', 'Checking the brakes for wear and tear.', 15.00),
('Car Wash', 'Exterior and interior cleaning of the vehicle.', 10.00),
('Battery Check', 'Testing the battery and replacing if necessary.', 25.00);

INSERT INTO requests (client_id, service_id, request_date, employee_id) VALUES
(1, 1, '2024-10-01', 1),
(2, 2, '2024-10-02', 2),
(3, 3, '2024-10-03', 3),
(4, 4, '2024-10-04', 1),
(5, 5, '2024-10-05', 2);

INSERT INTO payments (client_id, amount, service_id, payment_date, comments) VALUES
(1, 30.00, 1, '2024-10-01', 'Paid for oil change.'),
(2, 20.00, 2, '2024-10-02', 'Paid for tire rotation.'),
(3, 15.00, 3, '2024-10-03', 'Paid for brake inspection.'),
(4, 10.00, 4, '2024-10-04', 'Paid for car wash.'),
(5, 25.00, 5, '2024-10-05', 'Paid for battery check.');

INSERT INTO fine_statuses (fine_status_description) VALUES
('Paid'),
('Pending'),
('Disputed'),
('Under Review'),
('Cancelled');

INSERT INTO fines (client_id, vehicle_id, fine_amount, fine_date, fine_reason, fine_status_id) VALUES
(1, 1, 50.00, '2024-09-10', 'Speeding', 1),
(2, 2, 100.00, '2024-09-15', 'Parking Violation', 2),
(3, 3, 75.00, '2024-09-20', 'Running a Red Light', 1),
(4, 1, 200.00, '2024-09-25', 'Expired Registration', 3),
(5, 2, 150.00, '2024-09-30', 'No Insurance', 2);

INSERT INTO inspections (vehicle_id, inspection_date, result, inspected_by) VALUES
(1, '2024-09-01', 'Passed', 1),
(2, '2024-09-05', 'Failed', 2),
(3, '2024-09-10', 'Passed', 3),
(4, '2024-09-15', 'Passed', 1),
(5, '2024-09-20', 'Failed', 2);

INSERT INTO accidents (vehicle_id, accident_date, accident_location, accident_description, involved_vehicles) VALUES
(1, '2024-08-15', 'Main Street', 'Rear-ended another vehicle.', 'Car A, Car B'),
(2, '2024-08-20', '1st Avenue', 'Side collision.', 'Car C, Car D'),
(3, '2024-08-25', '2nd Street', 'Hit a pedestrian.', 'Car E'),
(4, '2024-09-01', '3rd Avenue', 'Single vehicle accident.', 'Car F'),
(5, '2024-09-05', '4th Street', 'Collision with a fence.', 'Car G');

INSERT INTO vehicle_owners_history (vehicle_id, owner_id, ownership_start_date, ownership_end_date) VALUES
(1, 1, '2020-01-01', '2024-01-01'),
(2, 2, '2019-01-01', NULL),
(3, 3, '2018-01-01', '2022-01-01'),
(4, 4, '2021-01-01', NULL),
(5, 5, '2023-05-01', '2024-05-01');

INSERT INTO vehicle_insurances (vehicle_id, insurance_provider, policy_number, coverage_start_date, coverage_end_date, 
premium_amount, vehicle_insurance_status) VALUES
(1, 'Insurance Company A', 'POL123456', '2024-01-01', '2025-01-01', 500.00, 'Active'),
(2, 'Insurance Company B', 'POL654321', '2024-05-01', '2025-05-01', 600.00, 'Active'),
(3, 'Insurance Company C', 'POL789012', '2023-09-01', '2024-09-01', 450.00, 'Expired'),
(4, 'Insurance Company D', 'POL345678', '2024-03-01', '2025-03-01', 550.00, 'Active'),
(5, 'Insurance Company E', 'POL901234', '2024-06-01', '2025-06-01', 700.00, 'Active');
