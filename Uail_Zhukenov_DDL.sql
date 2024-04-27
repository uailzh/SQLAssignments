/*==============================================================*/
/* DBMS name:      ORACLE Version 19c                           */
/* Name: Uail Zhukenov
  Assignment number: 2
  Description: The following sql file represents three tables: customer, appointment and instructor */
/*==============================================================*/


create table CUSTOMER (
   CUSTOMER_NUM         NUMBER(10)          
      generated as identity					  not null,
   CUSTOMER_FNAME       VARCHAR2(30)          not null,
   CUSTOMER_LNAME       VARCHAR2(30)          not null,
    customer_dob date not null,
    Customer_age VARCHAR(10) NOT NULL CHECK (Customer_age IN ('16-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70-79', '80-89')),
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(7) NOT NULL,
    Phone_num VARCHAR(11) NOT NULL,
   constraint PK_CUSTOMER primary key (CUSTOMER_NUM));




create table INSTRUCTOR (
   INSTRUCTOR_NUM       NUMBER(10)          
      generated as identity   not null,
   INSTRUCTOR_FNAME     VARCHAR2(20)          not null,
   INSTRUCTOR_LNAME     VARCHAR2(20)          not null,
   constraint PK_INSTRUCTOR primary key (INSTRUCTOR_NUM));



create table APPOINTMENT (
   APPOINTMENT_NO       NUMBER(10)          
      generated as identity		  			  not null,
   INSTRUCTOR_NUM       INTEGER               not null,
   CUSTOMER_NUM         INTEGER               not null,
   APPOINTMENT_START_DATETIME 	timestamp                not null,
   App_Status VARCHAR(15) CHECK (App_Status IN ('confirmed', 'not confirmed')),
   APP_HOURS     integer not null,
   constraint PK_APPOINTMENT primary key (APPOINTMENT_NO),
   CONSTRAINT FK_Appointments_Instructors FOREIGN KEY (Instructor_NUM) REFERENCES Instructor(Instructor_NUM),
   CONSTRAINT FK_Appointments_Customers FOREIGN KEY (Customer_NUM) REFERENCES Customer(Customer_NUM));
