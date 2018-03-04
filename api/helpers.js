"use strict";

const
	crypto		= require("crypto"),
	promisify	= require("util").promisify,
	fs			= require("fs"),
	S			= require("string"),
	xml2js		= require("xml2js"),
	bcrypt		= require("bcryptjs"),
    he			= require("he");

bcrypt.hashAsync    = promisify(bcrypt.hash);
bcrypt.compareAsync = promisify(bcrypt.compare);

const
	xmlParser	= new xml2js.Parser({ explicitArray: false }),
	xmlBuilder	= new xml2js.Builder({ xmldec: { version: "1.0", encoding: "utf-8", standalone: false } });

//////////////////////////////////////////////////////////////////////

var root = {};

root.jsonToString	= obj => { return JSON.stringify(obj, null, "\t"); }
root.errorDump		= err =>
{
	if (!err)
		return "";

	let stack = err.stack || null;
	if (stack)
		delete err.stack;

	let result = "";

	let str = root.jsonToString(err);
	if (str != "{}")
		result += `\n${root.jsonToString(err)}`;

	if (stack)
		result += `\nStack:\n${stack}`;

	return result;
}

root.writeFile	= promisify(fs.writeFile);
root.readFile	= promisify(fs.readFile);
root.readdir	= promisify(fs.readdir);

root.unescapeXml = xmlString =>
{
	let res = xmlString;

	res = he.decode(res);
	res = he.decode(res, {
		"useNamedReferences": true,
		"decimal": true
	});

	return res;
}
root.parseXml	= promisify(xmlParser.parseString);
root.buildXml	= obj =>
{
	return xmlBuilder.buildObject(obj);
}

root.escapeDotSql = str =>
{
	return S(str).replaceAll(".", "___").s;
}

root.escapeDotSqlKeys = obj =>
{
	obj = obj || {};
	Object.keys(obj).forEach((key, i) => {
		if (key.includes("."))
		{
			let keyNew = root.escapeDotSql(key);
			obj[keyNew] = obj[key];
			delete obj[key];
		}
	});

	return obj;
}

root.getFunctionParams = f =>
{
	return /\(\s*([^)]+?)\s*\)/.exec(f.toString())[1].split(",").map(s => { return s.trim(); });
}

root.randomString = length =>
{
	return crypto.randomBytes(Math.ceil(length / 2))
		.toString("hex")
		.slice(0,length);
}

root.hashPassword = async value =>
{
	return await bcrypt.hashAsync(value, 12);
}

root.hashPasswordCompare = async (value, hash) =>
{
	return await bcrypt.compareAsync(value, hash);
}

root.pgArrayToJs = (obj) =>
{
	return obj.replace("{", "").replace("}", "").split(",");
}

root.shortenString = str =>
{
	str = str || "";

	if (str.length > 1024)
		str =
`${str.slice(0, 384)}
...
...
...
${str.slice(-384)}`;

	return str;
}

const secretJWT = root.randomString(64);
root.getSecretJWT = () =>
{
	return secretJWT;
}

root.openscoringURL = "http://openscoring:8080/openscoring";

//////////////////////////////////////////////////////////////////////

module.exports = root;

