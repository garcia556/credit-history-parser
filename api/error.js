const
	util	= require("util"),
	i18n	= require("i18n"),
	S		= require("string"),
	uuid	= require("uuid/v4");

i18n.configure({ locales: [ "en", "ru" ], directory: "./i18n-locales", defaultLocale: "ru" });

Error.stackTraceLimit = 32;

//////////////////////////////////////////////////////

function PsError(code, statusCode)
{
	if (!code)
		code = "API-00000";

	// make error code JSON-RPC compatible
	this.id = uuid().replace(/\-/g, "");
	this.name = "PsError";
	this.statusCode = statusCode || 500;
	this.message = i18n.__(code);
	if (this.message != code)
		this.code = code;
	this.stack = new Error().stack;
};

util.inherits(PsError, Error);

module.exports = PsError;

