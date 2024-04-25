---
title: HMRC online services | Income Tax (Making Tax Digital) end-to-end service guide
weight: 9
description: Sign in to HMRC online services to manage your income tax.
---

<!--- Section owner: MTD Programme --->

# HMRC online services
Self-assessment customers who have signed up for Making Tax Digital for Income Tax can [sign into HMRC online services](https://www.gov.uk/log-in-register-hmrc-online-services) to access relevant services. Customers can reach their Making Tax Digital account by clicking the **Making Tax Digital for Income Tax** link.

Software providers need to design a customer journey between software and HMRC online services. Whenever the journey takes the customer to HMRC online services, the service should open in a new browser window. This will allow customers to complete additional tasks not available in the software.

The following table lists the tasks customers will be able to complete through HMRC online services and/or third-party software. For each task, there is a brief explanation about the choice of service (HMRC online services or software or both) used to make the functionality available to customers.

| Task | Status | HMRC online services | Software | Reason for service choice |
| ---- | ------ | -------------------- | -------- | -------- |
| [Change contact preference between paper and digital secure messages](#changing-contact-preference-between-paper-and-digital-secure-messages) | Live | Yes | No | For security reasons, this functionality is available only in HMRC online services. |
| Change business details | Future development | Yes | No | All business customers will need access to this functionality. |
| Change the amount of a payment on account | Future development | Yes | No | For security reasons, this functionality will be available only in HMRC online services. |
| Check when updates and payments are due | Live | Yes | Yes | Filing obligations and payment dates must be fully visible to all customers. |
| [Add new business details for a self-employment sole trader or property business](#adding-new-business-details-for-a-self-employment-sole-trader-or-property-business) | Live | Yes | No | All business customers need access to this functionality. |
| [Close (cease) a self-employment sole trader or property business](#closing-ceasing-a-self-employment-sole-trader-or-property-business) | Live | Yes | No | All business customers need access to this functionality. |
| Elect for calendar quarterly periods | Deployed to sandbox | No | Yes | User journey involves setting up software for sending quarterly updates. |
| Submit non-MTD income and allowance types required to complete a self assessment tax return | Live | Yes | Yes | Available in HMRC online services because some software applications might not support all income and allowance types. |
| View Self Assessment tax calculations for in-year, forecast, and final declaration | Live | Yes | Yes | All users need access to this functionality. |
| Print a Self Assessment SA302 tax calculation | Future development | Yes | Yes | Pending future discovery research and analysis. |
| Check how much is owed through MTD | Live | Yes | Yes | All users need access to this functionality. |
| Request a budget payment plan | Future development | Yes | No | For security reasons, this functionality will be available only in HMRC online services. |
| Request a time to pay | Future development | Yes | No | For security reasons, this functionality will be available only in HMRC online services. |
| [Make a payment](#making-a-payment) | Live | Yes | No | Functionality will be available in software as part of a future HMRC delivery. |
| Check money in the account | Live | Yes | Yes | All users need access to this functionality. |
| [Claim a refund](#claiming-a-refund) | Under development  | Yes | No | For security reasons, this functionality will be available only in HMRC online services. Discovery is pending on end of year repayments. |
| Check refund details and status | Under development  | Yes | No | For security reasons, this functionality will be available only in HMRC online services. Discovery is pending on end of year repayments. |
| Provide bank details for future refunds | Future development | Yes | No | For security reasons, this functionality will be available only in HMRC online services. |
| [Leave MTD as a voluntary customer](#opting-out-of-mtd) | Future development | Yes | No | Availability as a software service depends on user need. |
| Sign up to MTD as a voluntary customer for those who have previously opted out of MTD | Future development | Yes | No | Availability as a software service depends on user need. |

Agents will be able to access Making Tax Digital for Income Tax services through their agent services account. They will be able to access all current and future services on behalf of their clients including the services listed in the above table, except for:

- changing their client’s repayment bank details 
- changing their client’s contact preference
- setting up a time-to-pay arrangement or budget payment plan

## Changing contact preference between paper and digital secure messages

To make MTD communication accessible to all customers, HMRC has provided them with a contact preference for paper or digital methods.  If customers have selected a digital preference, they will be able to view communications sent to them by HMRC through a secure mailbox accessible through HMRC online services.  HMRC encourages customers to sign up for digital messages as they will get reminders for when to make different updates and payments, which is not available through paper messages. 

## Adding new business details for a self-employment sole trader or property business

New self-employment and property businesses can be added using HMRC online services as soon as the business has started. Customers will have a grace period of up to 2 years before the business is included in MTD if the total qualifying income from all business income is over the MTD threshold.  If a customer adds the new business within the 2-year grace period, they can choose to bring it into MTD immediately and commence voluntary quarterly updates or can decide to keep it outside of MTD and submit the income annually after the year end as normal on their SA return.

After a new business is added, it can be seen almost immediately in software when the next API call is made to the [Business Details API](/api-documentation/docs/api/service/business-details-api/). Customers can submit updates or an annual return for this new business on the same day.

Customers need to provide the following information to add a new business source.

| Self employment | UK and foreign property |
| --------------- | ----------------------- |
| Start date | Start date |
| Business address | Accounting method |
| Nature of business |  |
| Business name |  |
| Accounting method |  |

If the customer has more than one self employment source, they all must have the same accounting method.

## Closing (ceasing) a self-employment sole trader or property business

Self employment and property businesses can be ceased by entering the date the business ended using HMRC online services. However, when ceasing a property business, the customer needs to do this only when they no longer receive any type of rental income from all of their properties. Customers within MTD will be required to submit quarterly updates for the periods up to the date the business ended and any future quarterly obligations will be removed. After a business ceases, customers will not report post-cessation receipts or expenses through subsequent quarterly updates. Additional guidance on their reporting will be provided in due course.

Customers must update HMRC online services with the cease date as soon as possible to avoid late penalties that could be raised against future quarterly obligations. 

After a business has been updated as ceased, it can be seen almost immediately in software when the next API call is made to the [Business Details API](/api-documentation/docs/api/service/business-details-api/). Customers can submit updates or an annual return for this new business on the same day.

In the future, it will be possible to reopen a closed business or change an incorrectly entered end date.

## Making a Payment

Customers can make a payment towards their liability through HMRC online services or there is an alternative route which is detailed on [Pay your Self Assessment tax bill: Overview - GOV.UK (www.gov.uk)](https://www.gov.uk/pay-self-assessment-tax-bill?_ga=2.87410077.442895640.1693813671-569616403.1678098699&_gl=1*xnov4c*_ga*NTY5NjE2NDAzLjE2NzgwOTg2OTk.*_ga_Y4LWMWY6WS*MTY5NDAxMTU5Ny43LjEuMTY5NDAxMTYwOS4wLjAuMA..). 

When a payment is made, the current payment service will first check to see if there is any outstanding liability from previous Self Assessment Tax returns, and it will prioritise the allocation of funds there.  Following that allocation, if there is any payment remaining, it will be allocated to any unpaid Payment on account charges  or  owed liability following an MTD final declaration.  If those remaining funds don’t fully cover that MTD liability, this still must  be paid by 31st January.  In this instance, the [Self Assessment Accounts API](/api-documentation/docs/api/service/self-assessment-accounts-api/) can be used through software to see how much of their MTD liability is outstanding. However, it will not show them the amount that has been apportioned to previous tax year self assessment returns.  To view this, a customer will need to access HMRC online services.   

## Claiming a refund

For current MTD customers, a refund must be claimed by contacting HMRC. Claiming a refund through HMRC online services is scheduled for future development and we will provide further information here when available.

## Opting out of MTD

Customers who are in MTD on a voluntary basis can leave (opt out) at any time. When this happens the customer’s filing obligations will change from MTD (quarterly) to a single annual obligation due on 31 January following the end of the tax year - this is their final declaration. It is important to note that even if a customer opts out of MTD, they can continue using the software as long as it supports submission for annual self-employment and property income.

Eligibility to opt out is determined on a tax year basis. For example, a customer can be mandated for the current year and voluntary for the next year, meaning the customer could opt out next year. A customer can opt out for the previous tax year if they signed up to MTD as a voluntary customer, then subsequently decided not to submit quarterly - opting out would allow the customer to file on an annual basis for that year.

The opt out service will not be available through an API. Customers and agents must use different methods to view any changes to filing obligations.

| User type | Method |
| --------- | ------ |
| Customer | Use their HMRC online services account to access the opt out service and view their changed obligations immediately. |
| Agent | Use their Agent Services Account to access their client’s account. Changed obligations will be viewable immediately in their software. |

If the customer has submitted updates of business income and expenses (self-employment and/or property) through their software for the tax year they opt out of MTD, these updates will be deleted. The customer or their agent will receive a warning message to inform them that this is going to happen. The total business income and expenses (for the tax year) must then be submitted as part of the customer’s tax return before completing their final declaration.

If a customer is mandated to be in MTD, they will not be eligible to opt out. The opt out service will only be available in HMRC online services for eligible customers.

## Future development
The following tasks are scheduled for future development and we will provide more information about them when available:

- change business details
- change the amount of a payment on account
- print a Self Assessment SA302 tax calculation
- request a budget payment plan
- request a time to pay
- provide bank details for future repayments
- leave MTD as a voluntary customer
- sign up to MTD as a voluntary customer for those who have previously opted out of MTD

