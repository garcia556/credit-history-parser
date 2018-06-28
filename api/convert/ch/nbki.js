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

	let r = {};

	let root = obj.nbchScoringReport.product.preply.report;
	if (root)
	{
		// force arrays
		root.PersonReply			= forceArray(root.PersonReply);
		root.IdReply				= forceArray(root.IdReply);
		root.InquiryReply			= forceArray(root.InquiryReply);
		root.AccountReply			= forceArray(root.AccountReply);
		root.EmploymentReply		= forceArray(root.EmploymentReply);
		root.AddressReply			= forceArray(root.AddressReply);
		root.PhoneReply				= forceArray(root.PhoneReply);
		root.BankruptcyReply		= forceArray(root.BankruptcyReply);
		root.LegalItemsReply		= forceArray(root.LegalItemsReply);
		root.OfficialInfoReply		= forceArray(root.OfficialInfoReply);
		root.OwnAccounts			= root.OwnAccounts || {};
		root.OwnAccounts.Account	= forceArray(root.OwnAccounts.Account);

		// report
		r = oa(r, subset(root				, [ "addOns", "groups", "inqControlNum", "MemberCodeStatus", "SuppressionStatus" ]										));
		r = oa(r, subset(root.SubjectReply	, [ "fileSinceDt", "lastUpdatedDt" ]												, "SubjectReply."					));
		r = oa(r, subset(root.calc			, [ "totalAccts", "negativeRating", "totalActiveBalanceAccounts", "oldest",
												"mostRecentAcc", "mostRecentOfficialInfo", "mostRecentBankruptcy",
												"mostRecentLegalItem", "totalBankruptcies", "totalLegalItems",
												"totalOfficialInfo", "totalInquiries", "recentInquiries",
												"collectionsInquiries", "mostRecentInqText", "totalDisputedAccounts",
												"totalDisputedBankruptcy", "totalDisputedLegalItem",
												"totalDisputedOfficialInfo", "reportIssueDateTime" ]							, "calc."							));

		r = oa(r, subset(root.calc.totalHighCredit			|| {}	, [ "Code", "Value" ]										, "calc.totalHighCredit."			));
		r = oa(r, subset(root.calc.totalCurrentBalance		|| {}	, [ "Code", "Value" ]										, "calc.totalCurrentBalance."		));
		r = oa(r, subset(root.calc.totalPastDueBalance		|| {}	, [ "Code", "Value" ]										, "calc.totalPastDueBalance."		));
		r = oa(r, subset(root.calc.totalOutstandingBalance	|| {}	, [ "Code", "Value" ]										, "calc.totalOutstandingBalance."	));
		r = oa(r, subset(root.calc.totalScheduledPaymnts	|| {}	, [ "Code", "Value" ]										, "calc.totalScheduledPaymnts."		));

		// extract data
		r.personReplies			= multi(root.PersonReply			, [ "birthDt", "countryBirth", "deathFlag", "disputedDate", "disputedRemarks",
																		"disputedStatus", "disputedStatusText", "fileSinceDt", "first", "freezeFlag",
																		"gender", "genderText", "lastUpdatedDt", "maritalStatus", "maritalStatusText",
																		"name1", "nationality", "nationalityText", "numDependants", "oldFirstName",
																		"oldSurname", "paternal", "placeOfBirth", "serialNum", "suppressFlag" ]								);
		r.idReplies				= multi(root.IdReply				, [ "disputedDate", "disputedRemarks", "disputedStatus", "disputedStatusText",
																		"fileSinceDt", "freezeFlag", "idNum", "idType", "idTypeText", "issueAuthority",
																		"issueCountry", "issueDate", "lastUpdatedDt", "serialNum", "seriesNumber",
																		"suppressFlag" ]																					);
		r.inquiryReplies		= multi(root.InquiryReply			, [ "currencyCode", "freezeFlag", "inqAmount", "inqControlNum", "inqPurpose",
																		"inqPurposeText", "inquiryPeriod", "serialNum", "suppressFlag", "userReference" ]					);
		r.accountReplies		= multi(root.AccountReply			, [ "accountRating", "accountRatingDate", "accountRatingText", "acctType", "acctTypeText",
																		"amtOutstanding", "amtPastDue", "closedDt", "collateral2Text", "collateralCode",
																		"creditLimit", "curBalanceAmt", "currencyCode", "disputedDate", "disputedRemarks",
																		"disputedStatus", "disputedStatusText", "fileSinceDt", "freezeFlag", "interestPaymentDueDate",
																		"interestPaymentFrequencyCode", "interestPaymentFrequencyText", "lastPaymtDt", "lastUpdatedDt",
																		"monthsReviewed", "numDays30", "numDays60", "numDays90", "openedDt", "ownerIndic",
																		"ownerIndicText", "paymentDueDate", "paymtFreqText", "paymtPat", "paymtPatStartDt",
																		"reportingDt", "serialNum", "suppressFlag", "termsAmt", "termsFrequency", "businessCategory",
																		"completePerformDt", "partnerStartDate" ]															);
		r.employmentReplies		= multi(root.EmploymentReply		, [ "current", "disputedDate", "disputedRemarks", "disputedStatus", "disputedStatusText", "endDt",
																		"fileSinceDt", "freezeFlag", "lastUpdatedDt", "name", "occupation", "occupationStatus",
																		"occupationStatusText", "occupationText", "occupationTrade", "occupationTradeText", "serialNum",
																		 "startDt", "suppressFlag", "title", "titleText" ]													);
		r.addressReplies		= multi(root.AddressReply			, [ "addressType", "addressTypeText", "addrSinceDt", "apartment", "block", "building", "city",
																		"countryCode", "countryCodeText", "disputedDate", "disputedRemarks", "disputedStatus",
																		"disputedStatusText", "district", "fileSinceDt", "freezeFlag", "houseNumber", "lastUpdatedDt",
																		"postal", "prov", "provText", "resStat", "resStatText", "serialNum", "street", "streetType",
																		"streetTypeText", "subDistrict", "suppressFlag" ]													);
		r.phoneReplies			= multi(root.PhoneReply				, [ "disputedDate", "disputedRemarks", "disputedStatus", "disputedStatusText", "fileSinceDt",
																		"freezeFlag", "lastUpdatedDt", "number", "phoneType", "phoneTypeText", "serialNum", "suppressFlag" ]);
		r.bankruptcyReplies		= multi(root.BankruptcyReply		, [ "BankruptcyStatusText", "caseNum", "court", "dischargeDt", "disputedDate", "disputedRemarks",
																		"disputedStatus", "disputedStatusText", "fileSinceDt", "freezeFlag", "lastUpdatedDt", "plaintiff",
																		"reportedDt", "resolution", "serialNum", "status", "suppressFlag" ]									);
		r.legalItemsReplies		= multi(root.LegalItemsReply		, [ "consideredDt", "court", "disputedDate", "disputedRemarks", "disputedStatus", "disputedStatusText",
																		"fileSinceDt", "filingNum", "freezeFlag", "lastUpdatedDt", "plaintiff", "reportedDt", "resolution",
																		"satisfiedDt", "serialNum", "suppressFlag" ]														);
		r.officialInfoReplies	= multi(root.OfficialInfoReply		, [ "dateReported", "disputedDate", "disputedRemarks", "disputedStatus", "disputedStatusText",
																		"fileSinceDt", "freezeFlag", "Information", "lastUpdatedDt", "serialNum", "Source", "suppressFlag" ]);
		r.accounts				= multi(root.OwnAccounts.Account	, [ "serialNum", "acctNum" ]																			);
	}

	if (obj.nbchScoringReport.product.preply.err)
		r = oa(r, subset(obj.nbchScoringReport.product.preply.err.ctErr	|| {}, [ "Code", "Text" ], "ctErr."));
	r = oa(r, subset(obj.nbchScoringReport.ficoRisk || {}			, [ "uniqueId", "errorCode", "errorText", "exclusionCode",
																	"scoreID", "score", "reasonCode1", "reasonCode2",
																	"reasonCode3", "reasonCode4", "derigIndicator",
																	"systemDateTime" ]										, "ficoRisk."						));
	return r;
}

module.exports = convert;

