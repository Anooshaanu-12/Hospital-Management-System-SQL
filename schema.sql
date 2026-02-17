-- ============================================
-- Hospital Management System Database Schema
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;

-- ============================================
-- 1. Departments Table
-- ============================================
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- ============================================
-- 2. Doctors Table
-- ============================================
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) 
        REFERENCES departments(department_id)
        ON DELETE SET NULL
);

-- ============================================
-- 3. Patients Table
-- ============================================
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- ============================================
-- 4. Appointments Table
-- ============================================
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) 
        REFERENCES patients(patient_id)
        ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) 
        REFERENCES doctors(doctor_id)
        ON DELETE SET NULL
);

-- ============================================
-- 5. Rooms Table
-- ============================================
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_type VARCHAR(50),
    price_per_day DECIMAL(10,2),
    availability_status VARCHAR(20)
);

-- ============================================
-- 6. Admissions Table
-- ============================================
CREATE TABLE admissions (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    room_id INT,
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) 
        REFERENCES patients(patient_id)
        ON DELETE CASCADE,
    FOREIGN KEY (room_id) 
        REFERENCES rooms(room_id)
        ON DELETE SET NULL
);

-- ============================================
-- 7. Billing Table
-- ============================================
CREATE TABLE billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(50),
    bill_date DATE,
    FOREIGN KEY (patient_id) 
        REFERENCES patients(patient_id)
        ON DELETE CASCADE
);

-- ============================================
-- Index Optimization
-- ============================================
CREATE INDEX idx_doctor_id ON appointments(doctor_id);
CREATE INDEX idx_patient_id ON appointments(patient_id);

-- ============================================
-- View for Appointment Details
-- ============================================
CREATE VIEW appointment_details AS
SELECT 
    p.name AS patient_name,
    d.name AS doctor_name,
    d.specialization,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;
