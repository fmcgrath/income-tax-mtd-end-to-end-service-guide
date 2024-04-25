---
title: Using tax codes to collect tax due | Income Tax (Making Tax Digital) end-to-end service guide
weight: 33
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

<!--- Section owner: MTD Programme --->

# Using tax codes to collect tax due

When a Self Assessment customer receives PAYE income in addition to business income, HMRC will try to collect any Self Assessment tax owed through their tax code for the following tax year.

However, if there is a change in the customer's tax code, it may no longer be possible to collect the tax owed using this method. As a result, any amount collected will be returned to the customer’s account. For more information, refer to [Pay your Self Assessment tax bill: Through your tax code (GOV.UK)](https://www.gov.uk/pay-self-assessment-tax-bill/through-your-tax-code).

‘Coding out’ refers to the use of tax codes to collect tax and debts due to HMRC. The coding out underpayments and debts endpoints in the [Self Assessment Accounts API](/api-documentation/docs/api/service/self-assessment-accounts-api/) enable the customer to complete the following tasks: 

- view coding out underpayment and debt amounts
- create or amend coding out underpayment and debt amounts
- delete coding out underpayment and debt amounts

A customer can view the coded out Self Assessment underpayments stored by HMRC and the amount submitted for the previous tax year at any time. In the software, this is done by calling the [Retrieve Coding Out Underpayments and Debt Amounts](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Coding-Out-Underpayments-and-Debts/paths/~1accounts~1self-assessment~1%7Bnino%7D~1%7BtaxYear%7D~1collection~1tax-code/get) endpoint.

At the end of the tax year, the customer will review their calculations before submitting the final declaration. If the customer does not agree with the coded out amount in their calculation shown by HMRC, they can submit what they believe to be the correct coded out amount. This can be corrected more than once if needed, but it needs to be done before the final declaration is submitted. In the software, this amendment is done by calling the [Create or Amend Coding Out Underpayments and Debt Amounts](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Coding-Out-Underpayments-and-Debts/paths/~1accounts~1self-assessment~1%7Bnino%7D~1%7BtaxYear%7D~1collection~1tax-code/put) endpoint. This endpoint can be used only after the tax year has ended.

If the customer has submitted an amendment to the coded out amount after the end of the tax year but later realises they agree with the coded out amount shown by HMRC, they can delete their submitted amount. This deletion needs to be done before the final declaration is submitted. In the software, this deletion is done by calling the [Delete Coding Out Underpayments and Debt Amounts](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Coding-Out-Underpayments-and-Debts/paths/~1accounts~1self-assessment~1%7Bnino%7D~1%7BtaxYear%7D~1collection~1tax-code/delete) endpoint.

Coding out is specific to the tax year. If a customer opts out of coding out for a specific tax year, they will not be opted out for future tax years. 

The software can use the following endpoints to enable customers to:

- [Opt Out of Coding Out](/api-documentation/docs/api/service/self-assessment-accounts-api/3.0/oas/page#tag/Coding-Out-Status/paths/~1accounts~1self-assessment~1{nino}~1{taxYear}~1collection~1tax-code~1coding-out~1opt-out/post) 
- [Retrieve Coding Out Status](/api-documentation/docs/api/service/self-assessment-accounts-api/3.0/oas/page#tag/Coding-Out-Status/paths/~1accounts~1self-assessment~1{nino}~1{taxYear}~1collection~1tax-code~1coding-out~1status/get)
- [Opt in to Coding Out](/api-documentation/docs/api/service/self-assessment-accounts-api/3.0/oas/page#tag/Coding-Out-Status/paths/~1accounts~1self-assessment~1{nino}~1{taxYear}~1collection~1tax-code~1coding-out~1opt-in/post)
