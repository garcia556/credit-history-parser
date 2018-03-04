"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	uuid		= require("uuid/v4"),
	Koa			= require("koa"),
	bodyParser	= require("koa-bodyparser"),
	app			= new Koa(),
	rp			= require("request-promise-native"),
	PsError		= require(`${wd}/error.js`),
	helpers		= require(`${wd}/helpers.js`);

const
	PORT						= 8080,
	HTTP_X_REQUEST_ID_HEADER	= "x-request-id";

//////////////////////////////

// default JSON error processing
async function handleError(ctx, next)
{
	try
	{
		await next();
	}
	catch (err)
	{
		delete err.cause;
		delete err.options;
		delete err.response;

		let stack = err.stack || new Error().stack;

		// set status of raised error if there is one, otherwise 500
		let status = err.statusCode || 500;

		// check if there is PsError error object inside
		if (err.error && err.error.name == "PsError")
			err = err.error;

		err.stack = stack;
		logger.error(`${ctx.id}: Error handler called; Status: ${status}:${helpers.errorDump(err)}`);
		delete err.stack;

		// mask error
		if (err.name != "PsError")
			err = new PsError();

		let res =
		{
			name		: err.name,
			message		: err.message
		};
		if (err.id)		res.id		= err.id
		if (err.code)	res.code	= err.code;

		ctx.status  = status;
		ctx.body    = res;

		logger.warn(`${ctx.id}: Error response:\n${helpers.jsonToString(ctx.body)}`);

//		ctx.app.emit("error", err, ctx);
	}
}

async function injectId(ctx, next)
{
	ctx.id = ctx.get(HTTP_X_REQUEST_ID_HEADER) || uuid().replace(/\-/g, "");

	await next();
}

function addData(message, data)
{
	data = data || {};

	if (typeof data == "object")
		data = helpers.jsonToString(data);

	data = helpers.shortenString(data);

	if (data != "{}")
		message +=
`

---- Data ----
${data}`;

	return message;
}

async function logRequest(ctx, next)
{
	let message =
`${ctx.id}: Got new ${ctx.method} request at "${ctx.url}"

---- Headers ----
${helpers.jsonToString(ctx.headers)}`;

	logger.warn(addData(message, ctx.request.body));

	await next();
}

async function logResponse(ctx, next)
{
	let message = `${ctx.id}: Sending response ${ctx.status}: ${ctx.message}`;

	logger.info(addData(message, ctx.body));

	await next();
}

function init(type, handlers)
{
	logger.warn(`Starting "${type}" HTTP server ...`);

	let bodyParserConfig = { enableTypes: [ type ] };
	bodyParserConfig[`${type}Limit`] = "5mb";

	let errh = handleError;

	// fetch error handler
	let ix = -1;
	for (let handler of handlers)
	{
		let params = helpers.getFunctionParams(handler);
		if (params.includes("ctxEH") && params.includes("nextEH"))
		{
			errh = handler;
			ix = handlers.indexOf(handler);
		}
	}

	// remove error handler
	if (ix > -1)
		handlers.splice(ix, 1);

	app.use(errh);
	app.use(bodyParser(bodyParserConfig));
	app.use(injectId);
	app.use(logRequest);

	let i = 0;
	for (let handler of handlers)
	{
		app.use(handler);
		i++;
	}

	app.use(logResponse);

	logger.info(`Configured ${i} handlers`);

	app.listen(PORT);
}

//////////////////////////////

let root = {};
root.json = (...handlers) => { init("json", handlers); }
root.text = (...handlers) => { init("text", handlers); }
root.handleError = handleError;
root.injectId = injectId;
root.logRequest = logRequest;

//////////////////////////////

root.invoke = async (resource, data, xrid, type) =>
{
	let
		parts	= resource.split("/"),
		service	= parts[0],
		path	= "";

	if (parts.length > 1)
		path = resource.slice(service.length + 1);

	let options =
	{
		method	: "POST",
		uri		: `http://${service}:${PORT}/${path}`,
		body	: data,
		headers	: {}
	};

	if (type == "json")
		options.json = true;
	else
		options.headers["content-type"] = type;

	options.headers[HTTP_X_REQUEST_ID_HEADER] = xrid;

	let res = await rp(options);

	return res;
}

//////////////////////////////

root.invokeJson = async (resource, data, xrid) =>
{
	let
		parts	= resource.split("/"),
		service	= parts[0],
		path	= "";

	if (parts.length > 1)
		path = resource.slice(service.length + 1);

	let options =
	{
		method	: "POST",
		uri		: `http://${service}:${PORT}/${path}`,
		body	: data,
		json	: true,
		headers	: {}
	};

	options.headers[HTTP_X_REQUEST_ID_HEADER] = xrid;

	let res = await rp(options);

	return res;
}

//////////////////////////////

root.PORT = PORT;

module.exports = root;

