-- ******************************************************************
-- Names: Ricky (Jatinder) Badyal, Wen Jiang
-- ID: 020028098,119838167
-- Date: 04/08/2019
-- Purpose: Submission for Group Assignment 2 for DBS301SAB
-- Description: This file includes several SQL scripts that
--              demonstrate the ability to retrieve data from a
--              relational database.
-- ***************************************************************




-- Clearing pool of tables
Prompt **** DROPPING EXISTING POOL OF TABLES ...

DROP TABLE school;
DROP TABLE agency;
DROP TABLE area;
DROP TABLE advertisements;
DROP TABLE outlet;
DROP TABLE referral;
DROP TABLE client;
DROP TABLE location;
DROP TABLE sales;
DROP TABLE properties; 

-- Create school table
Prompt **** CREATING SCHOOL TABLE ...

CREATE TABLE school (
  school_id INT,
  area_id INT,
  school_name VARCHAR2(40),
  school_type VARCHAR(10),
  CONSTRAINT tblschool_pk PRIMARY KEY (school_id),
  CONSTRAINT tblschool_fk FOREIGN KEY(area_id) REFERENCES area(area_id)
);

CREATE UNIQUE INDEX area_fk_idx ON school (area_id);

-- Create agency table
Prompt **** CREATING AGENCY TABLE ...

CREATE TABLE AGENCY (
  agency_id INT,
  agency_name VARCHAR2(40),
  agency_phone VARCHAR2(20),
  CONSTRAINT tblagency_pk PRIMARY KEY (agency_id)
);

-- Create area table
Prompt **** CREATING AREA TABLE ...

CREATE TABLE area (
  area_id INT,
  area_name VARCHAR2(40),
  area_comments VARCHAR2(200),
  CONSTRAINT tblarea_pk PRIMARY KEY (area_id)
);

-- Create advertisements table
Prompt **** CREATING ADVERTISEMENTS TABLE ...

CREATE TABLE advertisements (
  ad_id INT,
  outlet_id INT,
  property_id INT,
  ad_type VARCHAR2(20),
  date_placed DATE,
  ad_cost NUMBER(8,2),
  CONSTRAINT tbladvertisements_pk PRIMARY KEY (ad_id)
);

CREATE UNIQUE INDEX advertisements_fk_idx ON advertisements (outlet_id, property_id);

-- Create outlet table
Prompt **** CREATING OUTLET TABLE ...

CREATE TABLE outlet (
  outlet_id INT,
  outlet_name VARCHAR2(40),
  outlet_phone VARCHAR2(20),
  CONSTRAINT tbloutlet_pk PRIMARY KEY (outlet_id)
);

-- Create referral table
Prompt **** CREATING REFERRAL TABLE ...

CREATE TABLE referral (
  referral_id INT,
  referral_fee NUMBER(8,2),
  CONSTRAINT tblreferral_pk PRIMARY KEY (referral_id)
);

-- Create client table
Prompt **** CREATING CLIENT TABLE ...

CREATE TABLE client (
  client_id INT,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  contact_number VARCHAR2(20),
  type_contact_num VARCHAR2(10),
  email_address VARCHAR2(254),
  status VARCHAR2(10),
  ownership_pct NUMBER(3,2),
  CONSTRAINT tblclient_pk PRIMARY KEY (client_id)
);

-- Create location table
Prompt **** CREATING LOCATION TABLE ...

CREATE TABLE location (
  location_id INT,
  street_address VARCHAR2(40),
  city VARCHAR2(30),
  province VARCHAR2(25),
  postal_code VARCHAR2(12),
  country VARCHAR2(40),
  CONSTRAINT tbllocation_pk PRIMARY KEY (location_id)
);

-- Create sales table
Prompt **** CREATING SALES TABLE ...

CREATE TABLE sales (
  sale_id INT,
  client_id INT,
  property_id INT,
  referral_id INT,
  date_sold DATE,
  price_sold NUMBER(8,2),
  CONSTRAINT tblsales_pk PRIMARY KEY (sale_id)
);

CREATE UNIQUE INDEX sales_fk_idx ON sales (client_id, referral_id, property_id);

-- Create properties table
Prompt **** CREATING PROPERTIES TABLE ...

CREATE TABLE properties (
  property_id INT,
  client_id INT,
  location_id INT,
  agency_id INT,
  area_id INT,
  property_type VARCHAR2(10),
  bedroom_num INT,
  bathroom_num INT,
  square_feet INT,
  listing_price NUMBER(8,2),
  land_size VARCHAR2(20),
  maintenance_fee NUMBER(8,2),
  year_built INT,
  parking_type VARCHAR2(20),
  CONSTRAINT tblproperties_pk PRIMARY KEY (property_id)
);

CREATE UNIQUE INDEX properties_fk_idx ON properties (client_id, agency_id, area_id, location_id);




