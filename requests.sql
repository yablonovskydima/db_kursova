SELECT c.first_name, c.last_name, vr.registration_number, vr.expiration_date
FROM clients c
         JOIN vehicle_registrations vr ON c.id = vr.owner_id
WHERE vr.is_active = 1;

SELECT v.model, v.color, e.first_name AS employee_first_name, e.last_name AS employee_last_name, i.inspection_date, i.result
FROM vehicles v
         JOIN inspections i ON v.id = i.vehicle_id
         JOIN employees e ON i.inspected_by = e.id
WHERE i.inspection_date = '2024-09-01';

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payment
FROM clients c
         JOIN payments p ON c.id = p.client_id
GROUP BY c.id
HAVING SUM(p.amount) > 20;

SELECT v.model, v.color, a.accident_date, a.accident_location, a.accident_description
FROM vehicles v
         JOIN accidents a ON v.id = a.vehicle_id;

SELECT asv.auto_service_name, COUNT(r.id) AS number_of_requests
FROM auto_services asv
         LEFT JOIN requests r ON asv.id = r.service_id
GROUP BY asv.id;