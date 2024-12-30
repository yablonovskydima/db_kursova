

-- -- Shows a list of customers along with details of their vehicles and brands using vehicle_registrations
 SELECT 
     c.id AS client_id, 
     c.first_name, 
     c.last_name, 
     v.model, 
     vb.name AS brand, 
     vr.registration_number
 FROM clients c
 JOIN vehicle_registrations vr ON c.id = vr.owner_id
 JOIN vehicles v ON vr.id = v.registration_id
 JOIN vehicle_brands vb ON v.brand_id = vb.id;


-- --Shows vehicles and insurance policies that expire in the next month
 SELECT vi.vehicle_id, 
        v.model, 
        vi.insurance_provider, 
        vi.policy_number, 
        vi.coverage_end_date
 FROM vehicle_insurances vi
 JOIN vehicles v ON vi.vehicle_id = v.id
 WHERE vi.coverage_end_date BETWEEN GETDATE() AND DATEADD(MONTH, 1, GETDATE());


-- --Shows all active fines along with customers and their statuses
 SELECT f.id AS fine_id, 
        c.first_name, 
        c.last_name, 
        f.fine_amount, 
        f.fine_reason, 
        fs.fine_status_description
 FROM fines f
 JOIN clients c ON f.client_id = c.id
 JOIN fine_statuses fs ON f.fine_status_id = fs.id
 WHERE fs.fine_status_description = 'Pending';

-- --Provides a list of all customer requests for services together with responsible employees
 SELECT r.id AS request_id, 
        c.first_name AS client_name, 
        a.auto_service_name, 
        r.request_date, 
        e.first_name AS employee_name
 FROM requests r
 JOIN clients c ON r.client_id = c.id
 JOIN auto_services a ON r.service_id = a.id
 JOIN employees e ON r.employee_id = e.id;

--Shows vehicles and information about accidents in which they have been involved
SELECT a.id AS accident_id, 
       v.model AS vehicle_model, 
       a.accident_date, 
       a.accident_location, 
       a.involved_vehicles
FROM accidents a
JOIN vehicles v ON a.vehicle_id = v.id;

