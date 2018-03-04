-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-alpha1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.com.br
-- Model Author: ---

-- object: ps_owner | type: ROLE --
-- DROP ROLE IF EXISTS ps_owner;
--CREATE ROLE ps_owner WITH ;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: ps | type: DATABASE --
-- -- DROP DATABASE IF EXISTS ps;
-- CREATE DATABASE ps
-- 	OWNER = ps_owner
-- ;
-- -- ddl-end --
-- 

-- -- object: dwh | type: SCHEMA --
-- -- DROP SCHEMA IF EXISTS dwh CASCADE;
-- CREATE SCHEMA dwh;
-- -- ddl-end --
-- ALTER SCHEMA dwh OWNER TO ps_owner;
-- -- ddl-end --
-- 
SET search_path TO pg_catalog,public,dwh;
-- ddl-end --

-- object: dwh.sq_eqf_response | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_eqf_response CASCADE;
CREATE SEQUENCE dwh.sq_eqf_response
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_eqf_response OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_doc | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_doc CASCADE;
CREATE TABLE dwh.eqf_doc(
	response_id integer NOT NULL,
	doctype varchar(2),
	docno varchar(20),
	docdate varchar(10),
	docenddate varchar(10),
	docplace varchar(255)
);
-- ddl-end --
ALTER TABLE dwh.eqf_doc OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_history_title | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_history_title CASCADE;
CREATE TABLE dwh.eqf_history_title(
	response_id integer,
	date date,
	lastname varchar(50),
	firstname varchar(50),
	middlename varchar(50),
	"doc.doctype" varchar(2),
	"doc.docno" varchar(20),
	"doc.docdate" date,
	"doc.docenddate" date,
	"doc.docplace" varchar(255)
);
-- ddl-end --
ALTER TABLE dwh.eqf_history_title OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_history_addr_reg | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_history_addr_reg CASCADE;
CREATE TABLE dwh.eqf_history_addr_reg(
	response_id integer NOT NULL,
	date date,
	value varchar(500)
);
-- ddl-end --
ALTER TABLE dwh.eqf_history_addr_reg OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_credit | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_credit CASCADE;
CREATE TABLE dwh.eqf_credit(
	response_id integer NOT NULL,
	cred_id varchar(15),
	cred_first_load date,
	cred_owner varchar(1),
	cred_partner_type varchar(10),
	cred_person_num integer,
	cred_person_status varchar(1),
	cred_sum decimal(15,2),
	cred_currency varchar(3),
	cred_date date,
	cred_enddate date,
	cred_sum_payout decimal(15,2),
	cred_date_payout date,
	cred_sum_debt decimal(15,2),
	cred_sum_limit decimal(15,2),
	cred_facility varchar(1),
	delay5 integer,
	delay30 integer,
	delay60 integer,
	delay90 integer,
	delay_more integer,
	cred_sum_overdue decimal(15,2),
	cred_day_overdue integer,
	cred_max_overdue decimal(15,2),
	cred_prolong varchar(15),
	cred_enddate_fact varchar(10),
	cred_collateral varchar(1),
	cred_update date,
	cred_type varchar(2),
	cred_active varchar(1),
	cred_active_date date,
	cred_sum_type varchar(1)
);
-- ddl-end --
ALTER TABLE dwh.eqf_credit OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_addr_request | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_addr_request CASCADE;
CREATE TABLE dwh.eqf_addr_request(
	response_id integer NOT NULL,
	type varchar(4),
	date date,
	value varchar(500)
);
-- ddl-end --
ALTER TABLE dwh.eqf_addr_request OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_phone | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_phone CASCADE;
CREATE TABLE dwh.eqf_phone(
	response_id integer NOT NULL,
	type varchar(10),
	date date,
	value varchar(20)
);
-- ddl-end --
ALTER TABLE dwh.eqf_phone OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_court | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_court CASCADE;
CREATE TABLE dwh.eqf_court(
	response_id integer,
	cred_id varchar(15),
	info varchar(1500)
);
-- ddl-end --
ALTER TABLE dwh.eqf_court OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_official | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_official CASCADE;
CREATE TABLE dwh.eqf_official(
	response_id integer,
	cred_id varchar(15),
	info varchar(1500)
);
-- ddl-end --
ALTER TABLE dwh.eqf_official OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_bankruptcy | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_bankruptcy CASCADE;
CREATE TABLE dwh.eqf_bankruptcy(
	response_id integer,
	cred_id varchar(15),
	info varchar(1500)
);
-- ddl-end --
ALTER TABLE dwh.eqf_bankruptcy OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_info_request | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_info_request CASCADE;
CREATE TABLE dwh.eqf_info_request(
	response_id integer NOT NULL,
	request_reason varchar(20),
	timeslot varchar(20),
	cred_type varchar(2),
	cred_currency varchar(3),
	cred_sum varchar(20),
	cred_duration varchar(20),
	cred_partner_type varchar(10)
);
-- ddl-end --
ALTER TABLE dwh.eqf_info_request OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_scoring | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_scoring CASCADE;
CREATE TABLE dwh.eqf_scoring(
	response_id integer,
	scor_id varchar(20),
	scor_card_id varchar(15),
	scor_name varchar(255),
	score integer,
	scor_error varchar(15),
	scor_error_text varchar(255),
	scor_reason varchar(3)
);
-- ddl-end --
ALTER TABLE dwh.eqf_scoring OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_check | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_check CASCADE;
CREATE TABLE dwh.eqf_check(
	response_id integer,
	element varchar(50)
);
-- ddl-end --
ALTER TABLE dwh.eqf_check OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_history_addr_fact | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_history_addr_fact CASCADE;
CREATE TABLE dwh.eqf_history_addr_fact(
	response_id integer NOT NULL,
	date date,
	value varchar(500)
);
-- ddl-end --
ALTER TABLE dwh.eqf_history_addr_fact OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.eqf_response | type: TABLE --
-- DROP TABLE IF EXISTS dwh.eqf_response CASCADE;
CREATE TABLE dwh.eqf_response(
	response_id integer NOT NULL DEFAULT nextval('dwh.sq_eqf_response'::regclass),
	application_id integer NOT NULL,
	version varchar(3),
	partnerid varchar(3),
	datetime timestamp,
	num varchar(15),
	dateofreport date,
	report_type varchar(15),
	responsecode varchar(3),
	responsestring varchar(255),
	"title_part.private.lastname" varchar(50),
	"title_part.private.firstname" varchar(50),
	"title_part.private.middlename" varchar(50),
	"title_part.private.birthday" date,
	"title_part.private.birthplace" varchar(255),
	"title_part.private.inn" varchar(12),
	"title_part.private.pfno" varchar(11),
	"title_part.private.driverno" varchar(10),
	"title_part.private.medical" varchar(10),
	"base_part.addr_reg" varchar(500),
	"base_part.addr_fact" varchar(500),
	"base_part.pboul.pboul_no" varchar(15),
	"base_part.pboul.pboul_date" date,
	"base_part.pboul.pboul_place" varchar(255),
	"add_part.interest.hour" integer,
	"add_part.interest.day" integer,
	"add_part.interest.week" integer,
	"add_part.interest.month" integer,
	"add_part.interest.quarter" integer,
	"add_part.interest.year" integer,
	"add_part.own_interest.hour" integer,
	"add_part.own_interest.day" integer,
	"add_part.own_interest.week" integer,
	"add_part.own_interest.month" integer,
	"add_part.own_interest.quarter" integer,
	"add_part.own_interest.year" integer,
	attrs jsonb,
	CONSTRAINT pk_eqf_response PRIMARY KEY (response_id)

);
-- ddl-end --
ALTER TABLE dwh.eqf_response OWNER TO ps_owner;
-- ddl-end --

-- object: fk_eqf_doc___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_doc DROP CONSTRAINT IF EXISTS fk_eqf_doc___eqf_response CASCADE;
ALTER TABLE dwh.eqf_doc ADD CONSTRAINT fk_eqf_doc___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_history_title___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_history_title DROP CONSTRAINT IF EXISTS fk_eqf_history_title___eqf_response CASCADE;
ALTER TABLE dwh.eqf_history_title ADD CONSTRAINT fk_eqf_history_title___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_history_addr___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_history_addr_reg DROP CONSTRAINT IF EXISTS fk_eqf_history_addr___eqf_response CASCADE;
ALTER TABLE dwh.eqf_history_addr_reg ADD CONSTRAINT fk_eqf_history_addr___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_credit___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_credit DROP CONSTRAINT IF EXISTS fk_eqf_credit___eqf_response CASCADE;
ALTER TABLE dwh.eqf_credit ADD CONSTRAINT fk_eqf_credit___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_addr_request___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_addr_request DROP CONSTRAINT IF EXISTS fk_eqf_addr_request___eqf_response CASCADE;
ALTER TABLE dwh.eqf_addr_request ADD CONSTRAINT fk_eqf_addr_request___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_phone___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_phone DROP CONSTRAINT IF EXISTS fk_eqf_phone___eqf_response CASCADE;
ALTER TABLE dwh.eqf_phone ADD CONSTRAINT fk_eqf_phone___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_court___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_court DROP CONSTRAINT IF EXISTS fk_eqf_court___eqf_response CASCADE;
ALTER TABLE dwh.eqf_court ADD CONSTRAINT fk_eqf_court___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_official___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_official DROP CONSTRAINT IF EXISTS fk_eqf_official___eqf_response CASCADE;
ALTER TABLE dwh.eqf_official ADD CONSTRAINT fk_eqf_official___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_bankruptcy___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_bankruptcy DROP CONSTRAINT IF EXISTS fk_eqf_bankruptcy___eqf_response CASCADE;
ALTER TABLE dwh.eqf_bankruptcy ADD CONSTRAINT fk_eqf_bankruptcy___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_info_request | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_info_request DROP CONSTRAINT IF EXISTS fk_eqf_info_request CASCADE;
ALTER TABLE dwh.eqf_info_request ADD CONSTRAINT fk_eqf_info_request FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_scoring___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_scoring DROP CONSTRAINT IF EXISTS fk_eqf_scoring___eqf_response CASCADE;
ALTER TABLE dwh.eqf_scoring ADD CONSTRAINT fk_eqf_scoring___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_check___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_check DROP CONSTRAINT IF EXISTS fk_eqf_check___eqf_response CASCADE;
ALTER TABLE dwh.eqf_check ADD CONSTRAINT fk_eqf_check___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_eqf_history_addr___eqf_response | type: CONSTRAINT --
-- ALTER TABLE dwh.eqf_history_addr_fact DROP CONSTRAINT IF EXISTS fk_eqf_history_addr___eqf_response CASCADE;
ALTER TABLE dwh.eqf_history_addr_fact ADD CONSTRAINT fk_eqf_history_addr___eqf_response FOREIGN KEY (response_id)
REFERENCES dwh.eqf_response (response_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


