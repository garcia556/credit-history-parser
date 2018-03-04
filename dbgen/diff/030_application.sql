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

-- object: public.sq_application | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.sq_application CASCADE;
CREATE SEQUENCE public.sq_application
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --
ALTER SEQUENCE public.sq_application OWNER TO ps_owner;
-- ddl-end --

-- object: public.application | type: TABLE --
-- DROP TABLE IF EXISTS public.application CASCADE;
CREATE TABLE public.application(
	application_id integer NOT NULL DEFAULT nextval('public.sq_application'::regclass),
	id varchar(128) NOT NULL,
	date_created timestamp NOT NULL DEFAULT timezone('utc'::text, now()),
	date_modified timestamp NOT NULL DEFAULT timestamp 'infinity',
	CONSTRAINT pk_application PRIMARY KEY (application_id)

);
-- ddl-end --
ALTER TABLE public.application OWNER TO ps_owner;
-- ddl-end --


