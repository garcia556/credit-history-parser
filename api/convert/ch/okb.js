function subset(obj, keys, keyPrefix)
{
	let res = {};

	keyPrefix = keyPrefix || "";

	keys.map(el => {
		let val = obj[el] || null;
		if (val && val.$ && val.$.s && val.$.s == "?")
			val = null;
		res[keyPrefix + el] = val;
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
	let root = obj.s;

	// force arrays

/*
	root.validationerrors				= forceArray(root.validationerrors);
	root.warnings						= forceArray(root.warnings);
	root.nameidhistory					= forceArray(root.nameidhistory);
	root.summary						= forceArray(root.summary);
	root.cais							= forceArray(root.cais);
	root.cais_monthlyhistory			= forceArray(root.cais_monthlyhistory);
	root.cais_consumer					= forceArray(root.cais_consumer);
	root.cais_consumer_employer			= forceArray(root.cais_consumer_employer);
	root.cais_consumer_address			= forceArray(root.cais_consumer_address);
	root.cais_consumer_legal			= forceArray(root.cais_consumer_legal);
	root.cais_consumer_warranty			= forceArray(root.cais_consumer_warranty);
	root.cais_consumer_warranty_history	= forceArray(root.cais_consumer_warranty_history);
	root.cais_consumer_lien				= forceArray(root.cais_consumer_lien);
	root.cais_assignee					= forceArray(root.cais_assignee);
	root.cais_guarantee					= forceArray(root.cais_guarantee);
	root.guar							= forceArray(root.guar);
	root.guar_consumer					= forceArray(root.guar_consumer);
	root.guar_consumer_address			= forceArray(root.guar_consumer_address);
	root.caps							= forceArray(root.caps);
	root.caps_decision					= forceArray(root.caps_decision);
	root.caps_consumer					= forceArray(root.caps_consumer);
	root.caps_consumer_employer			= forceArray(root.caps_consumer_employer);
	root.caps_consumer_address			= forceArray(root.caps_consumer_address);
	root.caps_consumer_verification		= forceArray(root.caps_consumer_verification);
*/

	// report
	let r = {};
	r = oa(r, subset(root, [ "responseDate", "errorCode", "streamID" ]));
	root = root.Consumer.s;
	r = oa(r, subset(root.PVS, [ "status" ]	, "pvs."));

	r.validationerrors	= multi(root.ValidationErrors	, [ "number", "field", "path", "value", "extra1", "extra2" ]				);
	r.warnings			= root.Warnings.a.map(v => { return { value: v }; });
	r.nameidhistory		= multi(root.NameIDHistory		, [	"idChangeSource", "idChangeDate", "idType", "idNbr", "idIssueDate",
															"idPlaceOfIssue", "idAuthority", "idExpiryDate", "idStatus",
															"pensionNbr", "surname", "name1", "name2", "dateOfBirth",
															"placeOfBirth", "sex", "judgemenType", "newIdNbr", "comments" ]			);
	r.summary			= multi(root.Summary, [ "CAISDistribution1", "CAISDistribution2", "CAISDistribution3", "CAISDistribution4",
												"CAISDistribution5", "CAISDistribution5Plus", "CAISRecordsGuarantor",
												"CAISRecordsguarantorRecip", "CAISRecordsJoint", "CAISRecordsJointRecip",
												"CAISRecordsOwner", "CAISRecordsOwnerRecip", "CAISRecordsReferee",
												"CAISRecordsRefereeRecip", "CAPSDistribution1", "CAPSDistribution2",
												"CAPSDistribution3", "CAPSDistribution4", "CAPSDistribution5",
												"CAPSDistribution5Plus", "CAPSLast1MonthsGuarantor", "CAPSLast1MonthsJoint",
												"CAPSLast1MonthsOwner", "CAPSLast1MonthsReferee", "CAPSLast3MonthsGuarantor",
												"CAPSLast3MonthsJoint", "CAPSLast3MonthsOwner", "CAPSLast3MonthsReferee",
												"CAPSLast6MonthsGuarantor", "CAPSLast6MonthsJoint", "CAPSLast6MonthsOwner",
												"CAPSLast6MonthsReferee", "CAPSRecordsGuarantor", "CAPSRecordsGuarantorBeforeFilter",
												"CAPSRecordsJoint", "CAPSRecordsJointBeforeFilter", "CAPSRecordsOwner",
												"CAPSRecordsOwnerFilter", "CAPSRecordsReferee", "CAPSRecordsRefereeFilter",
												"checkOther1", "checkOther2", "checkOther3", "checkOther4", "checkOther5",
												"checkOther6", "checkOther7", "checkOther8", "checkOther9", "checkOther10",
												"checkOther11", "checkOther12", "checkOther13", "checkOther14", "checkOther15",
												"checkOther16", "checkOther17", "checkOther18", "checkOther19", "checkOther20",
												"ConsumerEnquiryCountLast12Month", "PotentialMonthlyInstalmentsAllButOwner",
												"PotentialMonthlyInstalmentsOwner", "PotentialOutstandingBalanceAllButOwner",
												"PotentialOutstandingBalanceOwner", "TotalMonthlyInstalmentsAllButOwner",
												"TotalMonthlyInstalmentsOwner", "TotalOutstandingBalanceAllButOwner",
												"TotalOutstandingBalanceOwner", "WorstCurrentPayStatusGuarantor",
												"WorstCurrentPayStatusJoint", "WorstCurrentPayStatusOwner",
												"WorstCurrentPayStatusReferee", "WorstEverpayStatusGuarantor",
												"WorstEverpayStatusJoint", "WorstEverpayStatusOwner", "WorstEverpayStatusReferee" ]	);

	r.cais = [];
	for (let raw1 of root.CAIS.s)
	{
		let cais = subset(raw1, [	"accountClass", "consumerAccountNumber", "openDate", "numOfApplicants", "currency",
									"financeType", "purposeOfFinance", "amountOfFinance", "creditLimit", "duration",
									"durationUnit", "instalment", "paymentFrequency", "typeOfSecurity", "insuredLoan",
									"amountInsuredLoan", "interestRate", "creditFacilityStatus", "accountPaymentStatus",
									"outstandingBalance", "arrearsBalance", "fulfilmentDueDate", "lastPaymentDate",
									"accountClosedDate", "defaultDate", "litigationDate", "writeOffDate",
									"reasonForClosure", "accountSpecialStatus", "lastMissedPaymentDate",
									"recordBlockDisputeIndicator", "dateAccountAdded", "lastUpdateTS",
									"monthOfLastUpdate", "subscriberComments", "accountHolderComments",
									"worstPaymentStatus", "totalAmountOfFinance", "securedAmount", "securityStartDate",
									"securityEndDate", "interestPaymentDate", "sourceOfPayment", "applicationNumber",
									"infoPartFlag", "cbrFinanceType", "legalAccountNumber", "totalCostOfFinanceInPercent" ]		);
		raw1.MonthlyHistory.s = forceArray(raw1.MonthlyHistory.s);
		cais.cais_monthlyhistory = multi(raw1.MonthlyHistory.s, [	"historyDate", "accountPaymentHistory", "accountBalance",
																	"arrearsBalance", "instalment", "creditLimit",
																	"paymentSource" ]											);

		cais.cais_consumer = [];
		raw1.Consumer.s = forceArray(raw1.Consumer.s);
		for (let raw2 of raw1.Consumer.s)
		{
			let caisConsumer = subset(raw2, [	"accountHolderType", "title", "name1", "name2", "name3", "surname",
												"primaryIDType", "primaryID", "primaryIDIssueDate",
												"primaryIDPlaceOfIssue", "primaryIDExpiry", "primaryIDAuthority",
												"secondaryIDType", "secondaryID", "secondaryIDIssueDate",
												"secondaryIDPlaceOfIssue", "secondaryIDExpiry",
												"secondaryIDAuthority", "pensionNbr", "privateEntrepreneurNbr",
												"privateEntrepreneurNbrIssueDate", "privateEntrepreneurEGRN",
												"previousPassportNbr", "aliasName", "previousCompanyName",
												"sex", "dateOfBirth", "placeOfBirth", "nationality", "consentFlag",
												"dateConsentGiven", "mobileTelNbr" ]												);

			raw2.Employer.s = forceArray(raw2.Employer.s);
			caisConsumer.cais_consumer_employer = multi(raw2.Employer.s, [	"name", "idNumber", "currentPreviousIndicator",
																			"startDate", "endDate", "flatNbr", "houseNbr",
																			"buildingNbr", "line1", "line2", "line3", "line4",
																			"regionCode", "postCode", "country", "telephoneNumber" ]);

			raw2.Address.s = forceArray(raw2.Address.s);
			caisConsumer.cais_consumer_address	= multi(raw2.Address.s, [	"type", "addressCurrPrev", "flatNbr", "houseNbr",
																			"buildingNbr", "line1", "line2", "line3", "line4",
																			"regionCode", "postCode", "country", "startDate",
																			"endDate", "homeTelNbr" ]								);

			raw2.Legal = raw2.Legal || {};
			raw2.Legal.s = forceArray(raw2.Legal.s);
			caisConsumer.cais_consumer_legal	= multi(raw2.Legal.s, [	"courtJudgementOrder", "courtName", "dateOfJudgement",
																		"judgementType", "resolution", "amountOfRecovery",
																		"currency" ]												);

			caisConsumer.cais_consumer_warranty = [];
			raw2.Warranty	= raw2.Warranty || {};
			raw2.Warranty.s	= raw2.Warranty.s || [];
			for (let raw3 of raw2.Warranty.s)
			{
				let caisConsumerWarranty = subset(raw3, [	"warrantyAgreementNumber", "accFinanceType", "accCBRFinanceType",
															"accCurrency", "accAmountOfFinance", "accTotalAmountOfFinance",
															"accTotalOutstandingBalance", "warrantyMonthOfLastUpdate",
															"warrantyLastUpdateTS", "warrantyAmount", "warrantyOpenDate",
															"warrantyDueDate", "warrantyClaimDate", "warrantyCreditLimit",
															"dateWarrantyAdded", "warrantyOutstandingBalance",
															"warrantyInstalmentAmount", "warrantyInstalmentDate",
															"warrantyPaymentStatus", "warrantyArrearsBalance",
															"warrantyCloseDate", "warrantyReasonForClosure",
															"legalWarrantyAgreementNumber", "subscriberComments" ]				);
				caisConsumerWarranty.cais_consumer_warranty_history = multi(raw3, [	"accTotalOutstandingBalance",
																					"warrantyOutstandingBalance",
																					"warrantyInstalmentAmount",
																					"historyDate",
																					"warrantyPaymentHistoryStatus",
																					"warrantyArrearsBalance" ]					);
				caisConsumer.cais_consumer_warranty.push(caisConsumerWarranty);
			}

			raw2.Lien = forceArray(raw2.Lien);
			caisConsumer.cais_consumer_lien		= multi(raw2.Lien, [	"lienAgreementNumber", "lieneeName", "collateralID",
																		"collateralIDType", "collateralName", "collateralAddress",
																		"collateralEstimatedValue", "collateralCurrency",
																		"collateralEstimateDate", "lienAgreementOpenDate",
																		"lienAgreementDueDate", "lienClosedDate",
																		"collateralStartDate", "collateralEndDate",
																		"lienReasonForClosure", "lienComments" ]				);

			cais.cais_consumer.push(caisConsumer);
		}

		raw1.Assignee	= raw1.Assignee || {};
		raw1.Assignee.s	= raw1.Assignee.s || [];
		cais.assignee	= multi(raw1.Assignee.s, [	"assDate", "assComment" ]													);

		raw1.Guarantee		= raw1.Guarangee || {};
		raw1.Guarantee.s	= raw1.Guarantee.s || [];
		cais.guarantee		= multi(raw1.Guarantee.s, [	"guarAgreementNumber", "guarantorName", "guarCoveredAmount",
														"guarCoveredAmountCurrency", "guarAmount", "guarAmountCurrency",
														"guarOpenDate", "guarDueDate", "guarCloseDate",
														"guarReasonForClosure" ]												);

		r.cais.push(cais);
	}

	r.guar = [];
	root.GUAR	= root.GUAR || {};
	root.GUAR.s	= root.GUAR.s || [];
	for (let raw1 of root.GUAR.s)
	{
		let guar = subset(raw1, [	"guarAgreementNumber", "guarantorName", "guarCoveredAmount",
									"guarCoveredAmountCurrency", "guarAmount", "guarAmountCurrency",
									"guarOpenDate", "guarDueDate", "guarCloseDate", "guarReasonForClosure",
									"guarNumOfHolders", "guarDateAdded", "guarLastUpdateTS", "monthOfLastUpdate" ]				);

		guar.guar_consumer = [];
		raw1.Consumer.s = forceArray(raw1.Consumer.s);
		for (let raw2 of raw1.Consumer.s)
		{
			let guarConsumer = subset(raw2, [	"accountHolderType", "title", "name1", "name2", "surname", "primaryIDType",
												"primaryID", "primaryIDIssueDate", "primaryIDPlaceOfIssue",
												"primaryIDExpiry", "primaryIDAuthority", "secondaryIDType", "secondaryID",
												"secondaryIDIssueDate", "secondaryIDPlaceOfIssue", "secondaryIDExpiry",
												"secondaryIDAuthority", "pensionNbr", "privateEntrepreneurNbr",
												"privateEntrepreneurNbrIssueDate", "privateEntrepreneurEGRN",
												"previousPassportNbr", "aliasName", "previousCompanyName", "sex",
												"dateOfBirth", "placeOfBirth", "nationality", "consentFlag",
												"dateConsentGiven", "mobileTelNbr" ]											);

			raw2.Address = forceArray(raw2.Address);
			guarConsumer.guar_consumer_address	= multi(raw2.Address, [	"type", "addressCurrPrev", "flatNbr", "houseNbr",
																		"buildingNbr", "line1", "line2", "line3", "line4",
																		"regionCode", "postCode", "country", "startDate",
																		"endDate", "homeTelNbr" ]								);

			guar.guar_consumer.push(guarConsumer);
		}
	}

	r.caps = [];
	for (let raw1 of root.CAPS.s)
	{
		let caps = subset(raw1, [	"accountClass", "streamID", "reason", "enquiryDate", "nbrOfApplicants",
									"purposeOfFinance", "applicationNumber", "applicationDate", "financeType",
									"currency", "creditLimit", "amountOfFinance", "initialDepositAmount",
									"finalPaymentAmount", "duration", "durationUnits", "instalmentAmount",
									"paymentFrequency", "typeOfSecurity", "disputeIndicator", "comments",
									"applicationChannel", "cbrFinanceType" ]													);

		raw1.Decision = forceArray(raw1.Decision);
		caps.caps_decision = multi(raw1.Decision, [	"streamID", "typeOfDecision", "dateOfDecision", "decisionEndDate",
													"decisionReason", "decisionAmount", "currency", "comments" ]				);

		caps.caps_consumer = [];
		raw1.Consumer.s = forceArray(raw1.Consumer.s);
		for (let raw2 of raw1.Consumer.s)
		{
			let capsConsumer = subset(raw2, [	"applicantType", "title", "name1", "name2", "name3", "surname", "dateOfBirth",
												"placeOfBirth", "aliasName", "previousCompanyName", "sex", "nationality",
												"consentFlag", "dateConsentGiven", "primaryIDType", "primaryID",
												"primaryIDExpiry", "primaryIDIssueDate", "primaryIDIssuePlace",
												"primaryIDAuthority", "secondaryIDType", "secondaryID", "secondaryIDExpiry",
												"secondaryIDIssueDate", "secondaryIDIssuePlace", "secondaryIDAuthority",
												"drivingLicenseNbr", "medicalNbr", "privateEntrepreneurNbr",
												"privateEntrepreneurNbrIssueDate", "privateEntrepreneurEGRN",
												"previousPassportNbr", "primaryIncome", "primaryIncomeFreq",
												"primaryIncomeFlag", "otherIncome", "residentialStatus", "occupation",
												"occupationStatus", "maritalStatus", "numberOfDependants", "education",
												"mobileTelNbr", "mobileRegistration", "visaCCHeld", "mastercardCCHeld",
												"dinersCCHeld", "amExpressCCHeld", "jcbCCHeld", "debitCCHeld",
												"chqGteeCCHeld", "retailCCHeld", "otherCCHeld" ]								);

			raw2.Employer.s = forceArray(raw2.Employer.s);
			capsConsumer.caps_consumer_employer = multi(raw2.Employer.s, [	"name", "idNumber", "currentPreviousIndicator",
																			"startDate", "endDate", "timeWithEmployer", "flatNbr",
																			"houseNbr", "buildingNbr", "line1", "line2", "line3",
																			"line4", "regionCode", "postCode", "country",
																			"workTelNbr", "workMobileTelNbr" ]					);

			raw2.Address.s = forceArray(raw2.Address.s);
			capsConsumer.caps_consumer_address = multi(raw2.Address.s, [	"addressType", "addressFlag", "flatNbr", "houseNbr",
																			"buildingNbr", "line1", "line2", "line3", "line4",
																			"regionCode", "postCode", "country", "startDate",
																			"endDate", "timeAtAddress", "homeTelNbr" ]			);

			raw2.Verification = forceArray(raw2.Verification);
			capsConsumer.caps_consumer_verification = multi(raw2.Verification, [	"status" ]									);

			caps.caps_consumer.push(capsConsumer);
		}

		r.caps.push(caps);
	}

	return r;
}

module.exports = convert;

