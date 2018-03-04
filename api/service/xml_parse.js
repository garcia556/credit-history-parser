"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	promisify		= require("util").promisify,
	rp				= require("request-promise-native"),
	helpers			= require(`${wd}/helpers.js`),
	httpd			= require(`${wd}/httpd.js`);

//////////////////////////////////////////////////////////////////////

// accepts JSON object: { xml }
async function handleRequest(ctx, next)
{
	let req = ctx.request.body;

	logger.info(`${ctx.id}: Parsing top-level XML message ...`);
	let xml = req.xml;

	// parse message
	xml = helpers.unescapeXml(xml).trim(); // remove special characters and UCS codes
	let obj = await helpers.parseXml(xml);
	logger.info(`${ctx.id}: Saving JSON ...`);
	await helpers.writeFile(`/xml/${ctx.id}.json`, helpers.jsonToString(obj));
	logger.info(`${ctx.id}: Done`);

	let res = {};

	// 1. application
	res = obj.message.$;
	res.main = obj.message.main;

	// 2. credit history
	let ch = obj.message.credit_history;
	if (typeof ch == "string")
		ch = {};
	let types = Object.keys(ch);

	res.credit_history = {};
	for (let type of types)
	{
		logger.info(`${ctx.id}: ${type}: Processing Credit History ...`);

		let xml = ch[type].trim();

		if (type == "okb")
			xml = await httpd.invoke("api_xml_transform/" + type, xml, ctx.id, "text/xml");

		logger.info(`${ctx.id}: ${type}: Getting JSON from XML ...`);
		let parsed = await helpers.parseXml(xml);

		logger.info(`${ctx.id}: ${type}: Saving Credit History JSON ...`);
		await helpers.writeFile(`/xml/${ctx.id}.${type}.json`, helpers.jsonToString(parsed));

		// saving to result object
		res.credit_history[type] = require(`${wd}/convert/ch/${type}`)(parsed);
		logger.info(`${ctx.id}: ${type}: Saving JSON ...`);
		await helpers.writeFile(`/xml/${ctx.id}.${type}.conversion.json`, helpers.jsonToString(res.credit_history[type]));

		logger.info(`${ctx.id}: ${type}: Done`);
	}

	logger.info(`${ctx.id}: Returning result`);

	ctx.body = res;

	await next();
}

//////////////////////////////////////////////////////////////////////

httpd.json(handleRequest);

