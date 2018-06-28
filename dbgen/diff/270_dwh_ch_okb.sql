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
	checkother1 text,
	checkother2 text,
	checkother3 text,
	checkother4 text,
	checkother5 text,
	checkother6 text,
	checkother7 text,
	checkother8 text,
	checkother9 text,
	checkother10 text,
	checkother11 text,
	checkother12 text,
	checkother13 text,
	checkother14 text,
	checkother15 text,
	checkother16 text,
	checkother17 text,
	checkother18 text,
	checkother19 text,
	checkother20 text,
	consumerenquirycountlast12month integer,
	potentialmonthlyinstalmentsallbutowner integer,
	potentialmonthlyinstalmentsowner integer,
	potentialoutstandingbalanceallbutowner integer,
	potentialoutstandingbalanceowner integer,
	totalmonthlyinstalmentsallbutowner integer,
	totalmonthlyinstalmentsowner integer,
	totaloutstandingbalanceallbutowner integer,
	totaloutstandingbalanceowner integer,
	worstcurrentpaystatusguarantor text,
	worstcurrentpaystatusjoint text,
	worstcurrentpaystatusowner text,
	worstcurrentpaystatusreferee text,
	worsteverpaystatusguarantor text,
	worsteverpaystatusjoint text,
	worsteverpaystatusowner text,
	worsteverpaystatusreferee text
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
	accountpaymenthistory text,
	accountbalance integer,
	arrearsbalance integer,
	instalment integer,
	creditlimit integer,
	paymentsource text
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
	name text,
	idnumber text,
	currentpreviousindicator text,
	startdate timestamp,
	enddate timestamp,
	flatnbr text,
	housenbr text,
	buildingnbr text,
	line1 text,
	line2 text,
	line3 text,
	line4 text,
	regioncode text,
	postcode text,
	country text,
	telephonenumber text
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_employer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_address | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_address CASCADE;
CREATE TABLE dwh.okb_cais_consumer_address(
	cais_consumer_id integer NOT NULL,
	type text,
	addresscurrprev text,
	flatnbr text,
	housenbr text,
	buildingnbr text,
	line1 text,
	line2 text,
	line3 text,
	line4 text,
	regioncode text,
	postcode text,
	country text,
	startdate timestamp,
	enddate timestamp,
	hometelnbr text
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_address OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_consumer_legal | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_consumer_legal CASCADE;
CREATE TABLE dwh.okb_cais_consumer_legal(
	cais_consumer_id integer NOT NULL,
	courtjudgementorder text,
	courtname text,
	dateofjudgement timestamp,
	judgementtype text,
	resolution text,
	amountofrecovery integer,
	currency text
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
	warrantypaymenthistorystatus text,
	warrantyarrearsbalance integer
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_consumer_warranty_history OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_lien | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_lien CASCADE;
CREATE TABLE dwh.okb_cais_lien(
	cais_id integer NOT NULL,
	lienagreementnumber text,
	lieneename text,
	collateralid text,
	collateralidtype text,
	collateralname text,
	collateraladdress text,
	collateralestimatedvalue integer,
	collateralcurrency text,
	collateralestimatedate timestamp,
	lienagreementopendate timestamp,
	lienagreementduedate timestamp,
	liencloseddate timestamp,
	collateralstartdate timestamp,
	collateralenddate timestamp,
	lienreasonforclosure text,
	liencomments text
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_lien OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_assignee | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_assignee CASCADE;
CREATE TABLE dwh.okb_cais_assignee(
	cais_id integer NOT NULL,
	assdate timestamp,
	asscomment text
);
-- ddl-end --
ALTER TABLE dwh.okb_cais_assignee OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_cais_guarantee | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_cais_guarantee CASCADE;
CREATE TABLE dwh.okb_cais_guarantee(
	cais_id integer NOT NULL,
	guaragreementnumber text,
	guarantorname text,
	guarcoveredamount integer,
	guarcoveredamountcurrency text,
	guaramount integer,
	guaramountcurrency text,
	guaropendate timestamp,
	guarduedate timestamp,
	guarclosedate timestamp,
	guarreasonforclosure text
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
	type text,
	addresscurrprev text,
	flatnbr text,
	housenbr text,
	buildingnbr text,
	line1 text,
	line2 text,
	line3 text,
	line4 text,
	regioncode text,
	postcode text,
	country text,
	startdate timestamp,
	enddate timestamp,
	hometelnbr text
);
-- ddl-end --
ALTER TABLE dwh.okb_guar_consumer_address OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_nameidhistory | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_nameidhistory CASCADE;
CREATE TABLE dwh.okb_nameidhistory(
	root_id integer NOT NULL,
	idchangesource text,
	idchangedate timestamp,
	idtype text,
	idnbr text,
	idissuedate timestamp,
	idplaceofissue text,
	idauthority text,
	idexpirydate timestamp,
	idstatus text,
	pensionnbr text,
	surname text,
	name1 text,
	name2 text,
	dateofbirth timestamp,
	placeofbirth text,
	sex text,
	judgementtype text,
	newidnbr text,
	comments text
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
	streamid text,
	typeofdecision text,
	dateofdecision timestamp,
	decisionenddate timestamp,
	decisionreason text,
	decisionamount text,
	currency text,
	comments text
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
	name text,
	idnumber text,
	currentpreviousindicator text,
	startdate timestamp,
	enddate timestamp,
	timewithemployer text,
	flatnbr text,
	housenbr text,
	buildingnbr text,
	line1 text,
	line2 text,
	line3 text,
	line4 text,
	regioncode text,
	postcode text,
	country text,
	worktelnbr text,
	workmobiletelnbr text
);
-- ddl-end --
ALTER TABLE dwh.okb_caps_consumer_employer OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_consumer_address | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_consumer_address CASCADE;
CREATE TABLE dwh.okb_caps_consumer_address(
	caps_consumer_id integer NOT NULL,
	addresstype text,
	addressflag text,
	flatnbr text,
	housenbr text,
	buildingnbr text,
	line1 text,
	line2 text,
	line3 text,
	line4 text,
	regioncode text,
	postcode text,
	country text,
	startdate timestamp,
	enddate timestamp,
	timeataddress text,
	hometelnbr text
);
-- ddl-end --
ALTER TABLE dwh.okb_caps_consumer_address OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.okb_caps_consumer_verification | type: TABLE --
-- DROP TABLE IF EXISTS dwh.okb_caps_consumer_verification CASCADE;
CREATE TABLE dwh.okb_caps_consumer_verification(
	caps_consumer_id integer NOT NULL,
	status text
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
	"pvs.status" text,
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
	accountclass text,
	consumeraccountnumber text,
	opendate timestamp,
	numofapplicants integer,
	currency text,
	financetype text,
	purposeoffinance text,
	amountoffinance integer,
	creditlimit integer,
	duration integer,
	durationunit text,
	instalment integer,
	paymentfrequency text,
	typeofsecurity text,
	insuredloan text,
	amountinsuredloan integer,
	interestrate decimal(4,3),
	creditfacilitystatus text,
	accountpaymentstatus text,
	outstandingbalance integer,
	arrearsbalance integer,
	fulfilmentduedate timestamp,
	lastpaymentdate timestamp,
	accountcloseddate timestamp,
	defaultdate timestamp,
	litigationdate timestamp,
	writeoffdate timestamp,
	reasonforclosure text,
	accountspecialstatus text,
	lastmissedpaymentdate timestamp,
	recordblockdisputeindicator text,
	dateaccountadded timestamp,
	lastupdatets timestamp,
	monthoflastupdate timestamp,
	subscribercomments text,
	accountholdercomments text,
	worstpaymentstatus text,
	totalamountoffinance text,
	securedamount text,
	securitystartdate timestamp,
	securityenddate timestamp,
	interestpaymentdate timestamp,
	sourceofpayment text,
	applicationnumber text,
	infopartflag text,
	cbrfinancetype text,
	legalaccountnumber text,
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
	accountholdertype text,
	title text,
	name1 text,
	name2 text,
	name3 text,
	surname text,
	primaryidtype text,
	primaryid text,
	primaryidissuedate timestamp,
	primaryidplaceofissue text,
	primaryidexpiry timestamp,
	primaryidauthority text,
	secondaryidtype text,
	secondaryid text,
	secondaryidissuedate timestamp,
	secondaryidplaceofissue text,
	secondaryidexpiry timestamp,
	secondaryidauthority text,
	pensionnbr text,
	privateentrepreneurnbr text,
	privateentrepreneurnbrissuedate timestamp,
	privateentrepreneuregrn text,
	previouspassportnbr text,
	aliasname text,
	previouscompanyname text,
	sex text,
	dateofbirth timestamp,
	placeofbirth text,
	nationality text,
	consentflag text,
	dateconsentgiven timestamp,
	mobiletelnbr text,
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
	warrantyagreementnumber text,
	accfinancetype text,
	acccbrfinancetype text,
	acccurrency text,
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
	warrantypaymentstatus text,
	warrantyarrearsbalance integer,
	warrantyclosedate timestamp,
	warrantyreasonforclosure text,
	legalwarrantyagreementnumber text,
	subscribercomments text,
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
	guaragreementnumber text,
	guarantorname text,
	guarcoveredamount integer,
	guarcoveredamountcurrency text,
	guaramount integer,
	guaramountcurrency text,
	guaropendate timestamp,
	guarduedate timestamp,
	guarclosedate timestamp,
	guarreasonforclosure text,
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
	accountholdertype text,
	title text,
	name1 text,
	name2 text,
	surname text,
	primaryidtype text,
	primaryid text,
	primaryidissuedate timestamp,
	primaryidplaceofissue text,
	primaryidexpiry timestamp,
	primaryidauthority text,
	secondaryidtype text,
	secondaryid text,
	secondaryidissuedate timestamp,
	secondaryidplaceofissue text,
	secondaryidexpiry timestamp,
	secondaryidauthority text,
	pensionnbr text,
	privateentrepreneurnbr text,
	privateentrepreneurnbrissuedate timestamp,
	privateentrepreneuregrn text,
	previouspassportnbr text,
	aliasname text,
	previouscompanyname text,
	sex text,
	dateofbirth timestamp,
	placeofbirth text,
	nationality text,
	consentflag text,
	dateconsentgiven timestamp,
	mobiletelnbr text,
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
	accountclass text,
	streamid text,
	reason text,
	enquirydate timestamp,
	nbrofapplicants integer,
	purposeoffinance text,
	applicationnumber text,
	applicationdate timestamp,
	financetype text,
	currency text,
	creditlimit integer,
	amountoffinance integer,
	initialdepositamount integer,
	finalpaymentamount integer,
	duration integer,
	durationunits text,
	instalmentamount integer,
	paymentfrequency text,
	typeofsecurity text,
	disputeindicator text,
	comments text,
	applicationchannel text,
	cbrfinancetype text,
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
	applicanttype text,
	title text,
	name1 text,
	name2 text,
	name3 text,
	surname text,
	dateofbirth timestamp,
	placeofbirth text,
	aliasname text,
	previouscompanyname text,
	sex text,
	nationality text,
	consentflag text,
	dateconsentgiven timestamp,
	primaryidtype text,
	primaryid text,
	primaryidexpiry timestamp,
	primaryidissuedate timestamp,
	primaryidissueplace text,
	primaryidauthority text,
	secondaryidtype text,
	secondaryid text,
	secondaryidexpiry timestamp,
	secondaryidissuedate timestamp,
	secondaryidissueplace text,
	secondaryidauthority text,
	drivinglicensenbr text,
	medicalnbr text,
	pensionnbr text,
	privateentrepreneurnbr text,
	privateentrepreneurnbrissuedate timestamp,
	privateentrepreneuregrn text,
	previouspassportnbr text,
	primaryincome integer,
	primaryincomefreq text,
	primaryincomeflag text,
	otherincome integer,
	residentialstatus text,
	occupation text,
	occupationstatus text,
	maritalstatus text,
	numberofdependants integer,
	education text,
	mobiletelnbr text,
	mobileregistration text,
	visaccheld text,
	mastercardccheld text,
	dinersccheld text,
	amexpressccheld text,
	jcbccheld text,
	debitccheld text,
	chqgteeccheld text,
	retailccheld text,
	otherccheld text,
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
	field text,
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


