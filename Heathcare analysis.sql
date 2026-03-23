use hospital_management;
Select * from patients;

SELECT patient_id, first_name, last_name, registration_date
FROM patients
ORDER BY registration_date DESC
LIMIT 5;

SELECT 
    contact_number,
    COUNT(*) AS patient_count
FROM patients
GROUP BY contact_number
HAVING COUNT(*) > 1;


-- insurance provider has the highest number of patients
select  insurance_provider , COUNT(*) AS patient_count FROM patients
GROUP BY insurance_provider
order by patient_count desc;

SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS registration_month,
    COUNT(*) AS total_patients_registered
FROM patients
GROUP BY registration_month
ORDER BY registration_month;


-- What is the age of each patient?
SELECT 
    patient_id,
    first_name,
    last_name,
    date_of_birth,
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
FROM patients;

SELECT 
    CASE 
        WHEN registration_date < '2022-01-01' THEN 'Before 2022'
        ELSE '2022 and After'
    END AS registration_period,
    
    COUNT(*) AS total_patients
FROM patients
GROUP BY registration_period;


select insurance_provider,gender, count(patient_id) as total_patient from patients
group by insurance_provider, gender order by insurance_provider, gender;


SELECT 
    insurance_provider,
    SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_patients,
    SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_patients
FROM patients
GROUP BY insurance_provider;

SELECT COUNT(*) AS recent_patients
FROM patients
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

Select * from doctors;

select DISTINCT(specialization) from doctors;

SELECT CONCAT(first_name,' ',last_name) as Full_Name , years_experience FROM DOCTORS 
order by years_experience DESC;

select first_name from doctors where first_name like "%is";

SELECT count(*),status from appointments group by status having count(*) > 50;

SELECT * 
FROM appointments
WHERE appointment_date >=( SELECT max(appointment_date) - INTERVAL 7 DAY from appointments) order by appointment_date desc;

SELECT * FROM APPOINTMENTS;

-- date wise count of status
select appointment_date, status, count(*) 
from appointments 
group by appointment_date , status
order by appointment_date desc;

select * from treatments;

select treatment_type, count(*) as treatment_count from treatments group by treatment_type order by treatment_count desc;

select Min(cost),Max(cost), Round(Avg(cost),1) from treatments;

select * from billing;

SELECT
  CASE
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 18 AND 35 THEN 'adult'
    WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 36 AND 55 THEN 'senior aged'
    ELSE '56+'
END AS age_group,
COUNT(*) AS patient_count
FROM patients
GROUP BY age_group
ORDER BY age_group;
Select * from patients;
-- email doamin commonly used by patients 
select substring_index(email,'@',-1) as email_domain,
COUNT(*) AS patient_count
from patients
group by email_domain;


SELECT * FROM APPOINTMENTS;
SELECT * FROM DOCTORS;