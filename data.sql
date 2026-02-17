-- ============================================
-- Sample Data for Hospital Management System
-- ============================================

USE hospital_management;

-- ======================
-- Insert Departments
-- ======================
INSERT INTO departments (department_name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Medicine');

-- ======================
-- Insert Doctors
-- ======================
INSERT INTO doctors (name, specialization, phone, department_id) VALUES
('Dr. Ravi Kumar', 'Cardiologist', '9876543210', 1),
('Dr. Sneha Reddy', 'Neurologist', '9876543211', 2),
('Dr. Arjun Mehta', 'Orthopedic Surgeon', '9876543212', 3),
('Dr. Priya Sharma', 'Pediatrician', '9876543213', 4),
('Dr. Amit Verma', 'General Physician', '9876543214', 5);

-- ======================
-- Insert Patients
-- ======================
INSERT INTO patients (name, gender, age, phone, address) VALUES
('Rahul Sharma', 'Male', 35, '9123456780', 'Hyderabad'),
('Anjali Singh', 'Female', 28, '9123456781', 'Chennai'),
('Vikram Rao', 'Male', 42, '9123456782', 'Bangalore'),
('Meera Nair', 'Female', 30, '9123456783', 'Mumbai'),
('Karan Patel', 'Male', 50, '9123456784', 'Delhi');

-- ======================
-- Insert Appointments
-- ======================
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-02-10 10:00:00', 'Completed'),
(2, 2, '2025-02-11 11:00:00', 'Scheduled'),
(3, 3, '2025-02-12 09:30:00', 'Completed'),
(4, 4, '2025-02-13 02:00:00', 'Cancelled'),
(5, 5, '2025-02-14 04:00:00', 'Scheduled');

-- ======================
-- Insert Rooms
-- ======================
INSERT INTO rooms (room_type, price_per_day, availability_status) VALUES
('General Ward', 2000.00, 'Available'),
('Semi-Private', 4000.00, 'Occupied'),
('Private Room', 7000.00, 'Available'),
('ICU', 10000.00, 'Occupied');

-- ======================
-- Insert Admissions
-- ======================
INSERT INTO admissions (patient_id, room_id, admission_date, discharge_date) VALUES
(1, 2, '2025-02-01', '2025-02-05'),
(3, 4, '2025-02-03', NULL);

-- ======================
-- Insert Billing
-- ======================
INSERT INTO billing (patient_id, total_amount, payment_status, bill_date) VALUES
(1, 15000.00, 'Paid', '2025-02-05'),
(3, 30000.00, 'Pending', '2025-02-06');
