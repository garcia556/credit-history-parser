"use strict";

var root = {};

//////////////////////////////////////////////////////////////////////

root.root =
`insert into dwh.okb_root
values
(
	default,
	$(application_id),
	to_timestamp($(responseDate), 'YYYYMMDDHH24MISS'),
	$(errorCode),
	$(streamID),
	$(pvs___status)
)
returning
	root_id`;

///////////////////////////////////

root.validationerrors =
`insert into dwh.okb_validationerrors
values
(
	$(root_id),
	$(number),
	$(field),
	$(path),
	$(value),
	$(extra1),
	$(extra2)
)`;

///////////////////////////////////

root.summary =
`insert into dwh.okb_summary
values
(
	$(root_id),
	$(CAISDistribution1),
	$(CAISDistribution2),
	$(CAISDistribution3),
	$(CAISDistribution4),
	$(CAISDistribution5),
	$(CAISDistribution5Plus),
	$(CAISRecordsGuarantor),
	$(CAISRecordsguarantorRecip),
	$(CAISRecordsJoint),
	$(CAISRecordsJointRecip),
	$(CAISRecordsOwner),
	$(CAISRecordsOwnerRecip),
	$(CAISRecordsReferee),
	$(CAISRecordsRefereeRecip),
	$(CAPSDistribution1),
	$(CAPSDistribution2),
	$(CAPSDistribution3),
	$(CAPSDistribution4),
	$(CAPSDistribution5),
	$(CAPSDistribution5Plus),
	$(CAPSLast1MonthsGuarantor),
	$(CAPSLast1MonthsJoint),
	$(CAPSLast1MonthsOwner),
	$(CAPSLast1MonthsReferee),
	$(CAPSLast3MonthsGuarantor),
	$(CAPSLast3MonthsJoint),
	$(CAPSLast3MonthsOwner),
	$(CAPSLast3MonthsReferee),
	$(CAPSLast6MonthsGuarantor),
	$(CAPSLast6MonthsJoint),
	$(CAPSLast6MonthsOwner),
	$(CAPSLast6MonthsReferee),
	$(CAPSRecordsGuarantor),
	$(CAPSRecordsGuarantorBeforeFilter),
	$(CAPSRecordsJoint),
	$(CAPSRecordsJointBeforeFilter),
	$(CAPSRecordsOwner),
	$(CAPSRecordsOwnerFilter),
	$(CAPSRecordsReferee),
	$(CAPSRecordsRefereeFilter),
	$(checkOther1),
	$(checkOther2),
	$(checkOther3),
	$(checkOther4),
	$(checkOther5),
	$(checkOther6),
	$(checkOther7),
	$(checkOther8),
	$(checkOther9),
	$(checkOther10),
	$(checkOther11),
	$(checkOther12),
	$(checkOther13),
	$(checkOther14),
	$(checkOther15),
	$(checkOther16),
	$(checkOther17),
	$(checkOther18),
	$(checkOther19),
	$(checkOther20),
	$(ConsumerEnquiryCountLast12Month),
	$(PotentialMonthlyInstalmentsAllButOwner),
	$(PotentialMonthlyInstalmentsOwner),
	$(PotentialOutstandingBalanceAllButOwner),
	$(PotentialOutstandingBalanceOwner),
	$(TotalMonthlyInstalmentsAllButOwner),
	$(TotalMonthlyInstalmentsOwner),
	$(TotalOutstandingBalanceAllButOwner),
	$(TotalOutstandingBalanceOwner),
	$(WorstCurrentPayStatusGuarantor),
	$(WorstCurrentPayStatusJoint),
	$(WorstCurrentPayStatusOwner),
	$(WorstCurrentPayStatusReferee),
	$(WorstEverpayStatusGuarantor),
	$(WorstEverpayStatusJoint),
	$(WorstEverpayStatusOwner),
	$(WorstEverpayStatusReferee)
)`;

///////////////////////////////////

root.cais =
`insert into dwh.okb_cais
values
(
	default,
	$(root_id),
	$(accountClass),
	$(consumerAccountNumber),
	to_timestamp($(openDate), 'YYYYMMDDHH24MISS'),
	$(numOfApplicants),
	$(currency),
	$(financeType),
	$(purposeOfFinance),
	$(amountOfFinance),
	$(creditLimit),
	$(duration),
	$(durationUnit),
	$(instalment),
	$(paymentFrequency),
	$(typeOfSecurity),
	$(insuredLoan),
	$(amountInsuredLoan),
	$(interestRate),
	$(creditFacilityStatus),
	$(accountPaymentStatus),
	$(outstandingBalance),
	$(arrearsBalance),
	to_timestamp($(fulfilmentDueDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(lastPaymentDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(accountClosedDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(defaultDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(litigationDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(writeOffDate), 'YYYYMMDDHH24MISS'),
	$(reasonForClosure),
	$(accountSpecialStatus),
	to_timestamp($(lastMissedPaymentDate), 'YYYYMMDDHH24MISS'),
	$(recordBlockDisputeIndicator),
	to_timestamp($(dateAccountAdded), 'YYYYMMDDHH24MISS'),
	to_timestamp($(lastUpdateTS), 'YYYYMMDDHH24MISS'),
	to_timestamp($(monthOfLastUpdate), 'YYYYMMDDHH24MISS'),
	$(subscriberComments),
	$(accountHolderComments),
	$(worstPaymentStatus),
	$(totalAmountOfFinance),
	$(securedAmount),
	to_timestamp($(securityStartDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(securityEndDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(interestPaymentDate), 'YYYYMMDDHH24MISS'),
	$(sourceOfPayment),
	$(applicationNumber),
	$(infoPartFlag),
	$(cbrFinanceType),
	$(legalAccountNumber),
	$(totalCostOfFinanceInPercent)
)
returning
	cais_id`;

///////////////////////////////////

root.cais_monthlyhistory =
`insert into dwh.okb_cais_monthlyhistory
values
(
	$(cais_id),
	to_timestamp($(historyDate), 'YYYYMMDDHH24MISS'),
	$(accountPaymentHistory),
	$(accountBalance),
	$(arrearsBalance),
	$(instalment),
	$(creditLimit),
	$(paymentSource)
)`;

///////////////////////////////////

root.cais_consumer =
`insert into dwh.okb_cais_consumer
values
(
	default,
	$(cais_id),
	$(accountHolderType),
	$(title),
	$(name1),
	$(name2),
	$(name3),
	$(surname),
	$(primaryIDType),
	$(primaryID),
	to_timestamp($(primaryIDIssueDate), 'YYYYMMDDHH24MISS'),
	$(primaryIDPlaceOfIssue),
	to_timestamp($(primaryIDExpiry), 'YYYYMMDDHH24MISS'),
	$(primaryIDAuthority),
	$(secondaryIDType),
	$(secondaryID),
	to_timestamp($(secondaryIDIssueDate), 'YYYYMMDDHH24MISS'),
	$(secondaryIDPlaceOfIssue),
	to_timestamp($(secondaryIDExpiry), 'YYYYMMDDHH24MISS'),
	$(secondaryIDAuthority),
	$(pensionNbr),
	$(privateEntrepreneurNbr),
	to_timestamp($(privateEntrepreneurNbrIssueDate), 'YYYYMMDDHH24MISS'),
	$(privateEntrepreneurEGRN),
	$(previousPassportNbr),
	$(aliasName),
	$(previousCompanyName),
	$(sex),
	to_timestamp($(dateOfBirth), 'YYYYMMDDHH24MISS'),
	$(placeOfBirth),
	$(nationality),
	$(consentFlag),
	to_timestamp($(dateConsentGiven), 'YYYYMMDDHH24MISS'),
	$(mobileTelNbr)
)
returning
	cais_consumer_id`;

///////////////////////////////////

root.cais_consumer_employer =
`insert into dwh.okb_cais_consumer_employer
values
(
	default,
	$(cais_consumer_id),
	$(name),
	$(idNumber),
	$(currentPreviousIndicator),
	to_timestamp($(startDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(endDate), 'YYYYMMDDHH24MISS'),
	$(flatNbr),
	$(houseNbr),
	$(buildingNbr),
	$(line1),
	$(line2),
	$(line3),
	$(line4),
	$(regionCode),
	$(postCode),
	$(country),
	$(telephoneNumber)
)
returning
	cais_consumer_employer_id`;

///////////////////////////////////

root.cais_consumer_address =
`insert into dwh.okb_cais_consumer_address
values
(
	$(cais_consumer_id),
	$(type),
	$(addressCurrPrev),
	$(flatNbr),
	$(houseNbr),
	$(buildingNbr),
	$(line1),
	$(line2),
	$(line3),
	$(line4),
	$(regionCode),
	$(postCode),
	$(country),
	to_timestamp($(startDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(endDate), 'YYYYMMDDHH24MISS'),
	$(homeTelNbr)
)`;

///////////////////////////////////

root.cais_consumer_legal =
`insert into dwh.okb_cais_consumer_legal
values
(
	$(cais_consumer_id),
	$(courtJudgementOrder),
	$(courtName),
	to_timestamp($(dateOfJudgement), 'YYYYMMDDHH24MISS'),
	$(judgementType),
	$(resolution),
	$(amountOfRecovery),
	$(currency)
)`;

///////////////////////////////////

root.cais_consumer_warranty =
`insert into dwh.okb_cais_consumer_warranty
(
	default,
	$(cais_consumer_id),
	$(warrantyAgreementNumber),
	$(accFinanceType),
	$(accCBRFinanceType),
	$(accCurrency),
	$(accAmountOfFinance),
	$(accTotalAmountOfFinance),
	$(accTotalOutstandingBalance),
	to_timestamp($(warrantyMonthOfLastUpdate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(warrantyLastUpdateTS), 'YYYYMMDDHH24MISS'),
	$(warrantyAmount),
	to_timestamp($(warrantyOpenDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(warrantyDueDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(warrantyClaimDate), 'YYYYMMDDHH24MISS'),
	$(warrantyCreditLimit),
	to_timestamp($(dateWarrantyAdded), 'YYYYMMDDHH24MISS'),
	$(warrantyOutstandingBalance),
	$(warrantyInstalmentAmount),
	to_timestamp($(warrantyInstalmentDate), 'YYYYMMDDHH24MISS'),
	$(warrantyPaymentStatus),
	$(warrantyArrearsBalance),
	to_timestamp($(warrantyCloseDate), 'YYYYMMDDHH24MISS'),
	$(warrantyReasonForClosure),
	$(legalWarrantyAgreementNumber),
	$(subscriberComments)
)
returning
	cais_consumer_warranty_id`;

///////////////////////////////////

root.cais_consumer_warranty_history =
`insert into dwh.okb_cais_consumer_warranty_history
values
(
	$(cais_consumer_warranty_id),
	$(accTotalOutstandingBalance),
	$(warrantyOutstandingBalance),
	$(warrantyInstalmentAmount),
	to_timestamp($(historyDate), 'YYYYMMDDHH24MISS'),
	$(warrantyPaymentHistoryStatus),
	$(warrantyArrearsBalance)
)`;

///////////////////////////////////

root.cais_consumer_lien =
`insert into dwh.okb_cais_consumer_lien
values
(
	$(cais_id),
	$(lienAgreementNumber),
	$(lieneeName),
	$(collateralID),
	$(collateralIDType),
	$(collateralName),
	$(collateralAddress),
	$(collateralEstimatedValue),
	$(collateralCurrency),
	to_timestamp($(collateralEstimateDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(lienAgreementOpenDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(lienAgreementDueDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(lienClosedDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(collateralStartDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(collateralEndDate), 'YYYYMMDDHH24MISS'),
	$(lienReasonForClosure),
	$(lienComments)
)`;

///////////////////////////////////

root.cais_assignee =
`insert into dwh.okb_cais_assignee
values
(
	$(cais_id),
	to_timestamp($(assDate), 'YYYYMMDDHH24MISS'),
	$(assComment)
)`;

///////////////////////////////////

root.cais_guarantee =
`insert into dwh.okb_cais_guarantee
values
(
	$(cais_id),
	$(guarAgreementNumber),
	$(guarantorName),
	$(guarCoveredAmount),
	$(guarCoveredAmountCurrency),
	$(guarAmount),
	$(guarAmountCurrency),
	to_timestamp($(guarOpenDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(guarDueDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(guarCloseDate), 'YYYYMMDDHH24MISS'),
	$(guarReasonForClosure)
)`;

///////////////////////////////////

root.guar =
`insert into dwh.okb_guar
values
(
	default,
	$(root_id),
	$(guarAgreementNumber),
	$(guarantorName),
	$(guarCoveredAmount),
	$(guarCoveredAmountCurrency),
	$(guarAmount),
	$(guarAmountCurrency),
	to_timestamp($(guarOpenDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(guarDueDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(guarCloseDate), 'YYYYMMDDHH24MISS'),
	$(guarReasonForClosure),
	$(guarNumOfHolders),
	to_timestamp($(guarDateAdded), 'YYYYMMDDHH24MISS'),
	to_timestamp($(guarLastUpdateTS), 'YYYYMMDDHH24MISS'),
	to_timestamp($(monthOfLastUpdate), 'YYYYMMDDHH24MISS')
)
returning
	guar_id`;

///////////////////////////////////

root.guar_consumer =
`insert into dwh.okb_guar_consumer
values
(
	deault,
	$(guar_id),
	$(accountHolderType),
	$(title),
	$(name1),
	$(name2),
	$(surname),
	$(primaryIDType),
	$(primaryID),
	to_timestamp($(primaryIDIssueDate), 'YYYYMMDDHH24MISS'),
	$(primaryIDPlaceOfIssue),
	to_timestamp($(primaryIDExpiry), 'YYYYMMDDHH24MISS'),
	$(primaryIDAuthority),
	$(secondaryIDType),
	$(secondaryID),
	to_timestamp($(secondaryIDIssueDate), 'YYYYMMDDHH24MISS'),
	$(secondaryIDPlaceOfIssue),
	to_timestamp($(secondaryIDExpiry), 'YYYYMMDDHH24MISS'),
	$(secondaryIDAuthority),
	$(pensionNbr),
	$(privateEntrepreneurNbr),
	to_timestamp($(privateEntrepreneurNbrIssueDate), 'YYYYMMDDHH24MISS'),
	$(privateEntrepreneurEGRN),
	$(previousPassportNbr),
	$(aliasName),
	$(previousCompanyName),
	$(sex),
	to_timestamp($(dateOfBirth), 'YYYYMMDDHH24MISS'),
	$(placeOfBirth),
	$(nationality),
	$(consentFlag),
	to_timestamp($(dateConsentGiven), 'YYYYMMDDHH24MISS'),
	$(mobileTelNbr)
)`;

///////////////////////////////////

root.guar_consumer_address =
`insert into dwh.okb_guar_consumer_address
values
(
	$(guar_consumer_id),
	$(type),
	$(addressCurrPrev),
	$(flatNbr),
	$(houseNbr),
	$(buildingNbr),
	$(line1),
	$(line2),
	$(line3),
	$(line4),
	$(regionCode),
	$(postCode),
	$(country),
	to_timestamp($(startDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(endDate), 'YYYYMMDDHH24MISS'),
	$(homeTelNbr)
)`;

///////////////////////////////////

root.nameidhistory =
`insert into dwh.okb_nameidhistory
values
(
	$(root_id),
	$(idChangeSource),
	to_timestamp($(idChangeDate), 'YYYYMMDDHH24MISS'),
	$(idType),
	$(idNbr),
	to_timestamp($(idIssueDate), 'YYYYMMDDHH24MISS'),
	$(idPlaceOfIssue),
	$(idAuthority),
	to_timestamp($(idExpiryDate), 'YYYYMMDDHH24MISS'),
	$(idStatus),
	$(pensionNbr),
	$(surname),
	$(name1),
	$(name2),
	to_timestamp($(dateOfBirth), 'YYYYMMDDHH24MISS'),
	$(placeOfBirth),
	$(sex),
	$(judgementType),
	$(newIdNbr),
	$(comments)
)`;

///////////////////////////////////

root.caps =
`insert into dwh.okb_caps
values
(
	default,
	$(root_id),
	$(accountClass),
	$(streamID),
	$(reason),
	to_timestamp($(enquiryDate), 'YYYYMMDDHH24MISS'),
	$(nbrOfApplicants),
	$(purposeOfFinance),
	$(applicationNumber),
	to_timestamp($(applicationDate), 'YYYYMMDDHH24MISS'),
	$(financeType),
	$(currency),
	$(creditLimit),
	$(amountOfFinance),
	$(initialDepositAmount),
	$(finalPaymentAmount),
	$(duration),
	$(durationUnits),
	$(instalmentAmount),
	$(paymentFrequency),
	$(typeOfSecurity),
	$(disputeIndicator),
	$(comments),
	$(applicationChannel),
	$(cbrFinanceType)
)
returning
	caps_id`;

///////////////////////////////////

root.caps_decision =
`insert into dwh.okb_caps_decision
values
(
	$(caps_id),
	$(streamID),
	$(typeOfDecision),
	to_timestamp($(dateOfDecision), 'YYYYMMDDHH24MISS'),
	to_timestamp($(decisionEndDate), 'YYYYMMDDHH24MISS'),
	$(decisionReason),
	$(decisionAmount),
	$(currency),
	$(comments)
)`;

///////////////////////////////////

root.caps_consumer =
`insert into dwh.okb_caps_consumer
values
(
	default,
	$(caps_id),
	$(applicantType),
	$(title),
	$(name1),
	$(name2),
	$(name3),
	$(surname),
	to_timestamp($(dateOfBirth), 'YYYYMMDDHH24MISS'),
	$(placeOfBirth),
	$(aliasName),
	$(previousCompanyName),
	$(sex),
	$(nationality),
	$(consentFlag),
	to_timestamp($(dateConsentGiven), 'YYYYMMDDHH24MISS'),
	$(primaryIDType),
	$(primaryID),
	to_timestamp($(primaryIDExpiry), 'YYYYMMDDHH24MISS'),
	to_timestamp($(primaryIDIssueDate), 'YYYYMMDDHH24MISS'),
	$(primaryIDIssuePlace),
	$(primaryIDAuthority),
	$(secondaryIDType),
	$(secondaryID),
	to_timestamp($(secondaryIDExpiry), 'YYYYMMDDHH24MISS'),
	to_timestamp($(secondaryIDIssueDate), 'YYYYMMDDHH24MISS'),
	$(secondaryIDIssuePlace),
	$(secondaryIDAuthority),
	$(drivingLicenseNbr),
	$(medicalNbr),
	$(privateEntrepreneurNbr),
	to_timestamp($(privateEntrepreneurNbrIssueDate), 'YYYYMMDDHH24MISS'),
	$(privateEntrepreneurEGRN),
	$(previousPassportNbr),
	$(primaryIncome),
	$(primaryIncomeFreq),
	$(primaryIncomeFlag),
	$(otherIncome),
	$(residentialStatus),
	$(occupation),
	$(occupationStatus),
	$(maritalStatus),
	$(numberOfDependants),
	$(education),
	$(mobileTelNbr),
	$(mobileRegistration),
	$(visaCCHeld),
	$(mastercardCCHeld),
	$(dinersCCHeld),
	$(amExpressCCHeld),
	$(jcbCCHeld),
	$(debitCCHeld),
	$(chqGteeCCHeld),
	$(retailCCHeld),
	$(otherCCHeld)
)
returning
	caps_consumer_id`;

///////////////////////////////////

root.caps_consumer_employer =
`insert into dwh.okb_caps_consumer_employer
values
(
	default,
	$(caps_consumer_id),
	$(name),
	$(idNumber),
	$(currentPreviousIndicator),
	to_timestamp($(startDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(endDate), 'YYYYMMDDHH24MISS'),
	$(timeWithEmployer),
	$(flatNbr),
	$(houseNbr),
	$(buildingNbr),
	$(line1),
	$(line2),
	$(line3),
	$(line4),
	$(regionCode),
	$(postCode),
	$(country),
	$(workTelNbr),
	$(workMobileTelNbr)
)
returning
	caps_consumer_employer_id`;

///////////////////////////////////

root.caps_consumer_address =
`insert into dwh.okb_caps_consumer_address
values
(
	$(caps_consumer_id),
	$(addressType),
	$(addressFlag),
	$(flatNbr),
	$(houseNbr),
	$(buildingNbr),
	$(line1),
	$(line2),
	$(line3),
	$(line4),
	$(regionCode),
	$(postCode),
	$(country),
	to_timestamp($(startDate), 'YYYYMMDDHH24MISS'),
	to_timestamp($(endDate), 'YYYYMMDDHH24MISS'),
	$(timeAtAddress),
	$(homeTelNbr)
)`;

///////////////////////////////////

root.caps_consumer_verification =
`insert into dwh.okb_caps_consumer_verification
values
(
	$(caps_consumer_id),
	$(status)
)`;

///////////////////////////////////

root.warnings =
`insert into dwh.okb_warnings
values
(
	$(root_id),
	$(value)
)`;

//////////////////////////////////////////////////////////////////////

module.exports = root;

