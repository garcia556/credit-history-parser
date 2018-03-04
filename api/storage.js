"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	uuid	= require("uuid/v4"),
	helpers	= require(`${wd}/helpers.js`),
	db		= require(`${wd}/db.js`),
	libsql	= require(`${wd}/sql/lib.js`);

const METHOD_MAP =
{
	exec	: "none",
	get		: "one",
	select	: "any"
}

class Storage
{
	constructor(lib)
	{
		if (!lib)
			lib = "main";
		this.lib = lib;
		this.sql = new libsql(this.lib);

		for (let key of Object.keys(METHOD_MAP))
			this[key] = async function(dbt, cmd, params)
			{
				if (typeof dbt == "string")
				{
					params	= cmd;
					cmd		= dbt;
					dbt		= db;
				}

				let paramsStr = helpers.jsonToString(params);
				paramsStr = helpers.shortenString(paramsStr);

				logger.info(`Storage request: ${key}, ${cmd}, params: ${paramsStr}`);

				return await dbt[METHOD_MAP[key]](this.sql.get(cmd), params);
			}
	}

	async tx(worker)
	{
		let result = await db.tx(worker);
		return result;
	}
}

module.exports = Storage;

