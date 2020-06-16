ALTER DATABASE bankdb SET client_min_messages=error;

--- Onetime  -- Using bankdb/postgres login ------------------
DROP OWNED BY bankuserapp CASCADE;
DROP ROLE IF EXISTS bankuserapp;

--create user
CREATE ROLE bankuserapp LOGIN PASSWORD 'bankuserapp' VALID UNTIL 'infinity' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;

--create schema in current database
CREATE SCHEMA bankuserapp AUTHORIZATION bankuserapp;
ALTER ROLE bankuserapp SET search_path to bankuserapp;


-- Using bankdb/bankuserapp login ------------------
CREATE TABLE users (
  username VARCHAR(45) NOT NULL,
  password VARCHAR(45) NULL,
  firstname VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  phone INT NULL,
  PRIMARY KEY (username));
