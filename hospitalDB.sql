-- Queries to create 


Create table Doctor (
doc_id varchar2(20) constraint docid primary key,
doc_name varchar2(30),
gender varchar2(10),
dob date,
specialist varchar2(25),
qualification varchar2(15),
Contact number(20),
Address varchar2(50)
);

create table Department(
dept_no varchar2(20) constraint deptno primary key,
dept_name varchar2(30),
room_no varchar2(10),
floor number(15),
hod varchar2(20),
constraint hod_con foreign key(hod) references Doctor(doc_id),
estd_date date
);

create table Staff(
staff_id varchar2(15) constraint stfid primary key,
staff_name varchar2(25),
catgory varchar2(20),
designation varchar2(15),
db date,
ctct number(20),
addre varchar2(50),
dept_nos varchar2(15),
constraint dep_ns foreign key(dept_nos) references Department(dept_no)
);

create table patient(
pat_id varchar2(20) constraint patid primary key,
pat_name varchar2(30),
ptdob date,
ptgender varchar2(10),
ptcontact number(20),
ptadress varchar2(50));

create table in_patient(
pat_idd varchar2(20) constraint patidd primary key,
doa date,
bed_no number(25),
start_time date,
end_time date);

create table appointment(
app_id varchar2(20) constraint appid primary key,
pat_iddd varchar2(20),
constraint patiddd foreign key(pat_iddd) references patient(pat_id),
doc_idd varchar2(20),
constraint docidd foreign key(doc_idd) references Doctor(doc_id),
nurs_idd varchar2(20),
constraint nursdd foreign key(nurs_idd) references Staff(staff_id)
);

create table prescription(
pres_id varchar2(20) constraint presid primary key,
app_idd varchar2(20),
constraint appidd foreign key(app_idd) references appointment(app_id),
datepres date,
diagnosis varchar2(20)
);


create table in_patient_pres(
pat_idddd varchar2(20) constraint patidddd primary key,
pres_idd varchar2(20),
constraint presidd foreign key(pres_idd) references prescription(pres_id)
);

create table pres_medi(
pres_iddd varchar2(25) constraint presiddd primary key,
medi_name varchar2(40),
dosage varchar2(20),
brand varchar2(10)
);


create table hosp_bill(
in_no number(15),
in_date date,
pat_iddddd varchar2(20),
constraint patiddddd foreign key(pat_iddddd) references patient(pat_id),
bill_am number(25),
pay_type varchar2(25),
discount number(20)
);

create table lab_test(
test_id varchar2(20) constraint testid primary key,
pat_idddddd varchar2(20),
constraint patidddddd foreign key(pat_idddddd) references patient(pat_id),
date_lab date
);

create table test_types(
tt_id varchar2(20) constraint ttid primary key,
des varchar2(30),
low_val number(25),
high_val number(25),
test_met varchar2(25),
technician varchar2(20),
constraint techy foreign key(technician) references Staff(staff_id)
);


create table test_res(
test_idd varchar2(20) constraint testidd primary key,
tt_idd varchar2(20),
constraint ttidd foreign key(tt_idd) references test_types(tt_id)
);

-- insertion queries

insert into Doctor values('D0001','DR.HARJEET SINGH','M','25-NOVEMBER-1974','CARDIOLOGIST','MBBS',9421895591,'530,ROURKELA');
insert into Department values('DP0001','CARDIOLOGY','N-508',7,'D0001','24-JULY-2016');
insert into Staff values('S0001','HARMAN','NURSE','STAFF NURSE','18-DEC-2000',9421862561,'ROURKELA','DP0001');
insert into patient values('P0001','PRIYANSHU','18-DECEMBER-2000','M',9421895591,'521,ROURKELA');
insert into in_patient values('P0001','20-AUGUST-2019',1,'20-AUGUST 2019','30-AUGUST 2019');
insert into appointment values('A0001','P0001','D0001','S0001');
insert into prescription values('PR0001','A0001','21-AUGUST 2019','CARDIAC ARREST');
insert into in_patient_pres values('P0001','PR0001');
insert into pres_medi values('PR0001','REMDESIVIR','TWICE A DAY','MEDIMIND');
insert into hosp_bill values(1,'30-AUGUST 2019','P0001',1,'CARD',10);
insert into lab_test values('T0001','P0001','31-AUGUST 2019');
insert into test_types values('TT0001','URINE TEST',1.2,2.2,'LAB','S0001');
insert into test_res values('T0001','TT0001');
insert into Doctor values('D0001','DR.HARJEET SINGH','M','25-NOVEMBER-1974','CARDIOLOGIST','MBBS',9421895591,'530,ROURKELA');
insert into Department values('DP0001','CARDIOLOGY','N-508',7,'D0001','24-JULY-2016');
insert into Staff values('S0001','HARMAN','NURSE','STAFF NURSE','18-DEC-2000',9421862561,'ROURKELA','DP0001');
insert into patient values('P0001','PRIYANSHU','18-DECEMBER-2000','M',9421895591,'521,ROURKELA');
insert into in_patient values('P0001','20-AUGUST-2019',1,'20-AUGUST 2019','30-AUGUST 2019');
insert into appointment values('A0001','P0001','D0001','S0001');
insert into prescription values('PR0001','A0001','21-AUGUST 2019','CARDIAC ARREST');
insert into in_patient_pres values('P0001','PR0001');
insert into pres_medi values('PR0001','REMDESIVIR','TWICE A DAY','MEDIMIND');
insert into hosp_bill values(1,'30-AUGUST 2019','P0001',1,'CARD',10);
insert into lab_test values('T0001','P0001','31-AUGUST 2019');
insert into test_types values('TT0001','URINE TEST',1.2,2.2,'LAB','S0001');
insert into test_res values('T0001','TT0001');

insert into Doctor values('D0002','DR.DAVINDER KAUR','F','14-APRIL-1976','NEUROLOGIST','BAMS',8999004656,'530,ROURKELA');
insert into Department values('DP0002','NEUROLOGY','N-509',7,'D0002','24-JULY-2018');
insert into Staff values('S0002','ARTI','NURSE','STAFF DOCTOR','17-SEPTEMBER 2017',9721765571,'RAIPUR','DP0002');
insert into patient values('P0002','ROHAN GAUR','11-OCTOBER-2014','F',7841454511,'127,JAMSHEDPUR');
insert into in_patient values('P0002','20-AUGUST-2002',1,'20-FEBRUARY 2019','30-DECEMBER 2009');
insert into appointment values('A0002','P0002','D0002','S0002');
insert into prescription values('PR0002','A0001','20-AUGUST 2002','NEURAL ATTACK');
insert into in_patient_pres values('P0002','PR0002');
insert into pres_medi values('PR0002','CYCLOPHAM','ONCE A DAY','MEDICLAV');
insert into hosp_bill values(1,'30-AUGUST 2009','P0002',2,'CASH',15);
insert into lab_test values('T0002','P0002','31-AUGUST 2009');
insert into test_types values('TT0002','CT',10.8,25.28,'LAB','S0002');
insert into test_res values('T0002','TT0002');

insert into Doctor values('D0003','DR.AKSHET SINGH ','F','21-JULY-1925','NEPHROLOGIST','MD',976124512,'451,RANCHI');
insert into Department values('DP0003','CARDIOLOGY','F-721',7,'D0003','24-JULY-2016');
insert into Staff values('S0003','RAHUL GANDHI','NURSE','STAFF NURSE','18-DEC-2000',9421862561,'ROURKELA','DP0003');
insert into patient values('P0003','AMIT SHAH','18-DECEMBER-2003','M',9751254454,'521,JAMSHEDPUR');
insert into in_patient values('P0003','20-AUGUST-2019',1,'20-AUGUST 2019','30-AUGUST 2019');
insert into appointment values('A0003','P0003','D0003','S0003');
insert into prescription values('PR0003','A0003','21-AUGUST 2019','CARDIAC ARREST');
insert into in_patient_pres values('P0003','PR0003');
insert into pres_medi values('PR0003','SPORLAC','ONCE A DAY','CIPLA');
insert into hosp_bill values(1,'30-AUGUST 2019','P0003',3,'CARD',10);
insert into lab_test values('T0003','P0003','31-AUGUST 2019');
insert into test_types values('TT0003','URINE TEST',17.2,22.225,'LAB','S0003');
insert into test_res values('T0003','TT0003');

insert into Doctor values('D0004','DR.RESHAM KAUR ','M','01-APRIL-2000','ONCOLOGIST','MD',9464154512,'9512,DELHI');
insert into Department values('DP0004','ONCOLOGY','MB-918',9,'D0004','24-JULY-2019');
insert into Staff values('S0004','MADHURI','NURSE','STAFF NURSE','15-JULY 1998',978945121,'BOMBAY','DP0004');
insert into patient values('P0004','KAMLESH ROUT','21-JUNE-1995','M',944587122,'651,BHOPAL');
insert into in_patient values('P0004','18-AUGUST-2009',4,'18-AUGUST 1992','30-AUGUST 2009');
insert into appointment values('A0004','P0004','D0004','S0004');
insert into prescription values('PR0004','A0004','21-AUGUST 2019','ACCIDENT');
insert into in_patient_pres values('P0004','PR0004');
insert into pres_medi values('PR0004','RESPIRA','THRICE A DAY','MANKIND');
insert into hosp_bill values(1,'30-DECEMBER 2009','P0004',4,'CASH',25);
insert into lab_test values('T0004','P0004','31-AUGUST 2019');
insert into test_types values('TT0004','XRAY TEST',35.2,37.5,'LAB','S0001');
insert into test_res values('T0004','TT0004');

insert into Doctor values('D0005','DR.KOMAL KAUR ','M','21-NOVEMBER-2001','GENERAL MEDICINE','MD',9624412484,'1028,BENGALURU');
insert into Department values('DP0005','GM','G-512',15,'D0005','18-JULY-2001');
insert into Staff values('S0005',’RAHUL RAMAN ','WARD BOY','WARD BOY','18-DEC-2000',978951124,'HOSUR','DP0005');
insert into patient values('P0005','REETVINDER KAUR','11-DECEMBER-2014','M',9451212145,'152,HUBLI');
insert into in_patient values('P0005','20-AUGUST-2019',1,'20-AUGUST 2009','30-AUGUST 2019');
insert into appointment values('A0005','P0005','D0005','S0005');
insert into prescription values('PR0005','A0005','21-AUGUST 2019','CARDIAC ARREST');
insert into in_patient_pres values('P0005','PR0005');
insert into pres_medi values('PR0005','CEFIXIZE','TWICE A DAY','CIPLA');
insert into hosp_bill values(5,'30-AUGUST 2019','P0005',5,'CARD',30);
insert into lab_test values('T0005','P0005','31-JANUARY 2004');
insert into test_types values('TT0005','CT TEST',0.02,1.2,'LAB','S0005');
insert into test_res values('T0005','TT0005');

insert into Doctor values('D0006','DR.DHEERAJ RAJ','M','25-FEBRUARY-2001','CARDIOLOGIST','MBBS',941545451,'530,CKP');
insert into Department values('DP0006','CARDIOLOGY','N-508',7,'D0001','24-JULY-2016');
insert into Staff values('S0006','SUSHMITA','NURSE','STAFF NURSE','18-DECEMBER 2002',9421862561,'SUNDARGH','DP0006');
insert into patient values('P0006','KULVINDER SINGH','21-MARCH-1989','M',944548412,'1026,SUNDARGH');
insert into in_patient values('P0006','20-AUGUST-2019',1,'20-AUGUST 2019','30-AUGUST 2019');
insert into appointment values('A0006','P0006','D0006','S0006');
insert into prescription values('PR0006','A0006','21-AUGUST 2019','COUGH');
insert into in_patient_pres values('P0006','PR0006');
insert into pres_medi values('PR0006','TAZAR','ONCE A DAY','MANKIND');
insert into hosp_bill values(6,'30-AUGUST 2019','P0006',6,'CASH',25);
insert into lab_test values('T0006','P0006','31-AUGUST 2019');
insert into test_types values('TT0006','URINE TEST',1.2,2.2,'LAB','S0001');
insert into test_res values('T0006','TT0006');

insert into Doctor values('D0007','DR.MAHAVIR SHAVANI ','F','25-FEBRUARY-2002','NEPHROLOGIST','MDS',9781454451,'170,MUZZAFARNAGAR');
insert into Department values('DP0007','NEPHROLOGY','H-451',15,'D0007','24-JULY-2020');
insert into Staff values('S0007','KYLE','NURSE','STAFF NURSE','18-JUNE 1992',9450154461,'DELHI','DP0007');
insert into patient values('P0007','TANYA JOSHI','21-MARCH-1989','F',9785458412,'1028,DELHI');
insert into in_patient values('P0007','20-AUGUST-2012',1,'17-JANUARY 2019','21-AUGUST 2019');
insert into appointment values('A0007','P0007','D0007','S0007');
insert into prescription values('PR0007','A0007','20-AUGUST 2019','COUGH');
insert into in_patient_pres values('P0007','PR0007');
insert into pres_medi values('PR0007','AZITHROMYCIN','THRICE A DAY','MEDIMIND');
insert into hosp_bill values(7,'30-AUGUST 2019','P0007',7,'CASH',17);
insert into lab_test values('T0007','P0007','31-AUGUST 2020');
insert into test_types values('TT0007','XRAY',1.2,28.5,'LAB','S0007');
insert into test_res values('T0007','TT0007');

insert into Doctor values('D0008','DR.KARANDEEP SINGH','M','25-FEBRUARY-2001','GENERAL MEDICINE','MD',975141254,'127,ROURKELA');
insert into Department values('DP0008','GM','N-508',7,'D0008','21-DECEMBER 2001');
insert into Staff values('S0008','ARTI','NURSE','STAFF NURSE','18-AUGUST 2001',9787862561,'KOTA','DP0008');
insert into patient values('P0008','ARTIS','21-MARCH-1989','M',944548412,'1026,DELHI');
insert into in_patient values('P0008','20-AUGUST-2019',1,'20-AUGUST 2019','17-AUGUST 2001');
insert into appointment values('A0008','P0008','D0008','S0008');
insert into prescription values('PR0008','A0008','21-AUGUST 2019','BILATERAL PNEUMONIA');
insert into in_patient_pres values('P0008','PR0008');
insert into pres_medi values('PR0008','REMDESIVIR','TWICE A DAY','BHARAT');
insert into hosp_bill values(8,'30-AUGUST 2019','P0008',8,'CARD',15);
insert into lab_test values('T0008','P0008','31-AUGUST 2019');
insert into test_types values('TT0008','XRAY',0.2,2.2,'LAB','S0008');
insert into test_res values('T0008','TT0008');

insert into Doctor values('D0009','DR.SHRUTI HASAN','F','25-FEBRUARY-2001','CARDIOLOGIST','MD',9781545451,'1035,RANCHI');
insert into Department values('DP0009','CARDIOLOGY','A-512',19,'D0009','24-JULY-2016');
insert into Staff values('S0009','GARGI NAUTELA','NURSE','STAFF NURSE','18-DECEMBER 2002',9421862561,'PALGHAR','DP0009');
insert into patient values('P0009','SANKALP','21-MARCH-1989','M',944548412,'1026,SUNDARGH');
insert into in_patient values('P0009','20-AUGUST-2019',1,'20-AUGUST 2019','30-AUGUST 2019');
insert into appointment values('A0009','P0009','D0009','S0009');
insert into prescription values('PR0009','A0009','21-AUGUST 2019','COUGH');
insert into in_patient_pres values('P0009','PR0009');
insert into pres_medi values('PR0009','TAZAR','ONCE A DAY','MANKIND');
insert into hosp_bill values(9,'30-AUGUST 2019','P0009',6,'CASH',25);
insert into lab_test values('T0009','P0009','31-AUGUST 2019');
insert into test_types values('TT0009','URINE TEST',1.2,2.2,'LAB','S0009');
insert into test_res values('T0009','TT0009');

insert into Doctor values('D00010','DR.RAMAN KUMAR ','M','25-FEBRUARY-2001','DIABETOLOGIST','MBBS',9415454451,'712,DELHI');
insert into Department values('DP00010','DIABETOLOGY','M-158',15,'D00010','24-JULY-2016');
insert into Staff values('S00010','ARUN KUMAR','RMO','STAFF RMO','18-DECEMBER 2002',97454121561,'GURGAON','DP00010');
insert into patient values('P00010','JAYDEV','12-MARCH-1989','M',8912115452,'1026,GURGAON');
insert into in_patient values('P00010','20-AUGUST-2019',1,'20-AUGUST 2019','30-AUGUST 2019');
insert into appointment values('A00010','P00010','D00010','S00010');
insert into prescription values('PR00010','A00010','21-AUGUST 2019','COUGH');
insert into in_patient_pres values('P00010','PR00010');
insert into pres_medi values('PR00010','TAZAR','TWICE A DAY','MANKIND');
insert into hosp_bill values(10,'30-AUGUST 2019','P00010',10,'CASH',25);
insert into lab_test values('T00010','P00010','31-AUGUST 2019');
insert into test_types values('TT00010','XRAY',1.2,2.2,'LAB','S00010');
insert into test_res values('T00010','TT00010'); 
