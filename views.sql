USE service_center_mia

--This allows you to quickly retrieve customers along with their vehicle information and list view registration
GO
CREATE VIEW view_clients_with_vehicles AS
SELECT c.id AS client_id, 
       c.first_name, 
       c.last_name, 
       v.model, 
       vb.name AS brand, 
       v.year_of_manufacturing, 
       vr.registration_number
FROM clients c
JOIN vehicles v ON c.id = v.owner_id
JOIN vehicle_brands vb ON v.brand_id = vb.id
JOIN vehicle_registrations vr ON v.registration_id = vr.id;


--This view displays all insurance policies that are still valid at the current time
GO
CREATE VIEW view_active_vehicle_insurances AS
SELECT vi.vehicle_id, 
       v.model, 
       vi.insurance_provider, 
       vi.policy_number, 
       vi.coverage_start_date, 
       vi.coverage_end_date, 
       vi.premium_amount
FROM vehicle_insurances vi
JOIN vehicles v ON vi.vehicle_id = v.id
WHERE vi.coverage_end_date >= GETDATE();

--The view allows you to get a list of active fines with information about customers
GO
CREATE VIEW view_active_fines AS
SELECT f.id AS fine_id, 
       c.first_name, 
       c.last_name, 
       f.fine_amount, 
       f.fine_date, 
       f.fine_reason, 
       fs.fine_status_decription AS status
FROM fines f
JOIN clients c ON f.client_id = c.id
JOIN fine_statuses fs ON f.fine_status_id = fs.id
WHERE fs.fine_status_decription = 'Pending';

--This view makes it easy to access data about service requests and the workers who processed them
GO
CREATE VIEW view_service_requests AS
SELECT r.id AS request_id, 
       c.first_name AS client_name, 
       a.auto_service_name, 
       r.request_date, 
       e.first_name AS employee_name
FROM requests r
JOIN clients c ON r.client_id = c.id
JOIN auto_services a ON r.service_id = a.id
JOIN employees e ON r.employee_id = e.id;


--The view shows information about vehicles involved in accidents and details of the incidents
GO
CREATE VIEW view_vehicle_accidents AS
SELECT a.id AS accident_id, 
       v.model AS vehicle_model, 
       v.year_of_manufacturing, 
       a.accident_date, 
       a.accident_location, 
       a.involved_vehicles
FROM accidents a
JOIN vehicles v ON a.vehicle_id = v.id;

--Executing views
GO
SELECT * FROM view_clients_with_vehicles;
SELECT * FROM view_active_vehicle_insurances;
SELECT * FROM view_active_fines;
SELECT * FROM view_service_requests;
SELECT * FROM view_vehicle_accidents;