"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	S				= require("string"),
	rp				= require("request-promise-native"),
	PsError			= require(`${wd}/error.js`),
	helpers			= require(`${wd}/helpers.js`),
	httpd			= require(`${wd}/httpd.js`);

//////////////////////////////////////////////////////////////////////

function responseGen(state, data)
{
	let obj =
	{
		response:
		{
			state,
			data
		}
	};

	return helpers.buildXml(obj);
}

//////////////////////////////////////////////////////////////////////

async function handleError(ctxEH, nextEH)
{
	try
	{
		await nextEH();
	}
	catch (err)
	{
		await httpd.handleError(ctxEH, async () => { throw err; });

		let body = ctxEH.body;
		delete body.statusCode;
		delete body.name;
		ctxEH.type 	= "text/xml";
		ctxEH.body 	= responseGen("ERROR", { error: { $: body } });

		logger.warn(`${ctxEH.id}: Error response:\n${ctxEH.body}`);
	}
}

//////////////////////////////////

async function handleRequest(ctx, next)
{
	let req = ctx.request.body;
	if (req.constructor !== String)
		throw new PsError("API-10005"); // Invalid request type

	// write incoming XML to file
	await helpers.writeFile(`/xml/${ctx.id}.xml`, req);
	logger.info(`${ctx.id}: Message saved`);

	// call exernal services
	logger.info(`${ctx.id}: Calling XML parse ...`);
	let resParse	= await httpd.invokeJson("api_xml_parse", { xml: req }, ctx.id);
	logger.info(`${ctx.id}: Got parsed XML`);

	logger.info(`${ctx.id}: Calling persistence service ...`);
	let resPersist	= await httpd.invokeJson("api_persist", resParse, ctx.id);
	logger.info(`${ctx.id}: Request persisted`);

	ctx.type = "text/xml";
	ctx.body = responseGen("OK", { reply: { } });

	await next();
}

//////////////////////////////////////////////////////////////////////

httpd.text(handleRequest, handleError);

