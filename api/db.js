"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	pgp	= require("pg-promise")(),

	DBT = "postgresql",
	DBH = "db",
	DBA = process.argv[1],
	DBL = process.env.DB_USER,
	DBP = process.env.DB_PASSWORD,
	DBD = DBL,

	db	= pgp(`${DBT}://${DBL}:${DBP}@${DBH}/${DBD}?${DBA}`);

// TODO refactor
//db.$config.options.query = (e) => { console.log(`QUERY: ${e.query}\n`); }

module.exports = db;

