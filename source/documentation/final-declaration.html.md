---
title: Final declaration | Income Tax (Making Tax Digital) end-to-end service guide
weight: 6
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

<!--- Section owner: MTD Programme --->

# Final declaration
Final declaration is the process that allows customers to finalise their tax position for any one tax year, taking into account all sources of chargeable income and gains, whether business income or otherwise. 

It is also the process by which most formal claims for reliefs and allowances and any deductions are made, where these were previously included within a Self Assessment tax return.

Customers are able to tell us at this point (subject to the existing limits) how they wish any losses available to them to be treated.

Customers can make a final declaration from 6 April Year 1. The deadline for final declaration is 31 January Year 2. The software should remind customers to help them to meet this deadline.

Before starting the final declaration journey, the software package must ensure that for the relevant tax year, the customer:

* has submitted quarterly update information for each business income source (self-employment and property income)
* has finalised EOPS for all their businesses (self-employment and property income)
* has already provided their entire income (for example, interest, dividends, other SA schedules)
* does not have any additional information to provide (for example, information about how to treat a loss)

If your software will not allow customers to report their entire income and reliefs, customers should be informed to report them using HMRC Online Services.

## Making a final declaration

The software will have to let HMRC know that the customer is ready to submit a final declaration. To do this, you must call the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint under the [Individual Calculations (MTD) API](/api-documentation/docs/api/service/individual-calculations-api) with the Final Declaration parameter set to 'true'. This has the following consequences: 

* it starts the final declaration process in HMRC 
* it triggers the business validation rules (which, if violated, produce errors rather than warnings) 
* it generates a final liability calculation and a Calculation ID
* the software must then quote the Calculation ID when retrieving the calculation output using the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint

If the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1{nino}~1self-assessment~1{taxYear}/post) does not pass HMRC validation, it results in an error. For more information, refer to [Tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#tax-calculation). If it results in no errors, the results of the final declaration calculation are available to the software to show the customer.

If a customer thinks the calculation is incorrect based on the data they have submitted, they can go back and change the information by resubmitting the relevant update with the correct information. After they have done this, the software will have to call the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint again to generate a new final liability.

If a customer does not agree with the calculation based on rules HMRC has used, they will need to contact HMRC before submitting their final declaration. If a software vendor identifies a problem with the [Individual Calculations API](/api-documentation/docs/api/service/individual-calculations-api), they will need to contact [SDSTeam@hmrc.gov.uk](mailto:SDSTeam@hmrc.gov.uk).

If a customer thinks the calculation is correct, they can use the [Submit a Self Assessment Final Declaration](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Final-Declaration/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D~1final-declaration/post) endpoint to submit their final declaration. 

**Note:** After a customer has submitted their final declaration, they will not currently be able to amend their submission using their software.

### Agreeing to the declaration

After a customer is confident that they have submitted all the required income tax information through software and HMRC online services, they will have to agree to a declaration and send it to HMRC. When using the software, this is done by using the [Submit a Self Assessment Final Declaration](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Final-Declaration/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D~1final-declaration/post) endpoint.

 > **The Declaration**

> “Before you can submit the information displayed here in response to your notice to file from HM Revenue & Customs, you must read and agree to the following statement by

> [Here the vendor can decide how to manage the actual declaration in the user interface, for example a tick box, confirm button or other method]

> I declare that the information and self-assessment I have filed are (taken together) correct and complete to the best of my knowledge. I understand that I may have to pay financial penalties and face prosecution if I give false information.”

> **Declaration for Agents**

 > "I confirm that my client has received a copy of all the information being filed and approved the information as being correct and complete to the best of their knowledge and belief. My client understands that they may have to pay financial penalties and face prosecution if they give false information."

The software must send the Calculation ID that matches the specific calculation that the customer is agreeing to in the declaration.

## Final declaration user journey

<a href="figures/final-declaration-diagram.svg" target="blank"><img src="figures/final-declaration-diagram.svg" alt="final declaration process API diagram" style="width:720px;" /></a>

<a href="figures/final-declaration-diagram.svg" target="blank">Open the final declaration process diagram in a new tab</a>.

1.	The customer is ready to complete their final declaration.
2.	The software calls the [Trigger a Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D/post) endpoint with the Final Declaration parameter set to 'true'.
3.	HMRC receives the request, starts the tax calculation, and returns a Calculation ID.
4.	The software receives the Calculation ID.
5.	HMRC generates the final declaration tax calculation - this process will also convert any business validation warnings into errors. If there are any errors, the calculation will not run and the customer will not be able to declare the liability.
6.	HMRC Stores the tax calculation with the Calculation ID.
7.	The software uses the Calculation ID to receive details about the calculation or errors using the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint.
8.	HMRC provides the calculation results in case of a successful call. If there are any validation errors, the customer will not be able to view the calculation results.
9.	The software must make the calculation results available to the customer – at this point in the journey, it is mandatory that the customer is shown a copy of the calculation associated with the Calculation ID. As a minimum, a customer must view the equivalent of what is currently in the SA302.
10.	The customer reviews the calculation and the declaration text.
11.	The customer confirms the declaration and the software calls the [Submit a Self Assessment Final Declaration](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Final-Declaration/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D~1final-declaration/post) endpoint using the Calculation ID to confirm the calculation to which the customer is agreeing.
12.	HMRC receives the submission, marks the obligation as fulfilled, and confirms receipt with a success code.
13.	The software receives a success code (HTTP 204) and the software needs to confirm to the customer that HMRC has received the return because HMRC will not communicate this to the customer.
14.	The customer views confirmation that the return has been successfully submitted to HMRC.

## Making an amendment after final declaration

If a customer wants to make any changes following a final declaration, they have 12 months from the statutory filing date to do this (the statutory filing date is 31 January following the end of the tax year). They can make these changes by following the existing [Self Assessment tax returns amendment process](https://www.gov.uk/self-assessment-tax-returns/corrections). These amendments cannot currently be made using software.

**Note:** Any changes made after final declaration will be a formal amendment under section 9ZA TMA 1970.

## Pay or get a repayment

Vendors should present messages to business users at key points in their user journey that gives them the option to make payments ahead of any obligation date to help spread the cost. We will deliver functionality that allows vendors to make users aware of payment dates but the payment itself cannot be made through software.

There are multiple ways to make a payment for Self Assessment which can be found on GOV.UK at:

[https://www.gov.uk/pay-self-assessment-tax-bill](https://www.gov.uk/pay-self-assessment-tax-bill)

Vendors should, in their messaging, ask customers to visit that link so the customer can make a payment in the method that suits them.

The contents of this GOV.UK page will be updated and subject to change.

For a business to view the previous payments it has made to HMRC, vendors should present messages at key points in their journey that encourage them to visit their HMRC Online Services account at:

[https://www.tax.service.gov.uk/business-account](https://www.tax.service.gov.uk/business-account)

Vendors in their messaging should ask customers to visit that link.

Customers can pay their tax bills by direct debit, making it easy and convenient to pay. HMRC is delivering functionality for customers to set up direct debit instructions to pay tax when it becomes due. Customers may also set up a regular payment plan to ensure funds are available when tax becomes due. These services will be available when a customer first subscribes to HMRCs tax services, and at any time after a customer has been subscribed through their digital tax account. Access to the services will be via the customer’s digital tax account at:

[https://www.tax.service.gov.uk/personal-account](https://www.tax.service.gov.uk/personal-account)

Vendors in their messaging should ask customers to visit that link.  

Customers will be able to view payments made to HMRC in the software. Details will be updated here after they are available.
