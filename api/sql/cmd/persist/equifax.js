"use strict";

var root = {};

//////////////////////////////////////////////////////////////////////

root.response =
`insert into dwh.eqf_response
values
(
	default,							-- 1
	$(application_id),					-- 2

	$(version),							-- 3
	$(partnerid),						-- 4
	to_timestamp($(datetime), 'DD.MM.YYYY HH24:MI:SS'),	-- 5

	$(num),									-- 6
	to_date($(dateofreport), 'DD.MM.YYYY'),	-- 7
	$(report_type),							-- 8

	$(responsecode),					-- 9
	$(responsestring),					-- 10

	$(title_part___private___lastname),		-- 11
	$(title_part___private___firstname),	-- 12
	$(title_part___private___middlename),	-- 13
	to_date($(title_part___private___birthday), 'DD.MM.YYYY'),	-- 14
	$(title_part___private___birthplace),	-- 15
	$(title_part___private___inn),			-- 16
	$(title_part___private___pfno),			-- 17
	$(title_part___private___driverno),		-- 18
	$(title_part___private___medical),		-- 19

	$(base_part___addr_reg),				-- 20
	$(base_part___addr_fact),				-- 21

	$(base_part___pboul___pboul_no),							-- 22
	to_date($(base_part___pboul___pboul_date), 'DD.MM.YYYY'),	-- 23
	$(base_part___pboul___pboul_place),							-- 24

	$(add_part___interest___hour),			-- 25
	$(add_part___interest___day),			-- 26
	$(add_part___interest___week),			-- 27
	$(add_part___interest___month),			-- 28
	$(add_part___interest___quarter),		-- 29
	$(add_part___interest___year),			-- 30

	$(add_part___own_interest___hour),		-- 31
	$(add_part___own_interest___day),		-- 32
	$(add_part___own_interest___week),		-- 33
	$(add_part___own_interest___month),		-- 34
	$(add_part___own_interest___quarter),	-- 35
	$(add_part___own_interest___year),		-- 36

	$(attrs)							-- 37
)
returning
	response_id`;

///////////////////////////////////

root.docs =
`insert into dwh.eqf_doc
values
(
	$(response_id),
	$(doctype),
	$(docno),
	to_date($(docdate), 'DD.MM.YYYY'),
	to_date($(docenddate), 'DD.MM.YYYY'),
	$(docplace)
)`;

///////////////////////////////////

root.history_titles =
`insert into dwh.eqf_history_title
values
(
	$(response_id),
	to_date($(date), 'DD.MM.YYYY'),
	$(lastname),
	$(firstname),
	$(middlename),
	$(doc___doctype),
	$(doc___docno),
	to_date($(doc___docdate), 'DD.MM.YYYY'),
	to_date($(doc___docenddate), 'DD.MM.YYYY'),
	$(doc___docplace)
)`;

///////////////////////////////////

root.history_addr_regs =
`insert into dwh.eqf_history_addr_reg
values
(
	$(response_id),
	to_date($(date), 'DD.MM.YYYY'),
	$(value)
)`;


///////////////////////////////////

root.history_addr_facts =
`insert into dwh.eqf_history_addr_fact
values
(
	$(response_id),
	to_date($(date), 'DD.MM.YYYY'),
	$(value)
)`;

///////////////////////////////////

root.addr_requests =
`insert into dwh.eqf_addr_request
values
(
	$(response_id),
	$(type),
	to_date($(date), 'DD.MM.YYYY'),
	$(value)
)`;

///////////////////////////////////

root.phones =
`insert into dwh.eqf_phone
values
(
	$(response_id),
	$(type),
	to_date($(date), 'DD.MM.YYYY'),
	$(value)
)`;

///////////////////////////////////

root.credits =
`insert into dwh.eqf_credit
values
(
	$(response_id),
	$(cred_id),
	to_date($(cred_first_load), 'DD.MM.YYYY'),
	$(cred_owner),
	$(cred_partner_type),
	$(cred_person_num),
	$(cred_person_status),
	$(cred_sum),
	$(cred_currency),
	to_date($(cred_date), 'DD.MM.YYYY'),
	to_date($(cred_enddate), 'DD.MM.YYYY'),
	$(cred_sum_payout),
	to_date($(cred_date_payout), 'DD.MM.YYYY'),
	$(cred_sum_debt),
	$(cred_sum_limit),
	$(cred_facility),
	$(delay5),
	$(delay30),
	$(delay60),
	$(delay90),
	$(delay_more),
	$(cred_sum_overdue),
	$(cred_day_overdue),
	$(cred_max_overdue),
	$(cred_prolong),
	$(cred_enddate_fact),
	$(cred_collateral),
	to_date($(cred_update), 'DD.MM.YYYY'),
	$(cred_type),
	$(cred_active),
	to_date($(cred_active_date), 'DD.MM.YYYY'),
	$(cred_sum_type)
)`;

///////////////////////////////////

root.info_requests =
`insert into dwh.eqf_info_request
values
(
	$(response_id),
	$(request_reason),
	$(timeslot),
	$(cred_type),
	$(cred_currency),
	$(cred_sum),
	$(cred_duration),
	$(cred_partner_type)
)`;

///////////////////////////////////

root.courts =
`insert into dwh.eqf_court
values
(
	$(response_id),
	$(cred_id),
	$(info)
)`;

///////////////////////////////////

root.officials =
`insert into dwh.eqf_official
values
(
	$(response_id),
	$(cred_id),
	$(info)
)`;

///////////////////////////////////

root.bankruptcies =
`insert into dwh.eqf_bankruptcy
values
(
	$(response_id),
	$(cred_id),
	$(info)
)`;

///////////////////////////////////

root.scorings =
`insert into dwh.eqf_scoring
values
(
	$(response_id),
	$(scor_id),
	$(scor_card_id),
	$(scor_name),
	$(score),
	$(scor_error),
	$(scor_error_text),
	$(scor_reason)
)`;

///////////////////////////////////

root.checks =
`insert into dwh.eqf_check
values
(
	$(response_id),
	$(element)
)`;

//////////////////////////////////////////////////////////////////////

module.exports = root;

