"use strict";

var root = {};

//////////////////////////////////////////////////////////////////////

root.report =
`insert into dwh.nbki_report
values
(
	default,													-- 1
	$(application_id),											-- 2
	$(addOns),													-- 3
	$(groups),													-- 4
	$(inqControlNum),											-- 5
	$(MemberCodeStatus),										-- 6
	$(SuppressionStatus),										-- 7
	to_date($(SubjectReply___fileSinceDt), 'YYYY-MM-DD'),		-- 8
	to_date($(SubjectReply___lastUpdatedDt), 'YYYY-MM-DD'),		-- 9
	$(calc___totalAccts),										-- 10
	$(calc___negativeRating),									-- 11
	$(calc___totalActiveBalanceAccounts),						-- 12
	$(calc___totalHighCredit___Code),							-- 13
	$(calc___totalHighCredit___Value),							-- 14
	$(calc___totalCurrentBalance___Code),						-- 15
	$(calc___totalCurrentBalance___Value),						-- 16
	$(calc___totalPastDueBalance___Code),						-- 17
	$(calc___totalPastDueBalance___Value),						-- 18
	to_date($(calc___oldest), 'YYYY-MM-DD'),					-- 19
	$(calc___totalOutstandingBalance___Code),					-- 20
	$(calc___totalOutstandingBalance___Value),					-- 21
	$(calc___totalScheduledPaymnts___Code),						-- 22
	$(calc___totalScheduledPaymnts___Value),					-- 23
	to_date($(calc___mostRecentAcc), 'YYYY-MM-DD'),				-- 24
	to_date($(calc___mostRecentOfficialInfo), 'YYYY-MM-DD'),	-- 25
	to_date($(calc___mostRecentBankruptcy), 'YYYY-MM-DD'),		-- 26
	to_date($(calc___mostRecentLegalItem), 'YYYY-MM-DD'),		-- 27
	$(calc___totalBankruptcies),								-- 28
	$(calc___totalLegalItems),									-- 29
	$(calc___totalOfficialInfo),								-- 30
	$(calc___totalInquiries),									-- 31
	$(calc___recentInquiries),									-- 32
	$(calc___collectionsInquiries),								-- 33
	$(calc___mostRecentInqText),								-- 34
	$(calc___totalDisputedAccounts),							-- 35
	$(calc___totalDisputedBankruptcy),							-- 36
	$(calc___totalDisputedLegalItem),							-- 37
	$(calc___totalDisputedOfficialInfo),						-- 38
	to_date($(calc___reportIssueDateTime), 'YYYY-MM-DD'),		-- 39
	$(ctErr___code),											-- 40
	$(ctErr___text),											-- 41
	$(ficoRisk___uniqueId),										-- 42
	$(ficoRisk___errorCode),									-- 43
	$(ficoRisk___errorText),									-- 44
	$(ficoRisk___exclusionCode),								-- 45
	$(ficoRisk___scoreID),										-- 46
	$(ficoRisk___score),										-- 47
	$(ficoRisk___reasonCode1),									-- 48
	$(ficoRisk___reasonCode2),									-- 49
	$(ficoRisk___reasonCode3),									-- 50
	$(ficoRisk___reasonCode4),									-- 51
	$(ficoRisk___derigIndicator),								-- 52
	$(ficoRisk___systemDateTime)								-- 53
)
returning
	report_id`;

///////////////////////////////////

root.personReplies =
`insert into dwh.nbki_personreply
values
(
	$(report_id),								-- 1
	to_date($(birthDt), 'YYYY-MM-DD'),			-- 2
	$(countryBirth),							-- 3
	$(deathFlag),								-- 4
	to_date($(disputedDate), 'YYYY-MM-DD'),		-- 5
	$(disputedRemarks),							-- 6
	$(disputedStatus),							-- 7
	$(disputedStatusText),						-- 8
	to_date($(fileSinceDt), 'YYYY-MM-DD'),		-- 9
	$(first),									-- 10
	$(freezeFlag),								-- 11
	$(gender),									-- 12
	$(genderText),								-- 13
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),	-- 14
	$(maritalStatus),							-- 15
	$(maritalStatusText),						-- 16
	$(name1),									-- 17
	$(nationality),								-- 18
	$(nationalityText),							-- 19
	$(numDependants),							-- 20
	$(oldFirstName),							-- 21
	$(oldSurname),								-- 22
	$(paternal),								-- 23
	$(placeOfBirth),							-- 24
	$(serialNum),								-- 25
	$(suppressFlag)								-- 26
)`;

///////////////////////////////////

root.idReplies =
`insert into dwh.nbki_idreply
values
(
	$(report_id),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(freezeFlag),
	$(idNum),
	$(idType),
	$(idTypeText),
	$(issueAuthority),
	$(issueCountry),
	to_date($(issueDate), 'YYYY-MM-DD'),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(serialNum),
	$(seriesNumber),
	$(suppressFlag)
)`;

///////////////////////////////////

root.inquiryReplies =
`insert into dwh.nbki_inquiryreply
values
(
	$(report_id),
	$(currencyCode),
	$(freezeFlag),
	$(inqAmount),
	$(inqControlNum),
	$(inqPurpose),
	$(inqPurposeText),
	$(inquiryPeriod),
	$(serialNum),
	$(suppressFlag),
	$(userReference)
)`;

///////////////////////////////////

root.accountReplies =
`insert into dwh.nbki_accountreply
values
(
	$(report_id),										-- 1
	$(accountRating),									-- 2
	to_date($(accountRatingDate), 'YYYY-MM-DD'),		-- 3
	$(accountRatingText),								-- 4
	$(acctType),										-- 5
	$(acctTypeText),									-- 6
	$(amtOutstanding),									-- 7
	$(amtPastDue),										-- 8
	to_date($(closedDt), 'YYYY-MM-DD'),					-- 9
	$(collateral2Text),									-- 10
	$(collateralCode),									-- 11
	$(creditLimit),										-- 12
	$(curBalanceAmt),									-- 13
	$(currencyCode),									-- 14
	to_date($(disputedDate), 'YYYY-MM-DD'),				-- 15
	$(disputedRemarks),									-- 16
	$(disputedStatus),									-- 17
	$(disputedStatusText),								-- 18
	to_date($(fileSinceDt), 'YYYY-MM-DD'),				-- 19
	$(freezeFlag),										-- 20
	to_date($(interestPaymentDueDate), 'YYYY-MM-DD'),	-- 21
	$(interestPaymentFrequencyCode),					-- 22
	$(interestPaymentFrequencyText),					-- 23
	to_date($(lastPaymtDt), 'YYYY-MM-DD'),				-- 24
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),			-- 25
	$(monthsReviewed),									-- 26
	$(numDays30),										-- 27
	$(numDays60),										-- 28
	$(numDays90),										-- 29
	to_date($(openedDt), 'YYYY-MM-DD'),					-- 30
	$(ownerIndic),										-- 31
	$(ownerIndicText),									-- 32
	to_date($(paymentDueDate), 'YYYY-MM-DD'),			-- 33
	$(paymtFreqText),									-- 34
	$(paymtPat),										-- 35
	to_date($(paymtPatStartDt), 'YYYY-MM-DD'),			-- 36
	to_date($(reportingDt), 'YYYY-MM-DD'),				-- 37
	$(serialNum),										-- 38
	$(suppressFlag),									-- 39
	$(termsAmt),										-- 40
	$(termsFrequency),									-- 41
	$(businessCategory),								-- 42
	$(completePerformDt),								-- 43
	to_date($(partnerStartDate), 'YYYY-MM-DD')			-- 44
)`;

///////////////////////////////////

root.employmentReplies =
`insert into dwh.nbki_employmentreply
values
(
	$(report_id),
	$(current),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	to_date($(endDt), 'YYYY-MM-DD'),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(freezeFlag),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(name),
	$(occupation),
	$(occupationStatus),
	$(occupationStatusText),
	$(occupationText),
	$(occupationTrade),
	$(occupationTradeText),
	$(serialNum),
	to_date($(startDt), 'YYYY-MM-DD'),
	$(suppressFlag),
	$(title),
	$(titleText)
)`;

///////////////////////////////////

root.addressReplies =
`insert into dwh.nbki_addressreply
values
(
	$(report_id),
	$(addressType),
	$(addressTypeText),
	to_date($(addrSinceDt), 'YYYY-MM-DD'),
	$(apartment),
	$(block),
	$(building),
	$(city),
	$(countryCode),
	$(countryCodeText),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	$(district),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(freezeFlag),
	$(houseNumber),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(postal),
	$(prov),
	$(provText),
	$(resStat),
	$(resStatText),
	$(serialNum),
	$(street),
	$(streetType),
	$(streetTypeText),
	$(subDistrict),
	$(suppressFlag)
)`;

///////////////////////////////////

root.phoneReplies =
`insert into dwh.nbki_phonereply
values
(
	$(report_id),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(freezeFlag),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(number),
	$(phoneType),
	$(phoneTypeText),
	$(serialNum),
	$(suppressFlag)
)`;

///////////////////////////////////

root.bankruptcyReplies =
`insert into dwh.nbki_bankruptcyreply
values
(
	$(report_id),
	$(BankruptcyStatusText),
	$(caseNum),
	$(court),
	to_date($(dischargeDt), 'YYYY-MM-DD'),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(freezeFlag),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(plaintiff),
	to_date($(reportedDt), 'YYYY-MM-DD'),
	$(resolution),
	$(serialNum),
	$(status),
	$(suppressFlag)
)`;

///////////////////////////////////

root.legalItemsReplies =
`insert into dwh.nbki_legalitemsreply
values
(
	$(report_id),
	to_date($(consideredDt), 'YYYY-MM-DD'),
	$(court),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(filingNum),
	$(freezeFlag),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(plaintiff),
	to_date($(reportedDt), 'YYYY-MM-DD'),
	$(resolution),
	to_date($(satisfiedDt), 'YYYY-MM-DD'),
	$(serialNum),
	$(suppressFlag)
)`;

///////////////////////////////////

root.officialInfoReplies =
`insert into dwh.nbki_officialinforeply
values
(
	$(report_id),
	to_date($(dateReported), 'YYYY-MM-DD'),
	to_date($(disputedDate), 'YYYY-MM-DD'),
	$(disputedRemarks),
	$(disputedStatus),
	$(disputedStatusText),
	to_date($(fileSinceDt), 'YYYY-MM-DD'),
	$(freezeFlag),
	$(Information),
	to_date($(lastUpdatedDt), 'YYYY-MM-DD'),
	$(serialNum),
	$(Source),
	$(suppressFlag)
)`;

///////////////////////////////////

root.accounts =
`insert into dwh.nbki_account
values
(
	$(report_id),
	$(serialNum),
	$(acctNum)
)`;

//////////////////////////////////////////////////////////////////////

module.exports = root;

