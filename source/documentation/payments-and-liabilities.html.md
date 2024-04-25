---
title: Payments and liabilities | Income Tax (Making Tax Digital) end-to-end service guide
weight: 7
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

<!--- Section owner: MTD Programme --->

# Payments and liabilities

The [Self Assessment Accounts API](/api-documentation/docs/api/service/self-assessment-accounts-api/) has a suite of endpoints that retrieve the customer’s payment and liability information. The data returned relates only to payments and liabilities arising for tax years since the customer joined the new service. There may also be outstanding liabilities and payment information a customer needs to view for the years before signing up to Making Tax Digital for Income Tax Self Assessment that can be viewed using the HMRC online services account.

The endpoints allow the customer to complete the following tasks:

* view a list of MTD charges and their due dates
* view the history of payments made to HMRC and how the money was used
* view the history of changes made to an individual charge

A customer, at any time, can view a breakdown of their MTD liabilities for a given date range. In software, this is done by calling the [Retrieve Self Assessment Balance and Transactions](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Payments-and-Liabilities/paths/~1accounts~1self-assessment~1%7Bnino%7D~1balance-and-transactions/get) endpoint. Customer liabilities in the endpoint are broken down into overdue, currently due (payable), and pending (not yet due) amounts.

<a href="figures/payments-and-liabilities-rsab.svg" target="blank"><img src="figures/payments-and-liabilities-rsab.svg" alt="Retrieve a Self Assessment Balance Transactions diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsab.svg" target="blank">Open the Retrieve a Self Assessment Balance and Transactions diagram in a new tab</a>.

A customer, at any time, can view a history of their MTD payments for a given date range. In software, this is done by calling the [List Self Assessment Payments and Allocation Details](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Payments-and-Liabilities/paths/~1accounts~1self-assessment~1%7Bnino%7D~1payments-and-allocations/get) endpoint. The endpoint also retrieves details about how each payment was used by HMRC.

<a href="figures/payments-and-liabilities-lsat.svg" target="blank"><img src="figures/payments-and-liabilities-lsat.svg" alt="List Self Assessment Transactions diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-lsat.svg" target="blank">Open the List Self Assessment Payments and Allocation Details diagram in a new tab</a>.

A customer, at any time, can view the history of changes made to an individual charge. In software, this is done by calling the [Retrieve History of a Self-Assessment Charge](/api-documentation/docs/api/service/self-assessment-accounts-api/2.0/oas/page#tag/Payments-and-Liabilities/paths/~1accounts~1self-assessment~1%7Bnino%7D~1charges~1%7BtransactionId%7D/get) endpoint.

<a href="figures/payments-and-liabilities-rsach.svg" target="blank"><img src="figures/payments-and-liabilities-rsach.svg" alt="Retrieve a Self Assessment Charge's History diagram" style="width:720px;" /></a>

<a href="figures/payments-and-liabilities-rsach.svg" target="blank">Open the Retrieve a Self Assessment Charge's History diagram in a new tab</a>.

