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
	countrybirth character varying(512),
	deathflag integer,
	disputeddate date,
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	first character varying(40),
	freezeflag integer,
	gender integer,
	gendertext character varying(512),
	lastupdateddt date,
	maritalstatus integer,
	maritalstatustext character varying(512),
	name1 character varying(40),
	nationality character varying(2),
	nationalitytext character varying(512),
	numdependants character varying(2),
	oldfirstname character varying(40),
	oldsurname character varying(40),
	paternal character varying(40),
	placeofbirth character varying(80),
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
	addresstypetext character varying(512),
	addrsincedt date,
	apartment character varying(6),
	block character varying(6),
	building character varying(6),
	city character varying(80),
	countrycode character varying(2),
	countrycodetext character varying(512),
	disputeddate date,
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	district character varying(80),
	filesincedt date,
	freezeflag integer,
	housenumber character varying(10),
	lastupdateddt date,
	postal character varying(6),
	prov character varying(2),
	provtext character varying(80),
	resstat character varying(1),
	resstattext character varying(512),
	serialnum character varying(32),
	street character varying(80),
	streettype character varying(2),
	streettypetext character varying(512),
	subdistrict character varying(80),
	suppressflag character varying(1)
);
-- ddl-end --
ALTER TABLE dwh.nbki_addressreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_phonereply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_phonereply CASCADE;
CREATE TABLE dwh.nbki_phonereply(
	report_id integer,
	disputeddate date,
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	freezeflag integer,
	lastupdateddt date,
	number character varying(14),
	phonetype integer,
	phonetypetext character varying(512),
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
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	enddt date,
	filesincedt date,
	freezeflag integer,
	lastupdateddt date,
	name character varying(170),
	occupation integer,
	occupationstatus character varying(512),
	occupationstatustext character varying(512),
	occupationtext character varying(512),
	occupationtrade integer,
	occupationtradetext character varying(512),
	serialnum character varying(32),
	startdt date,
	suppressflag integer,
	title integer,
	titletext character varying(512)
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
	accountratingtext character varying(512),
	accttype integer,
	accttypetext character varying(512),
	amtoutstanding character varying(9),
	amtpastdue character varying(9),
	closeddt date,
	collateral2text character varying(512),
	collateralcode integer,
	creditlimit integer,
	curbalanceamt integer,
	currencycode varchar(3),
	disputeddate date,
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	freezeflag integer,
	interestpaymentduedate date,
	interestpaymentfrequencycode integer,
	interestpaymentfrequencytext character varying(512),
	lastpaymtdt date,
	lastupdateddt date,
	monthsreviewed integer,
	numdays30 integer,
	numdays60 integer,
	numdays90 integer,
	openeddt date,
	ownerindic integer,
	ownerindictext character varying(512),
	paymentduedate date,
	paymtfreqtext character varying(64),
	paymtpat character varying(128),
	paymtpatstartdt date,
	reportingdt date,
	serialnum integer,
	suppressflag integer,
	termsamt integer,
	termsfrequency integer,
	businesscategory character varying(512),
	completeperformdt character varying(512),
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
	court character varying(170),
	disputeddate date,
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	filingnum character varying(35),
	freezeflag integer,
	lastupdateddt date,
	plaintiff character varying(32),
	reporteddt date,
	resolution character varying(500),
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
	bankruptcystatustext character varying(512),
	casenum character varying(35),
	court character varying(170),
	dischargedt date,
	disputeddate date,
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	freezeflag integer,
	lastupdateddt date,
	plaintiff character varying(32),
	reporteddt date,
	resolution character varying(500),
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
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	freezeflag integer,
	information character varying(500),
	lastupdateddt date,
	serialnum integer,
	source character varying(80),
	suppressflag integer
);
-- ddl-end --
ALTER TABLE dwh.nbki_officialinforeply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_inquiryreply | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_inquiryreply CASCADE;
CREATE TABLE dwh.nbki_inquiryreply(
	report_id integer,
	currencycode character varying(3),
	freezeflag integer,
	inqamount character varying(9),
	inqcontrolnum character varying(9),
	inqpurpose character varying(2),
	inqpurposetext character varying(512),
	inquiryperiod character varying(64),
	serialnum integer,
	suppressflag integer,
	userreference character varying(25)
);
-- ddl-end --
ALTER TABLE dwh.nbki_inquiryreply OWNER TO ps_owner;
-- ddl-end --

-- object: dwh.nbki_account | type: TABLE --
-- DROP TABLE IF EXISTS dwh.nbki_account CASCADE;
CREATE TABLE dwh.nbki_account(
	report_id integer,
	serialnum integer,
	acctnum character varying(35)
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
	addons character varying(512),
	groups character varying(512),
	inqcontrolnum integer,
	membercodestatus character varying(512),
	suppressionstatus character varying(512),
	"SubjectReply.fileSinceDt" date,
	"SubjectReply.lastUpdatedDt" date,
	"calc.totalAccts" integer,
	"calc.negativeRating" integer,
	"calc.totalActiveBalanceAccounts" integer,
	"calc.totalHighCredit.Code" character varying(512),
	"calc.totalHighCredit.Value" character varying(512),
	"calc.totalCurrentBalance.Code" character varying(512),
	"calc.totalCurrentBalance.Value" character varying(512),
	"calc.totalPastDueBalance.Code" character varying(512),
	"calc.totalPastDueBalance.Value" character varying(512),
	"calc.oldest" date,
	"calc.totalOutstandingBalance.Code" character varying(512),
	"calc.totalOutstandingBalance.Value" character varying(512),
	"calc.totalScheduledPaymnts.Code" character varying(512),
	"calc.totalScheduledPaymnts.Value" character varying(512),
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
	"calc.mostRecentInqText" character varying(512),
	"calc.totalDisputedAccounts" integer,
	"calc.totalDisputedBankruptcy" integer,
	"calc.totalDisputedLegalItem" integer,
	"calc.totalDisputedOfficialInfo" integer,
	"calc.reportIssueDateTime" date,
	"ctErr.code" integer,
	"ctErr.text" character varying(512),
	"ficoRisk.uniqueId" character varying(512),
	"ficoRisk.errorCode" character varying(512),
	"ficoRisk.errorText" character varying(512),
	"ficoRisk.exclusionCode" character varying(512),
	"ficoRisk.scoreID" character varying(512),
	"ficoRisk.score" character varying(512),
	"ficoRisk.reasonCode1" character varying(512),
	"ficoRisk.reasonCode2" character varying(512),
	"ficoRisk.reasonCode3" character varying(512),
	"ficoRisk.reasonCode4" character varying(512),
	"ficoRisk.derigIndicator" character varying(512),
	"ficoRisk.systemDateTime" character varying(512),
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
	disputedremarks character varying(100),
	disputedstatus character varying(512),
	disputedstatustext character varying(512),
	filesincedt date,
	freezeflag integer,
	idnum character varying(20),
	idtype integer,
	idtypetext character varying(512),
	issueauthority character varying(160),
	issuecountry character varying(80),
	issuedate date,
	lastupdateddt date,
	serialnum character varying(32),
	seriesnumber character varying(20),
	suppressflag character varying(1)
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


