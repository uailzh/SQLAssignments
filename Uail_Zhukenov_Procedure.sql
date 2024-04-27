/*==============================================================*/
/* DBMS name:      ORACLE Version 19c                           */
/* Name: Uail Zhukenov
  Assignment number: 2
  Description: The following sql file represents the procedure list_appointments which
   gives info about appointment based on instructor and month provided.
   */
/*==============================================================*/


CREATE OR REPLACE PROCEDURE LIST_APPOINTMENTS(
  instructor_nums IN INTEGER,
  month IN INTEGER
)
IS
  CURSOR appointment_cur IS
    SELECT 
      instructor.instructor_num, 
      instructor.instructor_fname || ' ' || instructor.instructor_lname,
      TO_CHAR(appointment.appointment_start_datetime AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS"Z"'),
      customer.customer_num, 
      customer.customer_fname || ' ' || customer.customer_lname,
      CALC_AGE(customer.customer_dob, appointment.appointment_start_datetime),
      appointment.app_hours
    FROM appointment 
    INNER JOIN instructor  ON appointment.instructor_num = instructor.instructor_num
    INNER JOIN customer  ON appointment.customer_num = customer.customer_num
    WHERE 
      instructor.instructor_num = instructor_nums AND
      EXTRACT(MONTH FROM appointment.appointment_start_datetime) = month
    ORDER BY appointment.appointment_start_datetime ASC;
  
  v_instructor_num   appointment.instructor_num%TYPE;
  v_instructor_name  VARCHAR2(50);
  v_start_datetime   VARCHAR2(30);
  v_customer_num     appointment.customer_num%TYPE;
  v_customer_name    VARCHAR2(50);
  v_customer_age_range  customer.customer_age%TYPE;
  v_appointment_hours   appointment.app_hours%TYPE;
BEGIN
  OPEN appointment_cur;
  
  LOOP
    FETCH appointment_cur INTO 
      v_instructor_num, 
      v_instructor_name,
      v_start_datetime,
      v_customer_num,
      v_customer_name,
      v_customer_age_range,
      v_appointment_hours;
    
    EXIT WHEN appointment_cur%NOTFOUND;
    
    -- Print the results
    DBMS_OUTPUT.PUT_LINE('Instructor ID: ' || v_instructor_num);
    DBMS_OUTPUT.PUT_LINE('Instructor name: ' || v_instructor_name);
    DBMS_OUTPUT.PUT_LINE('Start datetime: ' || v_start_datetime);
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_num);
    DBMS_OUTPUT.PUT_LINE('Customer name: ' || v_customer_name);
    DBMS_OUTPUT.PUT_LINE('Customer age range: ' || v_customer_age_range);
    DBMS_OUTPUT.PUT_LINE('Appointment hours: ' || v_appointment_hours);
    DBMS_OUTPUT.PUT_LINE('-----------------------');
  END LOOP;
  
  CLOSE appointment_cur;
  
END;


/*testing */

BEGIN
  LIST_APPOINTMENTS(1, 3);
END;