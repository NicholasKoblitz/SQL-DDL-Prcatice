
DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    speciality TEXT NOT NULL
)

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    diagnosis TEXT[]
);

CREATE TABLE doctor_patients
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_is INTEGER REFERENCES patients
);

CREATE TABLE 
(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL
);