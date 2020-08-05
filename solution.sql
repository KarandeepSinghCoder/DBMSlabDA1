-- Questions 3. Add some attributes with few tables and justify the additions.

alter table Doctor add year_of_passing number(10);
alter table Doctor add no_of_awards number(10);
alter table Staff add date_of_joining date;
alter table patient add back_history varchar2(50);

-- Find the details of all doctors
select * from Doctor; 
-- Display all the hospital bill details.
select * from HOSP_BILL; 
-- List the doctors who are specialized in ‘Cardiology’ and ‘Neurology’
select * from Doctor where specialist='CARDIOLOGIST' or specialist='NEUROLOGIST'; 
-- Display all the test types that have the values in the range of 25 and 75.
select * from test_types where low_val>25 and high_val<75;
-- Find the diagnosis details of the patient with prescription id ‘PR0001’.
select * from prescription where pres_id='PR0001';
-- Display the name of the patients whose gender is female or the contact number
-- is 9878987890.
select * from patient where ptgender='F' or ptcontact=9878987890;
-- Find the staff name and staff id who are not working in the department ‘D102’
select staff_id,staff_name from Staff where dept_nos!='D102';
-- Find the patients who are admitted on ’20-AUG-2019’ in the bed 1.
select * from in_patient where doa='20-AUG-2019' AND bed_no=1;
-- Delete the test results that are ‘Positive’
Delete from test_res where result='Positive';
 -- Change the HOD of cardiology department with doctor ‘D0003’
 update Department set hod = 'D0003' where dept_name='CARDIOLOGY';
 	-- Delete the prescribed medicines records that have the brand name ‘MEDIMIND’
 	delete from pres_medi where brand='MEDIMIND';
-- Modify the low value and high value to 10 and 30 respectively for the clinical
-- test ‘urine’
update test_types set low_val='10' where des='URINE_TEST';
update test_types set high_val='30' where des='URINE TEST';
-- Update the contact number of all staffs who are in the category ‘Nurse’
update Staff set ctct=9090262977 where catgory='NURSE';
-- Delete the staff records that have designations ‘WARD BOY'’ or ‘technician’
-- and belongs to the department ‘DP0005’
Delete from Staff 
where DEPT_NOS='D190' AND (DESIGNATION='junior attender' OR DESIGNATION='technician') 