const winston = require("winston");
winston.add(winston.transports.File, {
	filename	: "/logs/service.log",
	level		: "debug",
	json		: false,
	colorize	: true,
	timestamp	: true,
	maxsize		: 25 * 1024 * 1024 * 1024,
	maxFiles	: 40,
	tailable	: true
});
winston.remove(winston.transports.Console);

module.exports = winston;

