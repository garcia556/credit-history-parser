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
-- 	LC_COLLATE = 'en_US.UTF-8'
-- 	LC_CTYPE = 'en_US.UTF-8'
-- 	TABLESPACE = pg_default
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

-- object: dwh.nbki_personreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_personreply CASCADE;
CREATE TABLE dwh.nbki_personreply(
	report_id integer,
	birthdt date,
	countrybirth text,
	deathflag integer,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	first text,
	freezeflag integer,
	gender integer,
	gendertext text,
	lastupdateddt date,
	maritalstatus integer,
	maritalstatustext text,
	name1 text,
	nationality text,
	nationalitytext text,
	numdependants text,
	oldfirstname text,
	oldsurname text,
	paternal text,
	placeofbirth text,
	serialnum integer,
	suppressflag integer
);
-- ddl-end --
ALTER TABLE dwh.nbki_personreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_addressreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_addressreply CASCADE;
CREATE TABLE dwh.nbki_addressreply(
	report_id integer,
	addresstype integer,
	addresstypetext text,
	addrsincedt date,
	apartment text,
	block text,
	building text,
	city text,
	countrycode text,
	countrycodetext text,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	district text,
	filesincedt date,
	freezeflag integer,
	housenumber text,
	lastupdateddt date,
	postal text,
	prov text,
	provtext text,
	resstat text,
	resstattext text,
	serialnum text,
	street text,
	streettype text,
	streettypetext text,
	subdistrict text,
	suppressflag text
);
-- ddl-end --
ALTER TABLE dwh.nbki_addressreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_phonereply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_phonereply CASCADE;
CREATE TABLE dwh.nbki_phonereply(
	report_id integer,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	freezeflag integer,
	lastupdateddt date,
	number text,
	phonetype integer,
	phonetypetext text,
	serialnum integer,
	suppressflag integer
);
-- ddl-end --
ALTER TABLE dwh.nbki_phonereply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_employmentreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_employmentreply CASCADE;
CREATE TABLE dwh.nbki_employmentreply(
	report_id integer,
	current integer,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	enddt date,
	filesincedt date,
	freezeflag integer,
	lastupdateddt date,
	name text,
	occupation integer,
	occupationstatus text,
	occupationstatustext text,
	occupationtext text,
	occupationtrade integer,
	occupationtradetext text,
	serialnum text,
	startdt date,
	suppressflag integer,
	title integer,
	titletext text
);
-- ddl-end --
ALTER TABLE dwh.nbki_employmentreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_accountreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_accountreply CASCADE;
CREATE TABLE dwh.nbki_accountreply(
	report_id integer,
	accountrating integer,
	accountratingdate date,
	accountratingtext text,
	accttype integer,
	accttypetext text,
	amtoutstanding text,
	amtpastdue text,
	closeddt date,
	collateral2text text,
	collateralcode integer,
	creditlimit integer,
	curbalanceamt integer,
	currencycode text,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	freezeflag integer,
	interestpaymentduedate date,
	interestpaymentfrequencycode integer,
	interestpaymentfrequencytext text,
	lastpaymtdt date,
	lastupdateddt date,
	monthsreviewed integer,
	numdays30 integer,
	numdays60 integer,
	numdays90 integer,
	openeddt date,
	ownerindic integer,
	ownerindictext text,
	paymentduedate date,
	paymtfreqtext text,
	paymtpat text,
	paymtpatstartdt date,
	reportingdt date,
	serialnum integer,
	suppressflag integer,
	termsamt integer,
	termsfrequency integer,
	businesscategory text,
	completeperformdt text,
	partnerstartdate date
);
-- ddl-end --
ALTER TABLE dwh.nbki_accountreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_legalitemsreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_legalitemsreply CASCADE;
CREATE TABLE dwh.nbki_legalitemsreply(
	report_id integer,
	considereddt date,
	court text,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	filingnum text,
	freezeflag integer,
	lastupdateddt date,
	plaintiff text,
	reporteddt date,
	resolution text,
	satisfieddt date,
	serialnum integer,
	suppressflag integer
);
-- ddl-end --
ALTER TABLE dwh.nbki_legalitemsreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_bankruptcyreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_bankruptcyreply CASCADE;
CREATE TABLE dwh.nbki_bankruptcyreply(
	report_id integer,
	bankruptcystatustext text,
	casenum text,
	court text,
	dischargedt date,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	freezeflag integer,
	lastupdateddt date,
	plaintiff text,
	reporteddt date,
	resolution text,
	serialnum integer,
	status integer,
	suppressflag integer
);
-- ddl-end --
ALTER TABLE dwh.nbki_bankruptcyreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_officialinforeply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_officialinforeply CASCADE;
CREATE TABLE dwh.nbki_officialinforeply(
	report_id integer,
	datereported date,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	freezeflag integer,
	information text,
	lastupdateddt date,
	serialnum integer,
	source text,
	suppressflag integer
);
-- ddl-end --
ALTER TABLE dwh.nbki_officialinforeply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_inquiryreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_inquiryreply CASCADE;
CREATE TABLE dwh.nbki_inquiryreply(
	report_id integer,
	currencycode text,
	freezeflag integer,
	inqamount text,
	inqcontrolnum text,
	inqpurpose text,
	inqpurposetext text,
	inquiryperiod text,
	serialnum integer,
	suppressflag integer,
	userreference text
);
-- ddl-end --
ALTER TABLE dwh.nbki_inquiryreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_account | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_account CASCADE;
CREATE TABLE dwh.nbki_account(
	report_id integer,
	serialnum integer,
	acctnum text
);
-- ddl-end --
ALTER TABLE dwh.nbki_account OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.sq_nbki_report | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS dwh.sq_nbki_report CASCADE;
CREATE SEQUENCE dwh.sq_nbki_report
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE dwh.sq_nbki_report OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_report | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_report CASCADE;
CREATE TABLE dwh.nbki_report(
	report_id integer NOT NULL DEFAULT nextval('dwh.sq_nbki_report'::regclass),
	application_id integer NOT NULL,
	addons text,
	groups text,
	inqcontrolnum integer,
	membercodestatus text,
	suppressionstatus text,
	"SubjectReply.fileSinceDt" date,
	"SubjectReply.lastUpdatedDt" date,
	"calc.totalAccts" integer,
	"calc.negativeRating" integer,
	"calc.totalActiveBalanceAccounts" integer,
	"calc.totalHighCredit.Code" text,
	"calc.totalHighCredit.Value" text,
	"calc.totalCurrentBalance.Code" text,
	"calc.totalCurrentBalance.Value" text,
	"calc.totalPastDueBalance.Code" text,
	"calc.totalPastDueBalance.Value" text,
	"calc.oldest" date,
	"calc.totalOutstandingBalance.Code" text,
	"calc.totalOutstandingBalance.Value" text,
	"calc.totalScheduledPaymnts.Code" text,
	"calc.totalScheduledPaymnts.Value" text,
	"calc.mostRecentAcc" date,
	"calc.mostRecentOfficialInfo" date,
	"calc.mostRecentBankruptcy" date,
	"calc.mostRecentLegalItem" date,
	"calc.totalBankruptcies" integer,
	"calc.totalLegalItems" integer,
	"calc.totalOfficialInfo" integer,
	"calc.totalInquiries" integer,
	"calc.recentInquiries" integer,
	"calc.collectionsInquiries" integer,
	"calc.mostRecentInqText" text,
	"calc.totalDisputedAccounts" integer,
	"calc.totalDisputedBankruptcy" integer,
	"calc.totalDisputedLegalItem" integer,
	"calc.totalDisputedOfficialInfo" integer,
	"calc.reportIssueDateTime" date,
	"ctErr.code" integer,
	"ctErr.text" text,
	"ficoRisk.uniqueId" text,
	"ficoRisk.errorCode" text,
	"ficoRisk.errorText" text,
	"ficoRisk.exclusionCode" text,
	"ficoRisk.scoreID" text,
	"ficoRisk.score" text,
	"ficoRisk.reasonCode1" text,
	"ficoRisk.reasonCode2" text,
	"ficoRisk.reasonCode3" text,
	"ficoRisk.reasonCode4" text,
	"ficoRisk.derigIndicator" text,
	"ficoRisk.systemDateTime" text,
	CONSTRAINT pk_nbki_report PRIMARY KEY (report_id)

);
-- ddl-end --
ALTER TABLE dwh.nbki_report OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_idreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_idreply CASCADE;
CREATE TABLE dwh.nbki_idreply(
	report_id integer,
	disputeddate date,
	disputedremarks text,
	disputedstatus text,
	disputedstatustext text,
	filesincedt date,
	freezeflag integer,
	idnum text,
	idtype integer,
	idtypetext text,
	issueauthority text,
	issuecountry text,
	issuedate date,
	lastupdateddt date,
	serialnum text,
	seriesnumber text,
	suppressflag text
);
-- ddl-end --
ALTER TABLE dwh.nbki_idreply OWNER TO ps_owner;
-- ddl-end --

-- object: fk_nbki_personreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_personreply DROP CONSTRAINT IF EXISTS fk_nbki_personreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_personreply ADD CONSTRAINT fk_nbki_personreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_addressreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_addressreply DROP CONSTRAINT IF EXISTS fk_nbki_addressreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_addressreply ADD CONSTRAINT fk_nbki_addressreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_phonereply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_phonereply DROP CONSTRAINT IF EXISTS fk_nbki_phonereply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_phonereply ADD CONSTRAINT fk_nbki_phonereply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_employmentreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_employmentreply DROP CONSTRAINT IF EXISTS fk_nbki_employmentreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_employmentreply ADD CONSTRAINT fk_nbki_employmentreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_accountreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_accountreply DROP CONSTRAINT IF EXISTS fk_nbki_accountreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_accountreply ADD CONSTRAINT fk_nbki_accountreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_legalitemsreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_legalitemsreply DROP CONSTRAINT IF EXISTS fk_nbki_legalitemsreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_legalitemsreply ADD CONSTRAINT fk_nbki_legalitemsreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_bankruptcyreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_bankruptcyreply DROP CONSTRAINT IF EXISTS fk_nbki_bankruptcyreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_bankruptcyreply ADD CONSTRAINT fk_nbki_bankruptcyreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_officialinforeply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_officialinforeply DROP CONSTRAINT IF EXISTS fk_nbki_officialinforeply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_officialinforeply ADD CONSTRAINT fk_nbki_officialinforeply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_inquiryreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_inquiryreply DROP CONSTRAINT IF EXISTS fk_nbki_inquiryreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_inquiryreply ADD CONSTRAINT fk_nbki_inquiryreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_account___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_account DROP CONSTRAINT IF EXISTS fk_nbki_account___nbki_report CASCADE;
ALTER TABLE dwh.nbki_account ADD CONSTRAINT fk_nbki_account___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_nbki_idreply___nbki_report | type: CONSTRAINT --
-- ALTER TABLE dwh.nbki_idreply DROP CONSTRAINT IF EXISTS fk_nbki_idreply___nbki_report CASCADE;
ALTER TABLE dwh.nbki_idreply ADD CONSTRAINT fk_nbki_idreply___nbki_report FOREIGN KEY (report_id)
REFERENCES dwh.nbki_report (report_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


