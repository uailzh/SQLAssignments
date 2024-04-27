/*==============================================================*/
/* DBMS name:      ORACLE Version 19c                           */
/* Name: Uail Zhukenov
  Assignment number: 2
  Description: The following sql file represents the function calc_age which gives range of age,
  based on date of birth and date of appointment. */
/*==============================================================*/


CREATE OR REPLACE FUNCTION CALC_AGE(
  customer_dob IN DATE,
  appointment_start_datetime IN DATE
) RETURN VARCHAR2
IS
  v_years NUMBER;
  v_months NUMBER;
BEGIN
  -- Calculate the difference between the dates in years and months
  v_years := TRUNC(MONTHS_BETWEEN(appointment_start_datetime, customer_dob) / 12);
  v_months := MOD(MONTHS_BETWEEN(appointment_start_datetime, customer_dob), 12);

  -- Determine the appropriate age range based on the number of years
  IF v_years < 20 THEN
    RETURN '16-19';
  ELSIF v_years < 30 THEN
    RETURN '20-29';
  ELSIF v_years < 40 THEN
    RETURN '30-39';
  ELSIF v_years < 50 THEN
    RETURN '40-49';
  ELSIF v_years < 60 THEN
    RETURN '50-59';
  ELSIF v_years < 70 THEN
    RETURN '60-69';
ELSIF v_years < 80 THEN
    RETURN '70-79';
  ELSE
    RETURN '80-89';
  END IF;
END;


SELECT CALC_AGE(TO_DATE('2001-10-12', 'YYYY-MM-DD'), TO_DATE('2023-03-21 11:25:00', 'YYYY-MM-DD HH24:MI:SS'))
 AS AGE_RANGE FROM DUAL;