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
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'en_US.utf8'
-- 	LC_CTYPE = 'en_US.utf8'
-- 	TABLESPACE = pg_default
-- 	OWNER = ps_owner
-- ;
-- -- ddl-end --
-- 

-- -- object: dwh | type: SCHEMA --
-- -- DROP SCHEMA IF EXISTS dwh CASCADE;
-- CREATE SCHEMA dwh;
-- -- ddl-end --
-- ALTER SCHEMA dwh OWNER TO postgres;
-- -- ddl-end --
-- 
SET search_path TO pg_catalog,public,dwh;
-- ddl-end --

-- object: dwh.sq_okb_root | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_root CASCADE;
CREATE SEQUENCE dwh.sq_okb_root
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_root OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_summary | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_summary CASCADE;
CREATE TABLE dwh.okb_summary(
	root_id integer NOT NULL,
	caisdistribution1 integer,
	caisdistribution2 integer,
	caisdistribution3 integer,
	caisdistribution4 integer,
	caisdistribution5 integer,
	caisdistribution5plus integer,
	caisrecordsguarantor integer,
	caisrecordsguarantorrecip integer,
	caisrecordsjoint integer,
	caisrecordsjointrecip integer,
	caisrecordsowner integer,
	caisrecordsownerrecip integer,
	caisrecordsreferee integer,
	caisrecordsrefereerecip integer,
	capsdistribution1 integer,
	capsdistribution2 integer,
	capsdistribution3 integer,
	capsdistribution4 integer,
	capsdistribution5 integer,
	capsdistribution5plus integer,
	capslast12monthsguarantor integer,
	capslast12monthsjoint integer,
	capslast12monthsowner integer,
	capslast12monthsreferee integer,
	capslast3monthsguarantor integer,
	capslast3monthsjoint integer,
	capslast3monthsowner integer,
	capslast3monthsreferee integer,
	capslast6monthsguarantor integer,
	capslast6monthsjoint integer,
	capslast6monthsowner integer,
	capslast6monthsreferee integer,
	capsrecordsguarantor integer,
	capsrecordsguarantorbeforefilter integer,
	capsrecordsjoint integer,
	capsrecordsjointbeforefilter integer,
	capsrecordsowner integer,
	capsrecordsownerfilter integer,
	capsrecordsreferee integer,
	capsrecordsrefereefilter integer,
	checkother1 character varying(1),
	checkother2 character varying(1),
	checkother3 character varying(1),
	checkother4 character varying(1),
	checkother5 character varying(1),
	checkother6 character varying(1),
	checkother7 character varying(1),
	checkother8 character varying(1),
	checkother9 character varying(1),
	checkother10 character varying(1),
	checkother11 character varying(1),
	checkother12 character varying(1),
	checkother13 character varying(1),
	checkother14 character varying(1),
	checkother15 character varying(1),
	checkother16 character varying(1),
	checkother17 character varying(1),
	checkother18 character varying(1),
	checkother19 character varying(1),
	checkother20 character varying(1),
	consumerenquirycountlast12month integer,
	potentialmonthlyinstalmentsallbutowner integer,
	potentialmonthlyinstalmentsowner integer,
	potentialoutstandingbalanceallbutowner integer,
	potentialoutstandingbalanceowner integer,
	totalmonthlyinstalmentsallbutowner integer,
	totalmonthlyinstalmentsowner integer,
	totaloutstandingbalanceallbutowner integer,
	totaloutstandingbalanceowner integer,
	worstcurrentpaystatusguarantor character varying(1),
	worstcurrentpaystatusjoint character varying(1),
	worstcurrentpaystatusowner character varying(1),
	worstcurrentpaystatusreferee character varying(1),
	worsteverpaystatusguarantor character varying(1),
	worsteverpaystatusjoint character varying(1),
	worsteverpaystatusowner character varying(1),
	worsteverpaystatusreferee character varying(1)
);
-- ddl-end --
ALTER TABLE dwh.okb_summary OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_warnings | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_warnings CASCADE;
CREATE TABLE dwh.okb_warnings(
	root_id integer NOT NULL,
	value text
);
-- ddl-end --
ALTER TABLE dwh.okb_warnings OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_cais | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_cais CASCADE;
CREATE SEQUENCE dwh.sq_okb_cais
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_cais OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_monthlyhistory | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_monthlyhistory CASCADE;
CREATE TABLE dwh.okb_cais_monthlyhistory(
	cais_id integer NOT NULL,
	historydate timestamp,
	accountpaymenthistory character varying(1),
	accountbalance integer,
	arrearsbalance integer,
	instalment integer,
	creditlimit integer,
	paymentsource character varying(2)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_monthlyhistory OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_cais_consumer | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_cais_consumer CASCADE;
CREATE SEQUENCE dwh.sq_okb_cais_consumer
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_cais_consumer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_employer | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_employer CASCADE;
CREATE TABLE dwh.okb_cais_consumer_employer(
	cais_consumer_id integer NOT NULL,
	name character varying(150),
	idnumber character varying(20),
	currentpreviousindicator character varying(1),
	startdate timestamp,
	enddate timestamp,
	flatnbr character varying(6),
	housenbr character varying(6),
	buildingnbr character varying(6),
	line1 character varying(20),
	line2 character varying(50),
	line3 character varying(50),
	line4 character varying(100),
	regioncode character varying(2),
	postcode character varying(10),
	country character varying(2),
	telephonenumber character varying(16)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_employer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_address | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_address CASCADE;
CREATE TABLE dwh.okb_cais_consumer_address(
	cais_consumer_id integer NOT NULL,
	type character varying(1),
	addresscurrprev character varying(1),
	flatnbr character varying(6),
	housenbr character varying(6),
	buildingnbr character varying(6),
	line1 character varying(20),
	line2 character varying(50),
	line3 character varying(50),
	line4 character varying(100),
	regioncode character varying(2),
	postcode character varying(10),
	country character varying(2),
	startdate timestamp,
	enddate timestamp,
	hometelnbr character varying(16)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_address OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_legal | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_legal CASCADE;
CREATE TABLE dwh.okb_cais_consumer_legal(
	cais_consumer_id integer NOT NULL,
	courtjudgementorder character varying(60),
	courtname character varying(200),
	dateofjudgement timestamp,
	judgementtype character varying(2),
	resolution character varying(2000),
	amountofrecovery integer,
	currency character varying(3)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_legal OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_cais_consumer_warranty | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_cais_consumer_warranty CASCADE;
CREATE SEQUENCE dwh.sq_okb_cais_consumer_warranty
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_cais_consumer_warranty OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_warranty_history | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_warranty_history CASCADE;
CREATE TABLE dwh.okb_cais_consumer_warranty_history(
	cais_consumer_warranty_id integer NOT NULL,
	acctotaloutstandingbalance integer,
	warrantyoutstandingbalance integer,
	warrantyinstalmentamount integer,
	historydate timestamp,
	warrantypaymenthistorystatus character varying(1),
	warrantyarrearsbalance integer
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_warranty_history OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_lien | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_lien CASCADE;
CREATE TABLE dwh.okb_cais_lien(
	cais_id integer NOT NULL,
	lienagreementnumber character varying(40),
	lieneename character varying(150),
	collateralid character varying(40),
	collateralidtype character varying(2),
	collateralname character varying(2),
	collateraladdress character varying(200),
	collateralestimatedvalue integer,
	collateralcurrency character varying(3),
	collateralestimatedate timestamp,
	lienagreementopendate timestamp,
	lienagreementduedate timestamp,
	liencloseddate timestamp,
	collateralstartdate timestamp,
	collateralenddate timestamp,
	lienreasonforclosure character varying(2),
	liencomments character varying(150)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_lien OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_assignee | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_assignee CASCADE;
CREATE TABLE dwh.okb_cais_assignee(
	cais_id integer NOT NULL,
	assdate timestamp,
	asscomment character varying(2000)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_assignee OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_guarantee | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_guarantee CASCADE;
CREATE TABLE dwh.okb_cais_guarantee(
	cais_id integer NOT NULL,
	guaragreementnumber character varying(40),
	guarantorname character varying(150),
	guarcoveredamount integer,
	guarcoveredamountcurrency character varying(3),
	guaramount integer,
	guaramountcurrency character varying(3),
	guaropendate timestamp,
	guarduedate timestamp,
	guarclosedate timestamp,
	guarreasonforclosure character varying(2)
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_guarantee OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_guar | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_guar CASCADE;
CREATE SEQUENCE dwh.sq_okb_guar
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_guar OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_guar_consumer | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_guar_consumer CASCADE;
CREATE SEQUENCE dwh.sq_okb_guar_consumer
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_guar_consumer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_guar_consumer_address | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_guar_consumer_address CASCADE;
CREATE TABLE dwh.okb_guar_consumer_address(
	guar_consumer_id integer NOT NULL,
	type character varying(1),
	addresscurrprev character varying(1),
	flatnbr character varying(6),
	housenbr character varying(6),
	buildingnbr character varying(6),
	line1 character varying(20),
	line2 character varying(50),
	line3 character varying(50),
	line4 character varying(100),
	regioncode character varying(2),
	postcode character varying(10),
	country character varying(2),
	startdate timestamp,
	enddate timestamp,
	hometelnbr character varying(16)
);
-- ddl-end --
ALTER TABLE dwh.okb_guar_consumer_address OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_nameidhistory | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_nameidhistory CASCADE;
CREATE TABLE dwh.okb_nameidhistory(
	root_id integer NOT NULL,
	idchangesource character varying(2),
	idchangedate timestamp,
	idtype character varying(2),
	idnbr character varying(20),
	idissuedate timestamp,
	idplaceofissue character varying(30),
	idauthority character varying(100),
	idexpirydate timestamp,
	idstatus character varying(2),
	pensionnbr character varying(20),
	surname character varying(150),
	name1 character varying(100),
	name2 character varying(100),
	dateofbirth timestamp,
	placeofbirth character varying(100),
	sex character varying(1),
	judgementtype character varying(2),
	newidnbr character varying(20),
	comments character varying(2000)
);
-- ddl-end --
ALTER TABLE dwh.okb_nameidhistory OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_caps | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_caps CASCADE;
CREATE SEQUENCE dwh.sq_okb_caps
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_caps OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_decision | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_decision CASCADE;
CREATE TABLE dwh.okb_caps_decision(
	caps_id integer NOT NULL,
	streamid character varying(20),
	typeofdecision character varying(2),
	dateofdecision timestamp,
	decisionenddate timestamp,
	decisionreason character varying(2),
	decisionamount character varying(15),
	currency character varying(3),
	comments character varying(256)
);
-- ddl-end --
ALTER TABLE dwh.okb_caps_decision OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_okb_caps_consumer | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_okb_caps_consumer CASCADE;
CREATE SEQUENCE dwh.sq_okb_caps_consumer
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_okb_caps_consumer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_consumer_employer | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_consumer_employer CASCADE;
CREATE TABLE dwh.okb_caps_consumer_employer(
	caps_consumer_id integer NOT NULL,
	name character varying(150),
	idnumber character varying(20),
	currentpreviousindicator character varying(1),
	startdate timestamp,
	enddate timestamp,
	timewithemployer character varying(3),
	flatnbr character varying(6),
	housenbr character varying(6),
	buildingnbr character varying(6),
	line1 character varying(20),
	line2 character varying(50),
	line3 character varying(50),
	line4 character varying(100),
	regioncode character varying(2),
	postcode character varying(10),
	country character varying(2),
	worktelnbr character varying(16),
	workmobiletelnbr character varying(16)
);
-- ddl-end --
ALTER TABLE dwh.okb_caps_consumer_employer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_consumer_address | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_consumer_address CASCADE;
CREATE TABLE dwh.okb_caps_consumer_address(
	caps_consumer_id integer NOT NULL,
	addresstype character varying(1),
	addressflag character varying(1),
	flatnbr character varying(6),
	housenbr character varying(6),
	buildingnbr character varying(6),
	line1 character varying(20),
	line2 character varying(50),
	line3 character varying(50),
	line4 character varying(100),
	regioncode character varying(2),
	postcode character varying(10),
	country character varying(2),
	startdate timestamp,
	enddate timestamp,
	timeataddress character varying(3),
	hometelnbr character varying(16)
);
-- ddl-end --
ALTER TABLE dwh.okb_caps_consumer_address OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_consumer_verification | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_consumer_verification CASCADE;
CREATE TABLE dwh.okb_caps_consumer_verification(
	caps_consumer_id integer NOT NULL,
	status character varying(20)
);
-- ddl-end --
ALTER TABLE dwh.okb_caps_consumer_verification OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_root | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_root CASCADE;
CREATE TABLE dwh.okb_root(
	root_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_root'::regclass),
	application_id integer NOT NULL,
	responsedate timestamp,
	errorcode integer,
	streamid integer,
	"pvs.status" varchar(20),
	CONSTRAINT okb_root_pk PRIMARY KEY (root_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_root OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais CASCADE;
CREATE TABLE dwh.okb_cais(
	cais_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_cais'::regclass),
	root_id integer NOT NULL,
	accountclass character varying(1),
	consumeraccountnumber character varying(40),
	opendate timestamp,
	numofapplicants integer,
	currency character varying(3),
	financetype character varying(2),
	purposeoffinance character varying(2),
	amountoffinance integer,
	creditlimit integer,
	duration integer,
	durationunit character varying(2),
	instalment integer,
	paymentfrequency character varying(2),
	typeofsecurity character varying(1),
	insuredloan character varying(1),
	amountinsuredloan integer,
	interestrate decimal(4,3),
	creditfacilitystatus character varying(1),
	accountpaymentstatus character varying(1),
	outstandingbalance integer,
	arrearsbalance integer,
	fulfilmentduedate timestamp,
	lastpaymentdate timestamp,
	accountcloseddate timestamp,
	defaultdate timestamp,
	litigationdate timestamp,
	writeoffdate timestamp,
	reasonforclosure character varying(2),
	accountspecialstatus character varying(2),
	lastmissedpaymentdate timestamp,
	recordblockdisputeindicator character varying(1),
	dateaccountadded timestamp,
	lastupdatets timestamp,
	monthoflastupdate timestamp,
	subscribercomments character varying(250),
	accountholdercomments character varying(150),
	worstpaymentstatus character varying(1),
	totalamountoffinance character varying(15),
	securedamount character varying(15),
	securitystartdate timestamp,
	securityenddate timestamp,
	interestpaymentdate timestamp,
	sourceofpayment character varying(2),
	applicationnumber character varying(40),
	infopartflag character varying(1),
	cbrfinancetype character varying(3),
	legalaccountnumber character varying(80),
	totalcostoffinanceinpercent decimal(4,3),
	CONSTRAINT okb_cais_pk PRIMARY KEY (cais_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_cais OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer CASCADE;
CREATE TABLE dwh.okb_cais_consumer(
	cais_consumer_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_cais_consumer'::regclass),
	cais_id integer NOT NULL,
	accountholdertype character varying(2),
	title character varying(2),
	name1 character varying(100),
	name2 character varying(100),
	name3 text,
	surname character varying(150),
	primaryidtype character varying(2),
	primaryid character varying(20),
	primaryidissuedate timestamp,
	primaryidplaceofissue character varying(30),
	primaryidexpiry timestamp,
	primaryidauthority character varying(100),
	secondaryidtype character varying(2),
	secondaryid character varying(20),
	secondaryidissuedate timestamp,
	secondaryidplaceofissue character varying(30),
	secondaryidexpiry timestamp,
	secondaryidauthority character varying(100),
	pensionnbr character varying(20),
	privateentrepreneurnbr character varying(20),
	privateentrepreneurnbrissuedate timestamp,
	privateentrepreneuregrn character varying(20),
	previouspassportnbr character varying(20),
	aliasname character varying(100),
	previouscompanyname character varying(100),
	sex character varying(1),
	dateofbirth timestamp,
	placeofbirth character varying(100),
	nationality character varying(2),
	consentflag character varying(1),
	dateconsentgiven timestamp,
	mobiletelnbr character varying(16),
	CONSTRAINT okb_cais_consumer_pk PRIMARY KEY (cais_consumer_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_warranty | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_warranty CASCADE;
CREATE TABLE dwh.okb_cais_consumer_warranty(
	cais_consumer_warranty_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_cais_consumer_warranty'::regclass),
	cais_consumer_id integer NOT NULL,
	warrantyagreementnumber character varying(40),
	accfinancetype character varying(2),
	acccbrfinancetype character varying(2),
	acccurrency character varying(3),
	accamountoffinance integer,
	acctotalamountoffinance integer,
	acctotaloutstandingbalance integer,
	warrantymonthoflastupdate timestamp,
	warrantylastupdatets timestamp,
	warrantyamount integer,
	warrantyopendate timestamp,
	warrantyduedate timestamp,
	warrantyclaimdate timestamp,
	warrantycreditlimit integer,
	datewarrantyadded timestamp,
	warrantyoutstandingbalance integer,
	warrantyinstalmentamount integer,
	warrantyinstalmentdate timestamp,
	warrantypaymentstatus character varying(1),
	warrantyarrearsbalance integer,
	warrantyclosedate timestamp,
	warrantyreasonforclosure character varying(2),
	legalwarrantyagreementnumber character varying(80),
	subscribercomments character varying(250),
	CONSTRAINT okb_cais_consumer_warranty_pk PRIMARY KEY (cais_consumer_warranty_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_warranty OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_guar | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_guar CASCADE;
CREATE TABLE dwh.okb_guar(
	guar_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_guar'::regclass),
	root_id integer NOT NULL,
	guaragreementnumber character varying(40),
	guarantorname character varying(150),
	guarcoveredamount integer,
	guarcoveredamountcurrency character varying(3),
	guaramount integer,
	guaramountcurrency character varying(3),
	guaropendate timestamp,
	guarduedate timestamp,
	guarclosedate timestamp,
	guarreasonforclosure character varying(2),
	guarnumofholders integer,
	guardateadded timestamp,
	guarlastupdatets timestamp,
	monthoflastupdate timestamp,
	CONSTRAINT okb_guar_pk PRIMARY KEY (guar_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_guar OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_guar_consumer | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_guar_consumer CASCADE;
CREATE TABLE dwh.okb_guar_consumer(
	guar_consumer_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_guar_consumer'::regclass),
	guar_id integer NOT NULL,
	accountholdertype character varying(2),
	title character varying(2),
	name1 character varying(100),
	name2 character varying(100),
	surname character varying(150),
	primaryidtype character varying(2),
	primaryid character varying(20),
	primaryidissuedate timestamp,
	primaryidplaceofissue character varying(30),
	primaryidexpiry timestamp,
	primaryidauthority character varying(100),
	secondaryidtype character varying(2),
	secondaryid character varying(20),
	secondaryidissuedate timestamp,
	secondaryidplaceofissue character varying(30),
	secondaryidexpiry timestamp,
	secondaryidauthority character varying(100),
	pensionnbr character varying(20),
	privateentrepreneurnbr character varying(20),
	privateentrepreneurnbrissuedate timestamp,
	privateentrepreneuregrn character varying(20),
	previouspassportnbr character varying(20),
	aliasname character varying(100),
	previouscompanyname character varying(100),
	sex character varying(1),
	dateofbirth timestamp,
	placeofbirth character varying(100),
	nationality character varying(2),
	consentflag character varying(1),
	dateconsentgiven timestamp,
	mobiletelnbr character varying(16),
	CONSTRAINT okb_guar_consumer_pk PRIMARY KEY (guar_consumer_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_guar_consumer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps CASCADE;
CREATE TABLE dwh.okb_caps(
	caps_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_caps'::regclass),
	root_id integer NOT NULL,
	accountclass character varying(1),
	streamid character varying(20),
	reason character varying(2),
	enquirydate timestamp,
	nbrofapplicants integer,
	purposeoffinance character varying(2),
	applicationnumber character varying(30),
	applicationdate timestamp,
	financetype character varying(2),
	currency character varying(3),
	creditlimit integer,
	amountoffinance integer,
	initialdepositamount integer,
	finalpaymentamount integer,
	duration integer,
	durationunits character varying(2),
	instalmentamount integer,
	paymentfrequency character varying(2),
	typeofsecurity character varying(1),
	disputeindicator character varying(1),
	comments character varying(150),
	applicationchannel character varying(2),
	cbrfinancetype character varying(2),
	CONSTRAINT okb_caps_pk PRIMARY KEY (caps_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_caps OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_consumer | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_consumer CASCADE;
CREATE TABLE dwh.okb_caps_consumer(
	caps_consumer_id integer NOT NULL DEFAULT nextval('dwh.sq_okb_caps_consumer'::regclass),
	caps_id integer NOT NULL,
	applicanttype character varying(2),
	title character varying(2),
	name1 character varying(100),
	name2 character varying(100),
	name3 text,
	surname character varying(150),
	dateofbirth timestamp,
	placeofbirth character varying(100),
	aliasname character varying(40),
	previouscompanyname character varying(40),
	sex character varying(1),
	nationality character varying(2),
	consentflag character varying(1),
	dateconsentgiven timestamp,
	primaryidtype character varying(2),
	primaryid character varying(20),
	primaryidexpiry timestamp,
	primaryidissuedate timestamp,
	primaryidissueplace character varying(30),
	primaryidauthority character varying(100),
	secondaryidtype character varying(2),
	secondaryid character varying(20),
	secondaryidexpiry timestamp,
	secondaryidissuedate timestamp,
	secondaryidissueplace character varying(30),
	secondaryidauthority character varying(100),
	drivinglicensenbr character varying(10),
	medicalnbr character varying(25),
	pensionnbr character varying(20),
	privateentrepreneurnbr character varying(20),
	privateentrepreneurnbrissuedate timestamp,
	privateentrepreneuregrn character varying(20),
	previouspassportnbr character varying(20),
	primaryincome integer,
	primaryincomefreq character varying(1),
	primaryincomeflag character varying(1),
	otherincome integer,
	residentialstatus character varying(1),
	occupation character varying(2),
	occupationstatus character varying(2),
	maritalstatus character varying(2),
	numberofdependants integer,
	education character varying(1),
	mobiletelnbr character varying(16),
	mobileregistration character varying(1),
	visaccheld character varying(1),
	mastercardccheld character varying(1),
	dinersccheld character varying(1),
	amexpressccheld character varying(1),
	jcbccheld character varying(1),
	debitccheld character varying(1),
	chqgteeccheld character varying(1),
	retailccheld character varying(1),
	otherccheld character varying(1),
	CONSTRAINT okb_caps_consumer_pk PRIMARY KEY (caps_consumer_id)

);
-- ddl-end --
ALTER TABLE dwh.okb_caps_consumer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_validationerrors | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_validationerrors CASCADE;
CREATE TABLE dwh.okb_validationerrors(
	root_id integer NOT NULL,
	number integer,
	field character varying(24),
	path text,
	value text,
	extra1 text,
	extra2 text
);
-- ddl-end --
ALTER TABLE dwh.okb_validationerrors OWNER TO ps_owner;
-- ddl-end --

-- object: fk_okb_summary___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_summary DROP CONSTRAINT IF EXISTS fk_okb_summary___okb_root CASCADE;
ALTER TABLE dwh.okb_summary ADD CONSTRAINT fk_okb_summary___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_warnings___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_warnings DROP CONSTRAINT IF EXISTS fk_okb_warnings___okb_root CASCADE;
ALTER TABLE dwh.okb_warnings ADD CONSTRAINT fk_okb_warnings___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_monthlyhistory___okb_cais | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_monthlyhistory DROP CONSTRAINT IF EXISTS fk_okb_cais_monthlyhistory___okb_cais CASCADE;
ALTER TABLE dwh.okb_cais_monthlyhistory ADD CONSTRAINT fk_okb_cais_monthlyhistory___okb_cais FOREIGN KEY (cais_id)
REFERENCES dwh.okb_cais (cais_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_consumer_employer___okb_cais_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_consumer_employer DROP CONSTRAINT IF EXISTS fk_okb_cais_consumer_employer___okb_cais_consumer CASCADE;
ALTER TABLE dwh.okb_cais_consumer_employer ADD CONSTRAINT fk_okb_cais_consumer_employer___okb_cais_consumer FOREIGN KEY (cais_consumer_id)
REFERENCES dwh.okb_cais_consumer (cais_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_consumer_address___okb_cais_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_consumer_address DROP CONSTRAINT IF EXISTS fk_okb_cais_consumer_address___okb_cais_consumer CASCADE;
ALTER TABLE dwh.okb_cais_consumer_address ADD CONSTRAINT fk_okb_cais_consumer_address___okb_cais_consumer FOREIGN KEY (cais_consumer_id)
REFERENCES dwh.okb_cais_consumer (cais_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_consumer_legal___okb_cais_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_consumer_legal DROP CONSTRAINT IF EXISTS fk_okb_cais_consumer_legal___okb_cais_consumer CASCADE;
ALTER TABLE dwh.okb_cais_consumer_legal ADD CONSTRAINT fk_okb_cais_consumer_legal___okb_cais_consumer FOREIGN KEY (cais_consumer_id)
REFERENCES dwh.okb_cais_consumer (cais_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_consumer_warranty_history___okb_cais_consumer_warr | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_consumer_warranty_history DROP CONSTRAINT IF EXISTS fk_okb_cais_consumer_warranty_history___okb_cais_consumer_warr CASCADE;
ALTER TABLE dwh.okb_cais_consumer_warranty_history ADD CONSTRAINT fk_okb_cais_consumer_warranty_history___okb_cais_consumer_warr FOREIGN KEY (cais_consumer_warranty_id)
REFERENCES dwh.okb_cais_consumer_warranty (cais_consumer_warranty_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_lien___okb_cais | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_lien DROP CONSTRAINT IF EXISTS fk_okb_cais_lien___okb_cais CASCADE;
ALTER TABLE dwh.okb_cais_lien ADD CONSTRAINT fk_okb_cais_lien___okb_cais FOREIGN KEY (cais_id)
REFERENCES dwh.okb_cais (cais_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_assignee___okb_cais | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_assignee DROP CONSTRAINT IF EXISTS fk_okb_cais_assignee___okb_cais CASCADE;
ALTER TABLE dwh.okb_cais_assignee ADD CONSTRAINT fk_okb_cais_assignee___okb_cais FOREIGN KEY (cais_id)
REFERENCES dwh.okb_cais (cais_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_guarantee___okb_cais | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_guarantee DROP CONSTRAINT IF EXISTS fk_okb_cais_guarantee___okb_cais CASCADE;
ALTER TABLE dwh.okb_cais_guarantee ADD CONSTRAINT fk_okb_cais_guarantee___okb_cais FOREIGN KEY (cais_id)
REFERENCES dwh.okb_cais (cais_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_guar_consumer_address___okb_guar_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_guar_consumer_address DROP CONSTRAINT IF EXISTS fk_okb_guar_consumer_address___okb_guar_consumer CASCADE;
ALTER TABLE dwh.okb_guar_consumer_address ADD CONSTRAINT fk_okb_guar_consumer_address___okb_guar_consumer FOREIGN KEY (guar_consumer_id)
REFERENCES dwh.okb_guar_consumer (guar_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_nameidhistory___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_nameidhistory DROP CONSTRAINT IF EXISTS fk_okb_nameidhistory___okb_root CASCADE;
ALTER TABLE dwh.okb_nameidhistory ADD CONSTRAINT fk_okb_nameidhistory___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_caps_decision___okb_caps | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_caps_decision DROP CONSTRAINT IF EXISTS fk_okb_caps_decision___okb_caps CASCADE;
ALTER TABLE dwh.okb_caps_decision ADD CONSTRAINT fk_okb_caps_decision___okb_caps FOREIGN KEY (caps_id)
REFERENCES dwh.okb_caps (caps_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_caps_consumer_employer___okb_caps_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_caps_consumer_employer DROP CONSTRAINT IF EXISTS fk_okb_caps_consumer_employer___okb_caps_consumer CASCADE;
ALTER TABLE dwh.okb_caps_consumer_employer ADD CONSTRAINT fk_okb_caps_consumer_employer___okb_caps_consumer FOREIGN KEY (caps_consumer_id)
REFERENCES dwh.okb_caps_consumer (caps_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_caps_consumer_address___okb_caps_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_caps_consumer_address DROP CONSTRAINT IF EXISTS fk_okb_caps_consumer_address___okb_caps_consumer CASCADE;
ALTER TABLE dwh.okb_caps_consumer_address ADD CONSTRAINT fk_okb_caps_consumer_address___okb_caps_consumer FOREIGN KEY (caps_consumer_id)
REFERENCES dwh.okb_caps_consumer (caps_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_caps_consumer_verification___okb_caps_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_caps_consumer_verification DROP CONSTRAINT IF EXISTS fk_okb_caps_consumer_verification___okb_caps_consumer CASCADE;
ALTER TABLE dwh.okb_caps_consumer_verification ADD CONSTRAINT fk_okb_caps_consumer_verification___okb_caps_consumer FOREIGN KEY (caps_consumer_id)
REFERENCES dwh.okb_caps_consumer (caps_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais DROP CONSTRAINT IF EXISTS fk_okb_cais___okb_root CASCADE;
ALTER TABLE dwh.okb_cais ADD CONSTRAINT fk_okb_cais___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_consumer___okb_cais | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_consumer DROP CONSTRAINT IF EXISTS fk_okb_cais_consumer___okb_cais CASCADE;
ALTER TABLE dwh.okb_cais_consumer ADD CONSTRAINT fk_okb_cais_consumer___okb_cais FOREIGN KEY (cais_id)
REFERENCES dwh.okb_cais (cais_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_cais_consumer_warranty___okb_cais_consumer | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_cais_consumer_warranty DROP CONSTRAINT IF EXISTS fk_okb_cais_consumer_warranty___okb_cais_consumer CASCADE;
ALTER TABLE dwh.okb_cais_consumer_warranty ADD CONSTRAINT fk_okb_cais_consumer_warranty___okb_cais_consumer FOREIGN KEY (cais_consumer_id)
REFERENCES dwh.okb_cais_consumer (cais_consumer_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_guar___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_guar DROP CONSTRAINT IF EXISTS fk_okb_guar___okb_root CASCADE;
ALTER TABLE dwh.okb_guar ADD CONSTRAINT fk_okb_guar___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_guar_consumer___okb_guar | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_guar_consumer DROP CONSTRAINT IF EXISTS fk_okb_guar_consumer___okb_guar CASCADE;
ALTER TABLE dwh.okb_guar_consumer ADD CONSTRAINT fk_okb_guar_consumer___okb_guar FOREIGN KEY (guar_id)
REFERENCES dwh.okb_guar (guar_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_caps___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_caps DROP CONSTRAINT IF EXISTS fk_okb_caps___okb_root CASCADE;
ALTER TABLE dwh.okb_caps ADD CONSTRAINT fk_okb_caps___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_caps_consumer___okb_caps | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_caps_consumer DROP CONSTRAINT IF EXISTS fk_okb_caps_consumer___okb_caps CASCADE;
ALTER TABLE dwh.okb_caps_consumer ADD CONSTRAINT fk_okb_caps_consumer___okb_caps FOREIGN KEY (caps_id)
REFERENCES dwh.okb_caps (caps_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_okb_validationerrors___okb_root | type: CONSTRAINT --
-- ALTER TABLE dwh.okb_validationerrors DROP CONSTRAINT IF EXISTS fk_okb_validationerrors___okb_root CASCADE;
ALTER TABLE dwh.okb_validationerrors ADD CONSTRAINT fk_okb_validationerrors___okb_root FOREIGN KEY (root_id)
REFERENCES dwh.okb_root (root_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


