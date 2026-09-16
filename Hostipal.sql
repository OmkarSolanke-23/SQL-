
create database hospital_DB;
use hospital_DB;

CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL,
floor_no INT NOT NULL
);
-- 2. doctors
CREATE TABLE doctors (
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(100) NOT NULL,
specialization VARCHAR(100) NOT NULL,
consultation_fee DECIMAL(10,2) NOT NULL,
department_id INT NOT NULL,
status VARCHAR(20) NOT NULL,
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
);
-- 3. patients
CREATE TABLE patients (
patient_id INT PRIMARY KEY,
patient_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
age INT NOT NULL,
gender VARCHAR(20) NOT NULL,
registration_date DATE NOT NULL
);
-- 4. appointments
CREATE TABLE appointments (
appointment_id INT PRIMARY KEY,
patient_id INT NOT NULL,
doctor_id INT NOT NULL,
appointment_date DATE NOT NULL,
appointment_time TIME NOT NULL,
consultation_type VARCHAR(20) NOT NULL,
status VARCHAR(20) NOT NULL,
FOREIGN KEY (patient_id)
REFERENCES patients(patient_id),
FOREIGN KEY (doctor_id)
REFERENCES doctors(doctor_id)
);
-- 5. bills
CREATE TABLE bills (
bill_id INT PRIMARY KEY,
appointment_id INT NOT NULL,
bill_date DATE NOT NULL,
consultation_charge DECIMAL(10,2) NOT NULL,
test_charge DECIMAL(10,2) NOT NULL,
medicine_charge DECIMAL(10,2) NOT NULL,
total_amount DECIMAL(10,2) NOT NULL,
payment_status VARCHAR(20) NOT NULL,
FOREIGN KEY (appointment_id)
REFERENCES appointments(appointment_id)
);
-- 6. payments
CREATE TABLE payments (
payment_id INT PRIMARY KEY,
bill_id INT NOT NULL,
payment_date DATE NOT NULL,
amount_paid DECIMAL(10,2) NOT NULL,
payment_mode VARCHAR(30) NOT NULL,
FOREIGN KEY (bill_id)
REFERENCES bills(bill_id)
);

INSERT INTO departments
(department_id, department_name, floor_no) VALUES
(1, 'Cardiology', 2),
(2, 'Dermatology', 3),
(3, 'Orthopedic', 4),
(4, 'General Medicine', 1);
-- 2. doctors
INSERT INTO doctors
(doctor_id, doctor_name, specialization,
 consultation_fee, department_id, status) VALUES
(101, 'Dr. Mehta', 'Cardiology', 1200, 1, 'Active'),
(102, 'Dr. Sharma', 'Dermatology', 900, 2, 'Active'),
(103, 'Dr. Patil', 'Orthopedic', 1000, 3, 'Active'),
(104, 'Dr. Kulkarni', 'General Medicine', 700, 4, 'Active'),
(105, 'Dr. Shah', 'Cardiology', 1500, 1, 'Active'),
(106, 'Dr. More', 'Orthopedic', 1100, 3, 'Inactive');
-- 3. patients
INSERT INTO patients
(patient_id, patient_name, city, age, gender, registration_date) VALUES
(201, 'Rahul Patil', 'Pune', 28, 'Male', '2026-01-10'),
(202, 'Priya Sharma', 'Mumbai', 34, 'Female', '2026-02-15'),
(203, 'Amit Joshi', 'Pune', 42, 'Male', '2025-12-20'),
(204, 'Sneha Kulkarni', 'Nashik', 30, 'Female', '2026-03-05'),
(205, 'Raj Mehta', 'Nagpur', 25, 'Male', '2026-04-01'),
(206, 'Anjali More', 'Pune', 38, 'Female', '2026-05-12'),
(207, 'Rohan Deshmukh', 'Mumbai', 45, 'Male', '2026-06-18'),
(208, 'Neha Shah', 'Nashik', 29, 'Female', '2025-11-22');
-- 4. appointments
INSERT INTO appointments
(appointment_id, patient_id, doctor_id, appointment_date,
 appointment_time, consultation_type, status) VALUES
(301, 201, 101, '2026-08-20', '10:30:00', 'Offline', 'Completed'),
(302, 202, 102, '2026-08-22', '11:00:00', 'Online', 'Completed'),
(303, 203, 103, '2025-07-10', '12:15:00', 'Offline', 'Cancelled'),
(304, 204, 101, '2026-09-02', '09:45:00', 'Offline', 'Booked'),
(305, 205, 104, '2026-09-03', '15:00:00', 'Online', 'Pending'),
(306, 206, 105, '2026-08-25', '16:30:00', 'Offline', 'Completed'),
(307, 207, 103, '2026-08-28', '14:00:00', 'Offline', 'Completed'),
(308, 208, 102, '2026-09-04', '13:30:00', 'Online', 'Pending'),
(309, 201, 105, '2026-09-05', '10:00:00', 'Offline', 'Booked'),
(310, 204, 104, '2026-08-30', '11:45:00', 'Offline', 'Completed');

INSERT INTO bills
(bill_id, appointment_id, bill_date, consultation_charge, test_charge, medicine_charge, total_amount, payment_status) VALUES
(401, 301, '2026-08-20', 1200, 3000, 1500, 5700, 'Paid'),
(402, 302, '2026-08-22', 900, 1000, 800, 2700, 'Paid'),
(403, 306, '2026-08-25', 1500, 4500, 2200, 8200, 'Partial'),
(404, 307, '2026-08-28', 1000, 2500, 1200, 4700, 'Paid'),
(405, 310, '2026-08-30', 700, 1200, 900, 2800, 'Pending'),
(406, 304, '2026-09-02', 1200, 0, 0, 1200, 'Pending');
-- 6. payments
INSERT INTO payments
( payment_id, bill_id, payment_date, amount_paid, payment_mode) VALUES
(501, 401, '2026-08-20', 5700, 'UPI'),
(502, 402, '2026-08-22', 2700, 'Card'),
(503, 403, '2026-08-25', 4000, 'UPI'),
(504, 404, '2026-08-28', 4700, 'Cash'),
(505, 403, '2026-08-27', 2000, 'Card');


-- Section A - Basic SQL Operations

-- 1. Display all patients.
      select * from patients;
-- 2. Display all doctors.
      select * from doctors;
-- 3. Display patients from Pune.
       select * from patients
       where city = 'pune';
-- 4. Display doctors whose consultation fee is greater than Rs. 800.
       select * from doctors
       where consultation_fee > 800;
-- 5. Display doctors from the Cardiology specialization.
        select * from doctors
        where specialization ='Cardiology';
-- 6. Display all appointments having status Completed.
           select * from appointments
           where status = 'Completed';
-- 7. Display all appointments having consultation type Online.
        select * from appointments
        where consultation_type = 'Online';
        
-- 8. Display patients whose age is between 25 and 40.
      select * from patients 
      where age between 25 and 40;
-- 9. Display doctors in descending order of consultation fee.
       select * from doctors 
       order by consultation_fee desc;
-- 10. Display the five doctors having the highest consultation fees.

	  select * from doctors 
       order by consultation_fee desc
       limit 5;
         
-- 11. Display patients whose names start with A.

         select * from patients 
         where patient_name like'A%';
-- 12. Display patients from Pune, Mumbai, or Nashik.
      select * from patients
      where city in('Pune', 'Mumbai','Nashik')
      ;
-- 13. Display appointments scheduled after 2026-09-01.
            select * from appointments
            where  appointment_date > '2026-09-01';
-- 14. Display bills where total amount is greater than Rs. 5,000.
        select * from bills
        where total_amount > 5000;
-- 15. Display all payments made using UPI.
   select * from payments 
   where payment_mode ='UPI';
   
   
--    Section B - UPDATE & DELETE Operations
-- 1. Update a patient's city from Pune to Mumbai.
           select * from patients ;
           update patients 
           set 
           city ='mumbai'
           where patient_id ='201';
           
-- 2. Increase consultation fee of all Cardiology doctors by 10%.
             select * from doctors;
             update doctors
             set
               consultation_fee = consultation_fee * 1.10
               where specialization ='Cardiology';
             
-- 3. Change one appointment from Booked to Completed.
           select * from appointments;
           update appointments
           set 
               status ='completed'
		   where appointment_id ='304';
-- 4. Change all Pending appointments older than a given date to Cancelled.
          select * from appointments;
          UPDATE appointments
         SET status = 'Cancelled'
         WHERE status = 'Pending'
           AND appointment_date < '2026-09-01'; 

-- 5. Update one bill's payment status from Pending to Paid.
        select * from bills;
       update bills
       set
       payment_status ='Paid'
       where bill_id ='405';
       
-- 6. Increase medicine charge by Rs. 500 for a selected bill.
	   select * from bills;
	   update bills
       set 
		medicine_charge = medicine_charge + 500
		where bill_id = '402';
-- 7. Recalculate total_amount after updating medicine_charge.
          update bills
          set 
             total_amount = total_amount + medicine_charge
             where bill_id = '401';
-- 8. Change consultation type of a selected appointment from Offline to Online.
        select * from appointments;
        update appointments
        set 
        consultation_type = 'Online'
        where appointment_id ='301';
-- 9. Change one doctor's status from Inactive to Active.
       select * from doctors;
         update doctors
         set 
           status = 'active'
		where doctor_id = '106';
-- 10. Reduce consultation fee of all General Medicine doctors by 5%.
		update doctors
        set 
           consultation_fee = consultation_fee - 1.05
		where doctor_id = '104';
-- 11. Delete one cancelled appointment using appointment_id.
          select * from appointments;
         delete from appointments
         where appointment_id = '303';
-- 12. Delete cancelled appointments older than one year.
           delete from appointments
           where status ='pending' and appointment_date < '2026-09-01';
-- 13. Delete a payment using payment_id.
-- 14. Delete bills having total_amount = 0.
-- 15. Delete patients who have no appointments.


-- Section C - Aggregate Function Reports

-- 1. Find the total number of patients.
        select count(patient_id) 
        from patients;
-- 2. Find the total number of doctors.
      select count(doctor_id)
      from doctors;
-- 3. Find the total number of appointments.
      select count(appointment_id)
      from appointments;
-- 4. Find the total number of completed appointments.
		select status , count(appointment_id)
        from appointments 
        where status = 'Completed';
-- 5. Find the average consultation fee of doctors.
       select avg (consultation_fee )
       from doctors ;
-- 6. Find the highest consultation fee.
       select max(consultation_fee )
       from doctors;
-- 7. Find the lowest consultation fee.
        select min(consultation_fee )
       from doctors;
-- 8. Count patients city-wise.
           select city , count(patient_id)
           from patients
           group by city;
-- 9. Count doctors specialization-wise.
      select specialization , count(doctor_id)
      from doctors
      group by specialization;
      
-- 10. Count appointments status-wise.
         select * from appointments;
        select status , count(appointment_id)
        from appointments
        group by status ; 
-- 11. Count appointments consultation-type-wise.
        
        select consultation_type , count(appointment_id)
        from appointments
        group by consultation_type;
-- 12. Calculate total hospital billing amount.
         select sum(total_amount) 
         from bills;
-- 13. Calculate average bill amount.
     select avg(total_amount) 
         from bills;
-- 14. Calculate total amount collected through each payment mode.
          select * from payments;
		select  payment_mode, sum(payment_id) 
         from payments
         group by payment_mode;
-- 15. Calculate total completed appointments month-wise.
	SELECT MONTH(appointment_date) ,
COUNT(appointment_id) 
FROM appointments
WHERE status = 'Completed'
GROUP BY MONTH(appointment_date);

-- Section D - Relationships, JOINs & Business Reports
-- Use table relationships, JOINs, GROUP BY and HAVING wherever required.
-- 1. Display Patient Name, Appointment Date and Appointment Status using patients and appointments.
	select patients.patient_name,
    appointments.appointment_date,
    appointments.status
	from patients
	inner join appointments
on patients.patient_id = appointments.patient_id;
-- 2. Display Doctor Name, Patient ID, Appointment Date and Status using doctors and appointments.
       select doctors.doctor_name,
              doctors.doctor_id,
              appointments.Appointment_date
	   from doctors
       inner join appointments
       on doctors.doctor_id = appointments.doctor_id;
              
              
-- 3. Display Patient Name, Doctor Name, Specialization, Appointment Date and Status.
        select patients.patient_name,
               doctors.doctor_name,
               doctors.Specialization,
               appointments.Appointment_Date,
               appointments.Status
		from Appointments
        INNER JOIN patients
        ON appointments.patient_id = patients.patient_id
	    inner join doctors
        on appointments.doctor_id = doctors.doctor_id;
    
    
-- 4. Display Doctor Name, Specialization and Department Name
         SELECT 
    doctors.doctor_name,
    doctors.specialization,
    departments.department_name
         from doctors
         left join  departments
         on doctors.department_id = departments.department_id;
-- 5. Display Appointment ID, Bill Date, Total Amount and Payment Status.
         select Appointments.Appointment_id,
                bills.bill_date,
                bills.total_amount,
                bills.payment_status
         from Appointments
        left join bills on
        Appointments.Appointment_id = bills.appointment_id;
        
-- 6. Create a patient billing report showing Patient Name, Appointment date, Total Bill and Payment Status.
        
        select Patients.patient_name,
                Appointments.Appointment_date,
                bills.total_amount,
                bills.payment_status
		from  Appointments
        left join   patients on
        Appointments.patient_id = patients.patient_id
        
         left join bills on
        Appointments.Appointment_id = bills.Appointment_id;
        
-- 7. Create a payment report showing Patient Name, Total Bill, Amount Paid and Payment Mode.
       SELECT 
    patients.patient_name,
    bills.total_amount,
    payments.amount_paid,
    payments.payment_mode
FROM payments
LEFT JOIN patients
    ON patients.patient_id = payments.payment_id
LEFT JOIN bills
    ON payments.bill_id = bills.bill_id;
-- 8. Display doctor-wise appointment count.
      
   select  
          doctors.doctor_name, count(appointments.appointment_id) AS total_appointments
	from doctors
    left join appointments ON
        appointments.doctor_id = doctors.doctor_id
	group by 
         doctors.doctor_id,doctors.doctor_name;
       
            
-- 9. Display department-wise doctor count.
     select 
            departments.department_name , count(doctors.doctor_id) AS total_doctors
	from departments
    left join doctors ON
     departments.department_id = doctors.department_id
	group by 
       departments.department_id, departments.department_name;
     
-- 10. Calculate doctor-wise total billing generated.
        select 
              doctors.doctor_name , sum(bills.total_amount )  as total_bills
		from  doctors 
        inner join appointments ON 
           doctors.doctor_id = appointments.doctor_id
		inner join bills ON 
          appointments.appointment_id = bills.appointment_id
	  GROUP BY doctors.doctor_id, doctors.doctor_name;
-- 11. Calculate department-wise total revenue.
	   select 
               departments.department_name , sum(total_amount) 
		from departments 
		inner join doctors  ON
         departments.department_id = doctors.department_id
		inner join appointments ON 
         appointments.appointment_id = appointments.appointment_id
		inner join bills On 
         appointments.appointment_id = bills.appointment_id
		group by
         departments.department_id , departments.department_name;
-- 12. Display patient-wise total billing.
        select 
				patients.patient_name , sum(total_amount) 
			from patients
		inner join appointments ON 
        appointments.patient_id = patients.patient_id
        inner join bills On 
           appointments.appointment_id = bills.appointment_id
		group by 
            patients.patient_id , patients.patient_name ;
-- 13. Display patients having more than one appointment
          
          select  
                 patients.patient_name , sum(appointments.appointment_id) 
			from patients
		inner join appointments ON
             appointments.patient_id = patients.patient_id
		group by 
           patients.patient_id ,  patients.patient_name
		having  sum(appointments.appointment_id)  > 1;

-- 14. Display doctors having more than 3 completed appointments.
         select 
                  doctors.doctor_name , count(appointments.appointment_id)
		from doctors
        inner join appointments ON
           appointments.doctor_id = doctors.doctor_id
		-- WHERE appointments.status = 'Completed'
        group by 
             doctors.doctor_id, doctors.doctor_name
	   having count(appointments.appointment_id) > 3;
-- 15. Find the doctor who generated the highest total billing amount.
         
	  SELECT 
    doctors.doctor_name,
    SUM(bills.total_amount) AS total_billing
FROM doctors
INNER JOIN appointments
    ON doctors.doctor_id = appointments.doctor_id
INNER JOIN bills
    ON appointments.appointment_id = bills.appointment_id
GROUP BY doctors.doctor_id, doctors.doctor_name
ORDER BY total_billing DESC
LIMIT 1;

           