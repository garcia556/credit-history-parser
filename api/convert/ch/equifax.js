function subset(obj, keys, keyPrefix)
{
	let res = {};

	keyPrefix = keyPrefix || "";

	keys.map(el => {
		res[keyPrefix + el] = obj[el] || null;
	});

	return res;
}

function multi(array, keys, keyPrefix)
{
	let res = [];

	array = forceArray(array);
	array.map(el => {
		res.push(subset(el, keys, keyPrefix));
	});

	return res;
}

function forceArray(obj)
{
	obj = obj || [];

	if (obj instanceof Array)
		return obj;

	return [ obj ];
}

function convert(obj)
{
	// standard value conversion functions
	let oa = Object.assign;
	let root = obj.bki_response.response;

	// force arrays
	root.title_part.private.history_title	= forceArray(root.title_part.private.history_title);
	root.base_part.history_addr.addr_reg	= forceArray(root.base_part.history_addr.addr_reg);
	root.base_part.history_addr.addr_fact	= forceArray(root.base_part.history_addr.addr_fact);
	root.base_part.addr_requests.address	= forceArray(root.base_part.addr_requests.address);
	root.base_part.phones.phone_number		= forceArray(root.base_part.phones.phone_number);
	root.base_part.court					= forceArray(root.base_part.court);
	root.base_part.official					= forceArray(root.base_part.official);
	root.base_part.bankruptcy				= forceArray(root.base_part.bankruptcy);

	// response
	let r = {};
	r = oa(r, subset(obj.bki_response.$			, [ "version", "partnerid", "datetime" ]																								));
	r = oa(r, subset(root.$						, [ "num", "dateofreport", "report_type" ]																								));
	r = oa(r, subset(root						, [ "responsecode", "responsestring" ]																									));
	r = oa(r, subset(root.title_part.private	, [ "lastname", "firstname", "middlename", "birthday", "birthplace", "inn", "pfno", "driverno", "medical" ]	, "title_part.private."		));
	r = oa(r, subset(root.base_part				, [ "addr_reg", "addr_fact" ]																				, "base_part."				));
	r = oa(r, subset(root.base_part.pboul || {}	, [ "pboul_no", "pboul_date", "pboul_place" ]																, "base_part.pboul."		));
	r = oa(r, subset(root.add_part.interest		, [ "hour", "day", "week", "month", "quarter", "year" ]														, "add_part.interest."		));
	r = oa(r, subset(root.add_part.own_interest	, [ "hour", "day", "week", "month", "quarter", "year" ]														, "add_part.own_interest."	));
	r.attrs = root.add_part.attrs;

	// extract data
	r.docs				= multi(root.title_part.private.doc				, [ "doctype", "docno", "docdate", "docenddate", "docplace" ]	);
	r.history_titles	= root.title_part.private.history_title.map(el => {
		return oa(
			subset(el		, [ "date", "lastname", "firstname", "middlename" ]),
			subset(el.doc	, [ "doctype", "docno", "docdate", "docenddate", "docplace" ], "doc.")
			);
	});
	r.history_addr_regs		= root.base_part.history_addr.addr_reg	.map(el => { return { value: el._, date: el.$.date							}; });
	r.history_addr_facts	= root.base_part.history_addr.addr_fact	.map(el => { return { value: el._, date: el.$.date							}; });
	r.addr_requests			= root.base_part.addr_requests.address	.map(el => { return { value: el._, date: el.$.date, type: el.$.addr_type	}; });
	r.phones				= root.base_part.phones.phone_number	.map(el => { return { value: el._, date: el.$.date, type: el.$.phone_type	}; });
	r.credits				= multi(root.base_part.credit, [ "cred_id", "cred_first_load", "cred_owner", "cred_partner_type", "cred_person_num", "cred_person_status", "cred_ratio",
															 "cred_sum", "cred_currency", "cred_date", "cred_enddate", "cred_sum_payout", "cred_date_payout", "cred_sum_debt",
															 "cred_sum_limit", "cred_facility", "delay5", "delay30", "delay60", "delay90", "delay_more", "cred_sum_overdue",
															 "cred_day_overdue", "cred_max_overdue", "cred_prolong", "cred_enddate_fact", "cred_collateral", "cred_update",
															 "cred_type", "cred_active", "cred_active_date", "cred_sum_type" ]);
	r.info_requests		= multi(root.add_part.info_requests.request	, [ "request_reason", "timeslot", "cred_type", "cred_currency", "cred_sum", "cred_duration", "cred_partner_type" ]);
	r.courts			= root.base_part.court		|| []		.map(el => { return { cred_id: el.cred_id, info: el.info_court		}; });
	r.officials			= root.base_part.official	|| []		.map(el => { return { cred_id: el.cred_id, info: el.info_official	}; });
	r.bankruptcies		= root.base_part.bankruptcy	|| []		.map(el => { return { cred_id: el.cred_id, info: el.info_bankruptcy	}; });
	r.scorings			= multi(root.add_part.scorings.scoring		, [ "scor_id", "scor_card_id", "scor_name", "score", "scor_error", "scor_error_text", "scor_reason" ]);
	root.checks			= root.checks || { check: [] };
	r.checks			= multi(root.checks.check					, [ "element" ]);

	// some data corrections
	for (let i = 0; i < r.credits.length; i++)
	{
		let credit = r.credits[i];

		if (credit.cred_sum_limit && credit.cred_sum_limit == "-")
			credit.cred_sum_limit = "0.00";

		r.credits[i] = credit;
	}

	return r;
}

module.exports = convert;

