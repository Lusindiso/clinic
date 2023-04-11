CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) ,
  date_of_birth DATE ,
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP ,
  patient_id INT FOREIGN KEY REFERENCES patients(id),
  status VARCHAR(50),
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(250),
  name VARCHAR(250),
  PRIMARY KEY (id)
);

/* Create medical and treatments join table */
CREATE TABLE medical_treatment_history (
  id SERIAL PRIMARY KEY,
  medical_histories_id INT FOREIGN KEY REFERENCES medical_histories(id),
  treatment_id INT FOREIGN KEY REFERENCES treatments(id),
);

--- CREATE FK INDEXES
CREATE INDEX ON medical_histories(patient_id);

CREATE INDEX ON medical_treatment_history(medical_histories_id);

CREATE INDEX ON medical_treatment_history(treatment_id);
