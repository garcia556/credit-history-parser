"use strict";
const wd = process.cwd(), logger = require(`${wd}/logger`);

const
	helpers	= require(`${wd}/helpers.js`);

//////////////////////////////////////////////////////////////////////

class Lib
{
	constructor(name)
	{
		this.name = name;
		this.data = require(`${wd}/sql/cmd/${name}.js`);
	}

	get(key)
	{
		return `-- ${key}\n${this.data[key]}`;
	}
}

//////////////////////////////////////////////////////////////////////

module.exports = Lib;

