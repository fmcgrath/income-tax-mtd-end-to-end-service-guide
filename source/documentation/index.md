# Income Tax (Making Tax Digital) end-to-end service guide

**Version 4.0** issued April 2024

This service guide explains how you can integrate your software with the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax-mtd). 

>|Help us improve this guide |
|---|  
|This guide is currently being revised and overhauled to ensure it meets the needs of software providers. See the service guide [changelog](#documentation-changelog) for latest updates.<br/><br/>If there is a way that this guide could be improved or expanded to meet your needs, <b>now is the time to let us know.</b><br/><br/>If you use this guide regularly, we&#39;d like to invite you to share your thoughts and feedback via an online video call, which will involve a 60-minute one-to-one interview.<br/><br/>We’d like to explore:<ul><li>Your current use of and experience with the service guide</li><li>Any challenges you face</li><li>How helpful you find the service guide</li><li>Your thoughts on the current service guide, how it fits your needs and how it can be improved</li></ul><br/>If you would like to help us improve this guide, please contact our User Researcher <a href="mailto:chris.samms@digital.hmrc.gov.uk">chris.samms@digital.hmrc.gov.uk</a> to arrange an interview.|

## Overview

This guide explains how you can integrate your software with our APIs, and provides examples of how they fit into various end-to-end user journeys to enable agents and individuals to meet their obligations after they have signed up to Making Tax Digital, a service where quarterly updates and final declarations will replace the need for a Self Assessment return to be submitted.

For more information about eligibility and how to use Making Tax Digital for Income Tax, refer to [Making Tax Digital step by step guidance](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-for-businesses-step-by-step).

## Software provider overview

HMRC expects software providers to offer customers a streamlined end-to-end journey, and as far as possible, to support all the things the customers need to do to comply with their MTD for ITSA obligations. This will include the ability to finalise the overall tax position using software.

HMRC will provide the APIs for the software to support all of the personal data items that need to be submitted under Self Assessment. Although these elements will not be mandated through the software, there will be market demand for software that enables any user to finalise the entirety of their tax affairs.

By developing a product now, you will support the mandate of the service, influence its design and ensure you have a product ready for the millions of customers that will need MTD-compatible software.

### Bridging software

Some customers may wish to integrate their existing software solution for digital record keeping with another product that can submit quarterly updates, End of Period Statement, view tax liabilities, make a self assessment and final declaration, and so on. We generally refer to these products as bridging products. 

To be granted production credentials for a bridging product, it must be digitally linked to software that allows customers to maintain business records required by law.

### Non-MTD products

Software products who wish to selectively use Making Tax Digital for Income Tax APIs and not build a Making Tax Digital product will have to submit a business case, justifying use of a particular or multiple API’s. Such products may be granted production credentials at HMRC discretion.

## Production approvals process for Making Tax Digital for Income Tax Self Assessment

Our key objectives for MTD for Income Tax are to:

- ensure customers have a streamlined end-to-end journey and software that supports everything a business customer needs to do to meet their Income Tax obligations
- safeguard customer data and protect HMRC systems against fraud and criminal attack

This section of the guide explains the features your product must include before production credentials are sought, together with features you should consider building into your products.

### Minimum functionality standards

Previously, the production approvals process included an assessment of whether a product includes certain minimum functionality.

In response to developer feedback, we are content for software developers to build MTD Income Tax products iteratively and be granted production credentials for specific elements of the minimum required functionality. However, an MTD Income Tax product will only be listed on the software choices viewer when it satisfies all the requirements listed below.

The minimum required functionality is as follows:  

- a software product must submit the fraud prevention header data required by law.
- a Making Tax Digital for Income Tax product must allow the customer to:
    - create and maintain all business records a customer is required by law to keep in digital form (but see [bridging software](#bridging-software))
    - submit quarterly update information for each business income source (self-employment, multiple self-employments, UK property income)
    - have the option to provide accounting and other adjustments and an estimate of allowances to be claimed for any business income source
    - submit an End of Period Statement for each business income source (with declaration of completeness)
    - call for and view an estimate of their Income Tax liability for each tax year at any time
    - make a self-assessment of the tax and Class 4 National Insurance contributions due on their total taxable income and a final declaration of completeness and correctness no later than 31 January following the end of tax year in which that income is taxable
    - carry forward or set sideways (when permitted) business losses occurring in any one year as well as to apply losses incurred in earlier years against current year profits
    - have visibility of all their Class 2 National Insurance contributions (so that they can make additional voluntary contributions if they wish)

The Making Tax Digital for Income Tax APIs that include the endpoints for the functionality described above are:

- [Business Details](/api-documentation/docs/api/service/business-details-api/)
- [Business Income Source Summary](/api-documentation/docs/api/service/self-assessment-biss-api/)
- [Business Source Adjustable Summary](/api-documentation/docs/api/service/self-assessment-bsas-api)
- [Individuals Business End of Period Statement](/api-documentation/docs/api/service/individuals-business-eops-api/)
- [Individual Calculations](/api-documentation/docs/api/service/individual-calculations-api)
- [Individuals Disclosures (Class 2 NIC’s)](/api-documentation/docs/api/service/individuals-disclosures-api)
- [Individual Losses](/api-documentation/docs/api/service/individual-losses-api)
- [Obligations](/api-documentation/docs/api/service/obligations-api/)
- [Property Business](/api-documentation/docs/api/service/property-business-api/) (only for property full product)
- [Self-Employment Business](/api-documentation/docs/api/service/self-employment-business-api/) (only for self-employment full product)

### Fraud Prevention Headers

You must supply fraud prevention header information for all our APIs before approval can be granted and production credentials issued.

HMRC must see evidence of fraud prevention headers being sent and be satisfied as to their level of accuracy.

The developer must test their fraud prevention headers and provide SDST with screenshot evidence that the correct response is received from the [Test Fraud Prevention Headers API](/api-documentation/docs/api/service/txm-fph-validator-api/). [Guidance on Fraud Prevention Headers](/guides/fraud-prevention/) is available.

### Overview of developer journey to production credentials

1. Sign in to the [developer hub](/api-documentation) and register your application for sandbox testing.
2. [Create a test user which is an individual](/api-documentation/docs/api/service/api-platform-test-user/1.0/oas/page#tag/create-test-user/operation/Createatestuserwhichisanindividual) to create test data.
3. Review the [API documentation](/api-documentation/docs/api?filter=income-tax) and Income Tax end-to-end service guide.
4. Test ITSA endpoints and develop your software application. Any queries during this phase should be sent to [SDSTeam@hmrc.gov.uk](mailto:SDSTeam@hmrc.gov.uk).
5. Register your application for production credentials by creating a production application within your developer hub account and completing the requested sections.
6. Provide testing logs and credentials used for testing to HMRC.
7. Developer testing is reviewed by HMRC (including fraud header validity): 
    - if satisfactory, you will be invited to demonstrate your product
    - if unsatisfactory, further testing and development will be required for review
8. The software vendor demonstrates its software to HMRC by using online screen sharing.
9. Production credentials are issued if all requirements are met. If not, further development is required and a new demonstration will be arranged.

### Product build

Developers have the option to either build all elements required to meet [minimum functionality standards (MFS)](/guides/income-tax-mtd-end-to-end-service-guide/#minimum-functionality-standards) in one go or to build these elements iteratively. If you choose to build iteratively, you will be required to demonstrate your product after each stage of the build. There are three stages, although many developers choose to develop stages 2 and 3 together. 

The three stages are:

1. In year functionality (submitting periodic updates).
2. End of Period (EOPs).
3. Final declaration.

The [API catalogue](/roadmaps/mtd-itsa-vendors-roadmap/#apis-required-for-each-stage-of-development-of-a-minimum-functionality-standard-mfs-product) shows which APIs are required at each stage of the build.

### Testing requirements

HMRC requires the software to test all the APIs that they require access to. The following points relate to access to both new API subscriptions and version updates of existing API subscriptions:

- For APIs included in the [minimum functionality standards](/guides/income-tax-mtd-end-to-end-service-guide/#minimum-functionality-standards), you are required to test all endpoints shown within the documentation.
- For APIs not included in the minimum functionality standards, you are only required to test the endpoints relating to the data sources that your software supports. Where your software doesn’t support all data items, please notify SDSTeam@hmrc.gov.uk separately to confirm which data items you do support, so we can take this into account when checking the testing logs.

[Fraud prevention headers](/guides/fraud-prevention/) must be included in sandbox calls. A specialist team will check these and they must be confirmed as compliant before we can proceed.

After testing is complete, please send details of the dummy NINO used to call the above endpoints in sandbox to SDSTeam@hmrc.gov.uk. You will need to contact us within 14 days of completing your API testing to enable us to view the data within our logs. SDST will advise you of the outcome of our checks within 10 working days.   

After we are satisfied that the relevant APIs and endpoints have been tested satisfactorily and that calls include compliant fraud prevention headers, you will be invited to demonstrate your product. Please note, demonstration is not generally required for access to updated APIs (that is, new versions), but satisfactory testing will be required.


###  Stateful and dynamic testing

Some APIs in the Sandbox environment allow software to test different
scenarios by including ‘Gov-Test-Scenario’ headers in requests. The
[Income Tax (Making Tax Digital) API documentation](https://developer.service.hmrc.gov.uk/api-documentation/docs/api?filter=income-tax-mtd) provides more
information about how to use these test scenarios.

####  Dynamic scenarios

Dynamic scenarios return a response that changes depending on the parameters
submitted by software, for example, National Insurance number or tax year.
However, the submitted data is not stored for future requests and does not
affect the behaviour of other endpoints.

####  Stateful scenarios

Stateful scenarios work with groups of endpoints and APIs that submit
different types of information. For each type, you could POST (or PUT) to
submit or amend data, GET to retrieve or list data and DELETE to delete data.

With a stateful test scenario, you can submit custom data and then retrieve or
list it from a different endpoint. For example, you can submit test data
through the [Self Employment Business API](/api-documentation/docs/api/service/self-employment-business-api/), and then request a summary using the [Business Source Adjustable Summary API](/api-documentation/docs/api/service/self-assessment-bsas-api/) for the same business. The
Sandbox retains test data you submit for 7 days after submission, after which
it is deleted automatically.

#### Stateful Sandbox user journey

To test the journey for Self-Employment or Property Business submission and
to request a Business Source Adjustable Summary (BSAS), complete the
following steps:

1. Submit 4 stateful Self-Employment/Property Business Period Summaries (one for each quarter of the same tax year) for the desired National Insurance number, tax year and Business ID by calling one of the following endpoints: 
    * [Create a Self-Employment Period Summary](/api-documentation/docs/api/service/self-employment-business-api/3.0/oas/page#tag/Self-Employment-Period-Summaries/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1period/post) 
    * [Create a UK Property Income & Expenses Period Summary](/api-documentation/docs/api/service/property-business-api/4.0/oas/page#tag/UK-Property-Income-and-Expenses-Period-Summary/paths/~1individuals~1business~1property~1uk~1%7Bnino%7D~1%7BbusinessId%7D~1period~1%7BtaxYear%7D/post) 
    * [Create a Foreign Property Income & Expenses Period Summary](/api-documentation/docs/api/service/property-business-api/4.0/oas/page#tag/Foreign-Property-Income-and-Expenses-Period-Summary/paths/~1individuals~1business~1property~1foreign~1%7Bnino%7D~1%7BbusinessId%7D~1period~1%7BtaxYear%7D/post)
2. Submit one stateful Self-Employment/Property Business Annual Submission for the same National Insurance number, tax year and Business ID by calling one of the following endpoints: 
    * [Create and Amend Self-Employment Annual Submission](/api-documentation/docs/api/service/self-employment-business-api/3.0/oas/page#tag/Self-Employment-Annual-Submission/paths/~1individuals~1business~1self-employment~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/put) 
    * [Create and Amend a UK Property Business Annual Submission](/api-documentation/docs/api/service/property-business-api/4.0/oas/page#tag/UK-Property-Business-Annual-Submission/paths/~1individuals~1business~1property~1uk~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/put) 
    * [Create and Amend a Foreign Property Annual Submission](/api-documentation/docs/api/service/property-business-api/4.0/oas/page#tag/Foreign-Property-Annual-Submission/paths/~1individuals~1business~1property~1foreign~1%7Bnino%7D~1%7BbusinessId%7D~1annual~1%7BtaxYear%7D/put)
3. Trigger a stateful Business Source Adjustable Summary for Self-Employment/Property business for the same National Insurance number and Business ID by calling the [Trigger a Business Source Adjustable Summary](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1trigger/post) endpoint. 
4. Retrieve a stateful Business Source Adjustable Summary for the Self-Employment/Property Business by using the Calculation ID generated in the previous step and calling one of the following endpoints: 
    * [Retrieve a Self-Employment Business Source Adjustable Summary (BSAS)](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1self-employment~1%7BcalculationId%7D/get) 
    * [Retrieve a UK Property Business Source Adjustable Summary (BSAS)](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#tag/UK-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1uk-property~1%7BcalculationId%7D/get)
    * [Retrieve a Foreign Property Business Source Adjustable Summary (BSAS)](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#tag/Foreign-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1foreign-property~1%7BcalculationId%7D/get)
5. Submit a stateful accounting adjustment for Self-Employment/Property Business by using the same Business ID and  Calculation ID and calling one of the following endpoints: 
    * [Submit Self-Employment Accounting Adjustments](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#tag/Self-employment-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1self-employment~1%7BcalculationId%7D~1adjust/post)
    * [Submit UK Property Accounting Adjustments](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#tag/UK-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1uk-property~1%7BcalculationId%7D~1adjust/post)
    * [Submit Foreign Property Accounting Adjustments](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#tag/Foreign-property-business/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D~1foreign-property~1%7BcalculationId%7D~1adjust/post)
6. List all stateful Business Source Adjustable Summaries requested for the specific Business ID by calling the [List Business Source Adjustable Summaries](/api-documentation/docs/api/service/self-assessment-bsas-api/5.0/oas/page#/paths/~1individuals~1self-assessment~1adjustable-summary~1%7Bnino%7D/get) endpoint. 

<a href="documentation/figures/stateful-bsas-journey.svg" target="blank"><img src="documentation/figures/stateful-bsas-journey.svg" alt="Stateful journey to request a Business Source Adjustable Summary" style="width:720px;" /></a>

<a href="documentation/figures/stateful-bsas-journey.svg" target="blank">Open the stateful journey diagram in a new tab.</a>


### Product demonstration

This is the final part of the process after all preceding steps have been completed.   

During your product demonstration, HMRC expects to see a consumer-ready product for each income source your software supports; for example, Self-employment, UK property, and so on. If, in addition to the MFS APIs, you have also requested access to any non-MFS APIs, you should be ready to include these in your demonstration if requested to do so by SDST.

The journey we expect to see for an MFS build will depend on whether you are building iteratively and if so, which stage you have built to:

**Stage 1: In year build**

1. Authorisation – ITSA scopes only.
2. Retrieve Business Details.
3. Retrieve Obligations.
4. Digitally import data into the appropriate periodic update and submit.
5. Automatically trigger and display a tax calculation.
6. Submit an amended periodic update – automatically trigger and display the calculation.
7. Demonstrate how your software returns and displays error messages to the customer.

**Stage 2: EOPS**

1. Submit details within the Annual Summary.
2. Automatically trigger and display a tax calculation.
3. Trigger a Business Source Adjustable Summary (BSAS).
4. Retrieve a BSAS.
5. Create and submit a Business Source Adjustable Summary for an accounting adjustment.
6. Automatically trigger and display a tax calculation.
7. Retrieve a Business Income Source Summary (BISS) and display it to the customer. 
    Alternatively, the software may choose to create a BISS themselves by totalling the relevant information held in software and displaying it to the customer.
8. Show EOPS Declaration Statement.
9. Submit EOPS.
10. Demonstrate how your software returns and displays error messages to the end user.

**Note:** The end user must confirm they have read and agreed the declaration statement before the option to submit EOPS is made available.

**Stage 3: Final Declaration**

1. Create and submit a loss.
2. Create/Amend and submit disclosures (Class 2 NICs).
3. Trigger a tax calculation with the Final Declaration parameter set to 'true'.
4. Retrieve and display this tax calculation for the customer to review.
5. Show the Final Declaration Statement – this must match the statement shown on the ITSA End to End Service Guide.
6. Submit a Final Declaration.
7. Demonstrate how your software returns and displays error messages to the end user.

**Note:** The end user must confirm they have read and agreed the declaration statement before the option to submit the Final Declaration is made available.

#### Important Considerations

- Build functionality to allow business customers to report income from non-business sources that meets your customer model.
- Consider the one-hour delay as part of the software workflow to update the status of obligations.
- Consider a 5-second delay before retrieving the calculation.
- Consider developing guidelines within the software for relevant users, including a reference to HMRC user interface journeys for customers and agents.
- Use APIs as efficiently as possible to avoid exceeding the rate limit.
- Build relevant error responses for your software to deal with exceptions.
- Correct MTD gateway credentials or agent services credentials need to be used when logging into the system when authorising your software.
- Consider providing notifications to customers when periodic submissions are due.
- Consider building functionality that allows the customer to request a tax calculation at any time.

## Terms of use

You must comply with our [terms of use](/api-documentation/docs/terms-of-use). You must accept the terms of use before we can issue you with production credentials.

## Software choices

Software Choices is a service designed to help users [find compatible software for Making Tax Digital for Income Tax](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) that meets their needs.

An updated version is being developed with filters to help users find products that fit their specific requirements. For instance, a user may wish to find bridging software instead of a standalone product, or a product that suits their accessibility needs. It will also include a filter to find software that is also compatible with Making Tax Digital for VAT. 

Software vendors have the option for their software to be listed on [software choices](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax) as [software in development](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax#software-in-development) after production credentials have been approved. To be listed as [software available now](https://www.gov.uk/guidance/find-software-thats-compatible-with-making-tax-digital-for-income-tax#software-available-now), vendors must demonstrate that they: 

- have developed to minimum functionality standards, by being granted access to the full set of APIs listed in the [minimum functionality standards](#minimum-functionality-standards) section
- can complete the successful onboarding for a customer - sign up, authorise software, and retrieve obligations
- can submit a periodic update for a customer for each business income source

HMRC staff will monitor this activity in real time if they feel it is necessary. HMRC will then perform final checks before allowing a software product to be listed on [GOV.UK](https://www.gov.uk/). 

We advise users to speak to their appointed tax agent (if they have one) before making a decision on software.

### Free-to-use software

The government has committed to the availability of free software for small businesses mandated to use MTD for income tax. HMRC strongly encourages all developers to consider producing a free version of their MTD for Income Tax product for this customer group.

By ‘small businesses’, we mean that eligibility for free software will apply if the business meets all of these conditions:

- is an individual (self-employed or a landlord) or a simple partnership
- is not VAT registered
- has no employees
- has a turnover (gross annual income from all business sources) of less than £85,000
- uses cash basis accounting

For the avoidance of any doubt, there is no expectation that a free product will include VAT, Corporation Tax or PAYE functionality.

In addition to the minimum standards set out in the terms of use, and the general functionality standards applicable to all MTD for Income Tax software, we expect any free software product you provide to small businesses to:

- enable the provision of a dataset that correlates to the current [SA103S self-employment supplementary page (short)](https://www.gov.uk/government/publications/self-assessment-self-employment-short-sa103s)
- enable the provision of a dataset that correlates to the current [SA105 UK property](https://www.gov.uk/government/publications/self-assessment-uk-property-sa105) or [SA106 foreign property](https://www.gov.uk/government/publications/self-assessment-foreign-sa106) pages, where the number of properties does not exceed one
- provide a reasonable level of guidance, help and support to users (HMRC is open to views on what might be ‘reasonable’ for a free product and will publish further advice on this in due course)
- allow the end user to own and have access to all their records created using the software product (past and present) to enable them to retrieve data and promptly export it if necessary
- be free for the business to use to comply with their MTD for Income Tax obligations for a full annual accounting period on the understanding the business continues to meet the eligibility criteria below

HMRC would not require free software to link or integrate with an Agent product.

## End-to-end user journey

These journeys show examples of use:

- [Income Tax Self Assessment (ITSA) set up activities](/guides/income-tax-mtd-end-to-end-service-guide/documentation/signup.html)
- [retrieving obligations](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieving-obligations)
- [submitting quarterly updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-quarterly-updates-for-self-employment-and-property-businesses)
- [submitting annual updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-annual-updates-for-self-employment-and-property-businesses)
- [retrieving a tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieve-a-tax-calculation)
- [finalising business income End of Period Statement (EOPS)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#finalise-business-income-end-of-period-statement-eops)
- [providing information about how to treat a loss](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#providing-information-about-how-to-treat-a-loss)
- [making a final declaration](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration.html#making-a-final-declaration)

## Mapping APIs to Self Assessment tax return forms

Many parameters in some Income Tax (Making Tax Digital) APIs map to box numbers in [Self Assessment tax return forms (GOV.UK)](https://www.gov.uk/self-assessment-tax-return-forms). You can download this mapping information as CSV files from the [income-tax-mtd-changelog/mapping](https://github.com/hmrc/income-tax-mtd-changelog?tab=readme-ov-file#mapping-apis-to-self-assessment-tax-return-forms) (GitHub).

Some APIs map to box numbers in more than one form. The following table shows which APIs are linked to which forms. 

| Self Assessment tax return form | Related APIs |
| ------------------------------- | ------------ |
| [SA100 Main tax return (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100) | [Individual Calculations](/api-documentation/docs/api/service/individual-calculations-api) <br />[Individuals Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api) <br />[Individuals Dividends Income](/api-documentation/docs/api/service/individuals-dividends-income-api) <br />[Individuals Employments Income](/api-documentation/docs/api/service/individuals-employments-income-api) <br />[Individuals Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api) <br />[Individuals Savings Income](/api-documentation/docs/api/service/individuals-savings-income-api) <br />[Individuals State Benefits](/api-documentation/docs/api/service/individuals-state-benefits-api) <br />[Self Assessment Accounts](/api-documentation/docs/api/service/self-assessment-accounts-api) |
| [SA101 Additional Information (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-additional-information-sa101) | [Individuals Charges](/api-documentation/docs/api/service/individuals-charges-api) <br />[Individuals Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api) <br />[Individuals Dividends Income](/api-documentation/docs/api/service/individuals-dividends-income-api) <br />[Individuals Employments Income](/api-documentation/docs/api/service/individuals-employments-income-api) <br />[Individuals Expenses](/api-documentation/docs/api/service/individuals-expenses-api) <br />[Individuals Foreign Income](/api-documentation/docs/api/service/individuals-foreign-income-api) <br />[Individuals Insurance Policies Income](/api-documentation/docs/api/service/individuals-insurance-policies-income-api) <br />[Individuals Other Income](/api-documentation/docs/api/service/individuals-other-income-api) <br />[Individuals Pensions Income](/api-documentation/docs/api/service/individuals-pensions-income-api) <br />[Individuals Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api) <br />[Individuals Savings Income](/api-documentation/docs/api/service/individuals-savings-income-api) <br />[Other Deductions](/api-documentation/docs/api/service/other-deductions-api) |
| [SA102 Employment (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-employment-sa102) | [Individuals Expenses](/api-documentation/docs/api/service/individuals-expenses-api) <br />[Individuals Employments Income](/api-documentation/docs/api/service/individuals-employments-income-api) |
| [SA103F Self-employment (Full) (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-self-employment-full-sa103f) | [CIS Deductions](/api-documentation/docs/api/service/cis-deductions-api) <br />[Individual Losses](/api-documentation/docs/api/service/individual-losses-api) <br />[Individuals Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api) <br />[Self-Employment Business](/api-documentation/docs/api/service/self-employment-business-api) |
| [SA105 UK Property (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-uk-property-sa105) | [Individual Losses](/api-documentation/docs/api/service/individual-losses-api) <br />[Property Business](/api-documentation/docs/api/service/property-business-api) |
| [SA106 Foreign (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-foreign-sa106) | [Individual Losses](/api-documentation/docs/api/service/individual-losses-api) <br />[Individuals Dividends Income](/api-documentation/docs/api/service/individuals-dividends-income-api) <br />[Individuals Insurance Policies Income](/api-documentation/docs/api/service/individuals-insurance-policies-income-api) <br />[Individuals Other Income](/api-documentation/docs/api/service/individuals-other-income-api) <br />[Individuals Pensions Income](/api-documentation/docs/api/service/individuals-pensions-income-api) <br />[Individuals Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api) <br />[Individuals Savings Income](/api-documentation/docs/api/service/individuals-savings-income-api) <br />[Property Business](/api-documentation/docs/api/service/property-business-api) |
| [SA108 Capital gains summary (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-capital-gains-summary-sa108) | [Individuals Capital Gains Income](/api-documentation/docs/api/service/individuals-capital-gains-income-api) |

## Changelogs

### API changelog

The [income-tax-mtd-changelog](https://github.com/hmrc/income-tax-mtd-changelog) (GitHub) provides detailed and comprehensive information about API changes.

### Documentation changelog

Below is a summary of updates to this service guide.

#### Version 4.0

16 April 2024

- Add section [Stateful and dynamic testing](/guides/income-tax-mtd-end-to-end-service-guide/#stateful-and-dynamic-testing), which includes an example user journey to:
  - make a Self-Employment or Property Business submission
  - request a Business Source Adjustable Summary
- Add section [Mapping APIs to Self Assessment tax return forms](/guides/income-tax-mtd-end-to-end-service-guide/#mapping-apis-to-self-assessment-tax-return-forms)
- Update Business and property income section:
  - remove sentence from section [Submit quarterly update](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-quarterly-update) about error if £85,000 limit is exceeded
  - remove flow chart from section [Submit accounting adjustments](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-accounting-adjustments)
- Update [Additional information](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html) section:
  - update section introduction with new content about breakup of Individuals Income Received API
  - update API endpoint links to point to new APIs that replace Individuals Income Received API

#### Version 3.9

18 March 2024

- Update [Business and property income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html) section:
  - add new section [Change to calendar quarters](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#change-to-calendar-quarters)
  - add new content to section [Submit quarterly update](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-quarterly-update)
- Update [Final declaration](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration.html) section:
  - remove all references to ‘crystallisation’
  - remove sections ‘Calculations that produce errors’ and ‘Calculations that are free from errors’, which are now in section [Tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#tax-calculation)
  - change ’calcuationId' to 'Calculation ID' and 'finalDeclaraton' to 'Final Declaration'
  - update tax account links in section [Pay or get a repayment](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration.html#pay-or-get-a-repayment)
- Update [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html) section:
  - update status of ‘Elect for calendar quarterly periods’ task
  - add new table column that explains choice of service (HMRC online services or software or both) used to make each functionality available
- Update [Using tax codes to collect tax due](/guides/income-tax-mtd-end-to-end-service-guide/documentation/using-tax-codes-to-collect-taxes-due.html) section (formerly ‘Coding Out’):
  - retitle section
  - rewrite section
  - add content about opting out

#### Version 3.8

31 January 2024

- Update [Deprecating APIs](/guides/income-tax-mtd-end-to-end-service-guide/documentation/api-deprecation-guidance.html#deprecating-apis) section with details about new deprecation headers
- Update the following section of [Business and property income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html) section:

  - [Tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#tax-calculation) (formerly 'Retrieve a tax calculation')

- Update the following sections of [Additional information](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html) section (formerly 'Additional Income'):

  - New section introduction for Additional Information (remove ‘Submit information about personal income’)
  - [Employments](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#employments) (move some content to new section ‘Employment Expenses’)
  - [Dividends Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#dividends-income)
  - [Pensions Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#pensions-income)
  - [Other Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#other-income)
  - [Savings Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#savings-income)
  - [Savings Accounts](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#savings-accounts)
  - [Disclosures](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#disclosures)
  - [Individual Charges](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#individual-charges) (formerly 'Pension Charges')
  - [Individual Reliefs](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#individual-reliefs)
  - [Other Deductions](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#other-deductions)
  - [Employment Expenses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#employment-expenses) (formerly ‘Individual Expenses Other’)
  - [Non-PAYE Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#non-paye-income)
  - [State Benefits](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#state-benefits)
  - [Providing information about how to treat a loss](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#providing-information-about-how-to-treat-a-loss)

#### Version 3.7

24 January 2024

- Update the following sections of [Business and property income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html) section:

  - [Retrieving obligations](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#retrieving-obligations)
  - [Submit quarterly updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-quarterly-updates-for-self-employment-and-property-businesses)
  - [Submit annual updates for self-employment and property businesses](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-annual-updates-for-self-employment-and-property-businesses)
  - [Submit accounting adjustments](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#submit-accounting-adjustments)
  - [Construction Industry Scheme](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#construction-industry-scheme)
  - [Finalise business income End of Period Statement (EOPS)](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#finalise-business-income-end-of-period-statement-eops)
  - [Tax calculation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#tax-calculation) (formerly 'Retrieve a tax calculation')

- Move the content of the following sections to other sections in Business and Property Income section:

  -  Business Income Source Summary
  -  View previously submitted updates
  -  Making changes to previously submitted data
  -  Multiple businesses

- Update the [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html) section as follows:

  - update status of 2 tasks
  - move [Opting out of MTD](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html#opting-out-of-mtd) section into HMRC online services section

- Update the following sections of [Additional information](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html) section:

  - [Foreign Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#foreign-income)
  - [Insurance Policies Income](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#insurance-policies-income)
  - [Capital Gains Tax](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#capital-gains-tax)
  - [Marriage Allowance](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#marriage-allowance)

#### Version 3.6

13 December 2023

* Update [Additional information / Employments](/guides/income-tax-mtd-end-to-end-service-guide/documentation/additional-information.html#employments) section with off-payroll working details
* Update [Customer support model](/guides/income-tax-mtd-end-to-end-service-guide/documentation/customer-support.html) section
* Update [Using tax codes to collect tax due](/guides/income-tax-mtd-end-to-end-service-guide/documentation/using-tax-codes-to-collect-taxes-due.html) section (formerly 'Coding Out')
* Update UR contact email address

#### Version 3.5

15 November 2023

* Update content and diagram in [Payments and liabilities](/guides/income-tax-mtd-end-to-end-service-guide/documentation/payments-and-liabilities.html) section
* Remove crystallisation endpoint content from [Final declaration](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration.html) section

#### Version 3.4

2 November 2023

* Add new [Customer status](/guides/income-tax-mtd-end-to-end-service-guide/documentation/customer-status.html) section describing business purpose of the new Self Assessment Individual Details API
* Update [Construction Industry Scheme](/guides/income-tax-mtd-end-to-end-service-guide/documentation/business-and-property-income.html#construction-industry-scheme) section and move it into 'Business and Property Income' section
* Update [Software choices](#software-choices) section
* Update APIs in [Minimum functionality standards](#minimum-functionality-standards) section
* Remove duplicate 'Finalise business income End of Period Statement (EOPS)' section

#### Version 3.3

4 October 2023

* Update content for [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html) section
* Update content for [Opting out of MTD](/guides/income-tax-mtd-end-to-end-service-guide/documentation/closedown.html) section
* Update content for [HMRC Assist](/guides/income-tax-mtd-end-to-end-service-guide/documentation/hmrc-assist.html) section

#### Version 3.2

20 September 2023

* Update content for [Penalties and appeals](/guides/income-tax-mtd-end-to-end-service-guide/documentation/penalties-and-appeals.html) section
* Update content for [Final declaration](/guides/income-tax-mtd-end-to-end-service-guide/documentation/final-declaration.html) section
* Update content for [Production approvals process](#production-approvals-process-for-making-tax-digital-for-income-tax-self-assessment) section
* Update content for [Software choices](#software-choices) section
* Update content for [Bridging software](#bridging-software) section
* Remove Business Validation Rules section

#### Version 3.1

27 June 2023

* Add [API lifecycle & deprecation](/guides/income-tax-mtd-end-to-end-service-guide/documentation/api-deprecation-guidance.html) section, remove some duplicated content

#### Version 3.0

14 June 2023

* Update API and endpoint links

#### Version 2.9

* Update direct links to endpoints to reflect changes in how API documentation is published

#### Version 2.8

* Update HMRC Assist section

#### Version 2.7

* Update guide to reflect simplified v3.0 final declaration process and update section on customers opting out of MTD

#### Version 2.6

* Update guide to reflect API changes, including refactored Self Assessment Accounts API

#### Version 2.5

* Update guide to reflect new API versions, update links and correct and clarify some content

#### Version 2.4

* Update Frequently Asked Questions section to remove some items

#### Version 2.3

* Add note and an example table demonstrating how adjustments submitted work

#### Version 2.2

* Add a Frequently Asked Questions section to the menu tree

#### Version 2.1

* Notice of version change to Business Income Source Summary V1.0
* Replace 'Set up' heading with 'Sign up' with and update menu tree to have only three sections: **Agent**, **Individual** and **Link software to HMRC**
* Update content in the **Minimum functionality standards** section and add two other sections: **Bridging software** and **Non-MTD products**
* Update content in the **Declaration** and **Declaration for agents** sections of **Final declaration** (previously called 'crystallisation')

#### Version 2.0

* Add Capital Gains Tax, Marriage Allowance, Non-PAYE Income, Coding out underpayments and debts

#### Version 1.9

* Add requirement for businesses and landlords to provide information about residential property disposals
* Add information regarding BSAS adjustments
* Add content changes to meet MTD Style Guide V2.2
* Replace the term ‘crystallisation’ with ‘final declaration'

#### Version 1.8

* Add deprecation dates for Self Assessment API Endpoints
* Notice of version change to Business Source Adjustable Summary (MTD) - V 1.0
* Notice of version change to Individual Losses (MTD) - V1.0
* Notice of version change to Individual Calculations v 1.0

#### Version 1.7

* Change title to Income Tax (Making Tax Digital) end-to-end Service Guide
* Include Income Tax (MTD) APIs
* Include Tax Terminology
* Add Foreign Property reference to Obligations
* Replace the term 'taxpayers' with 'customers'
* Replace references to SA Accounting Summary API with BSAS API

#### Version 1.6

* Revise wording for Draft MTD ITSA Regulations 2021 page

#### Version 1.5

* Add Production approvals process for Making Tax Digital for Self Assessment
* Add early draft MTD ITSA Regulations 2021 section

#### Version 1.4

* Update Construction Industry Scheme (CIS) section

#### Version 1.3

* Update Losses
* Add Additional information section

#### Version 1.2

* Add Multiple businesses section
* Add Construction Industry Scheme (CIS) section

#### Version 1.1

* Add Payments and liabilities section
