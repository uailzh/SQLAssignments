/*==============================================================*/
/* DBMS name:      ORACLE Version 19c                           */
/* Name: Uail Zhukenov
  Assignment number: 2
  Description: The following sql file represents three insert statement into tables: customer, appointment and instructor
  It represents how person booked two appointments with same instructor for two hours each. */
/*==============================================================*/


insert into customer (customer_fname, customer_lname, customer_dob, customer_age, street, city, postalcode, phone_num) 
values ('Uail','Zhukenov',TO_DATE('2001-10-12', 'YYYY-MM-DD'),'20-29','698 Battle','Kamloops','V3C 1D5','2507689543');

insert into instructor (instructor_fname, instructor_lname)
values ('Jane','Watt');

INSERT INTO appointment (instructor_num, customer_num, appointment_start_datetime, app_hours, app_status)
VALUES (1, 1, TO_TIMESTAMP('2023-03-21 21:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'confirmed');

INSERT INTO appointment (instructor_num, customer_num, appointment_start_datetime, app_hours, app_status)
VALUES (1, 1, TO_TIMESTAMP('2023-03-21 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'confirmed');