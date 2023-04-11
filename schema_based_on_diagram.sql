CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) ,
  date_of_birth DATE 
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP ,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(50)
);

CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(250),
  name VARCHAR(250)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP ,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);

/* Create medical and treatments join table */
CREATE TABLE medical_treatment_history (
  id SERIAL PRIMARY KEY,
  medical_histories_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id)
);

--- CREATE FK INDEXES
CREATE INDEX ON medical_histories(patient_id);

CREATE INDEX ON medical_treatment_history(medical_histories_id);

CREATE INDEX ON medical_treatment_history(treatment_id);

CREATE INDEX medical_histories_id_asc ON invoices(medical_history_id);

CREATE INDEX invoice_id_asc ON invoice_items(invoice_id);

CREATE INDEX treatment_id_asc ON invoice_items(treatment_id);