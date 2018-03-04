"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	helpers			= require(`${wd}/helpers.js`),
	PsError			= require(`${wd}/error.js`),
	Storage			= require(`${wd}/storage.js`),
	httpd			= require(`${wd}/httpd.js`),
	libsql			= require(`${wd}/sql/lib.js`);

//////////////////////////////////////////////////////////////////////

async function persistEntities(ctx, db, sql, data, type, ext)
{
	if (!data)
		return;

	// persist data
	data = helpers.escapeDotSqlKeys(data);
	let storage = new Storage(sql);
	let dbRows = await storage.select(type, Object.assign(data, ext));
	logger.info(`${ctx.id}: Data record "${type}" persisted`);

	// if there is nothing returned from the database persist stateent then we're finished
	if (dbRows.length == 0)
		return;

	let extCh = dbRows[0];

	// otherwise there might be child entities
	let empty = Object.keys(data).filter(key => { return data[key] instanceof Array && data[key].length == 0; }).join(", ");
	logger.info(`${ctx.id}: Skipping empty subentity keys: ${empty}`);

	for (let keyCh of Object.keys(data).filter(key => { return data[key] instanceof Array && data[key].length > 0; }))
	{
		logger.info(`${ctx.id}: Processing "${keyCh}" subentities with extension ${JSON.stringify(extCh)} ...`);
		let rc = 0;
		for (let dataCh of data[keyCh])
		{
			await persistEntities(ctx, db, sql, dataCh, keyCh, extCh);
			rc++;
		}
		logger.info(`${ctx.id}: Done, ${rc} records processed`);
	}
}

///////////////////////////////////

async function persistData(ctx, dbt, obj)
{
	let storage = new Storage();

	// 1. application / data
	let app	= await storage.get(dbt, "CREATE_APPLICATION", { id: obj.app_id });
	logger.info(`${ctx.id}: ${app.application_id}: Saved application entity`);

	// 2. credit history
	await persistEntities(ctx, dbt, "persist/equifax"	, obj.credit_history.equifax	, "response", app);
	await persistEntities(ctx, dbt, "persist/nbki"		, obj.credit_history.nbki		, "report"	, app);
	await persistEntities(ctx, dbt, "persist/okb"		, obj.credit_history.okb		, "root"	, app);

	logger.info(`${ctx.id}: ${app.application_id}: Done`);

	return app;
}

///////////////////////////////////

// accepts JSON object: { rule, application, credit_history }
async function handleRequest(ctx, next)
{
	let req = ctx.request.body;

	logger.info(`${ctx.id}: Persisting message ...`);

	let storage = new Storage();
	let app = await storage.tx(dbt => { return persistData(ctx, dbt, req); });

	logger.info(`${ctx.id}: Done`);

	ctx.body = app;

	await next();
}

//////////////////////////////////////////////////////////////////////

httpd.json(handleRequest);

