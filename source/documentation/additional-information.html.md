---
title: Additional information | Income Tax (Making Tax Digital) end-to-end service guide
weight: 30
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Additional information

If Making Tax Digital (MTD) customers are earning any type of income in addition to their self-employment and property income, they must report that to HMRC just as they would in their Self Assessment return. 

><p>Currently, the endpoints for reporting additional income through software are included in the 
	<a href="/api-documentation/docs/api/service/individuals-income-received-api/">Individuals Income Received API</a>. As of June 2024, the Individuals Income Received API will be deprecated and replaced with the following new APIs:</p><ul> 
	<li><a href="/api-documentation/docs/api/service/individuals-employments-income-api/">Individuals Employments Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-dividends-income-api/">Individuals Dividends Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-foreign-income-api/">Individuals Foreign Income API</a></li> 
	<li><a href="/api-documentation/docs/api/service/individuals-insurance-policies-income-api/">Individuals Insurance Policies Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-pensions-income-api/">Individuals Pensions Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-other-income-api/">Individuals Other Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-savings-income-api/">Individuals Savings Income API</a></li>
	<li><a href="/api-documentation/docs/api/service/individuals-capital-gains-income-api/">Individuals Capital Gains Income API</a></li></ul>
<p>These new APIs are now available for testing in Sandbox.</p>

Your software should prompt customers to provide details about any additional income sources. If the software does not support submission of any applicable additional income, customers must use [HMRC online services](/guides/income-tax-mtd-end-to-end-service-guide/documentation/online-tax-account.html#hmrc-online-services) to make their submission. For more information about which type of income to tell HMRC, refer to [Check if you need to tell HMRC about additional income (GOV.UK)](https://www.gov.uk/check-additional-income-tax). 

Customers who need to submit their additional income must do it before submitting their final declaration. The following sections cover the different types of additional income and the endpoints needed to submit them in the software. 

## Employments income

A customer will have employment income if they work for an employer who deducts tax from their pay through Pay As You Earn (PAYE). A customer's earnings and tax deducted are sent to HMRC by their employer. This allows HMRC to hold an employment history for each customer. HMRC uses this information to calculate whether the correct PAYE tax has been paid at the end of the tax year. For more information about declaring employment income, refer to [Self Assessment: Employment (GOV.UK).](https://www.gov.uk/government/publications/self-assessment-employment-sa102)

Currently, under Self Assessment, a customer will see their PAYE earnings, tax deducted and other financial details pre-populated in their online tax return. They can overwrite any information that might be incorrect. 

Customers can continue to do this under Making Tax Digital. They can:

- view employment details (financial and non-financial) held by HMRC throughout the year
- create and amend employment details submitted by them after the end of the tax year
- delete employment details submitted by them after the end of the tax year

### View employment details

The following endpoints enable the customer to view different types of employment details:

- [List Employments](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Retrieve an Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/get)
- [Retrieve Other Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1employments-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get)

A customer, at any time, can view a list of their employers for a specific tax year. The [List Employments](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D/get) endpoint provides the software with the Employment IDs for each customer employment. This Employment ID is necessary to call other employment income endpoints.

Your software can use the [Retrieve an Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/get) endpoint to enable the customer to view non-financial details about a specific employment for a given tax year. This includes the start date of the employment and employer name.

The software can use the [Retrieve Other Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1employments-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/get) endpoint to enable the customer to view other employment income details for a given year. This includes share options, shares awarded or received, disability, lump sums and foreign service income.

Employers will also submit financial details that form the customers earnings and deductions. In software, this information can be viewed using the [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get) endpoint. The endpoint contains details on taxable pay to date, [benefits in kind](https://www.gov.uk/tax-company-benefits), student loan deductions and the customer's off payroll working status for a specific employment.

#### Off-payroll working (OPW) rules

Off-payroll working rules (IR35) govern how a worker (sometimes called a contractor) who is providing their services through an intermediary such as a personal service company, is treated in terms of their Income Tax and National Insurance. More information about off-payroll working rules can be found on the [GOV.UK](https://www.gov.uk/guidance/understanding-off-payroll-working-ir35) website.

The off-payroll worker status can be seen in-year as part of the employment pre-population into the customer’s self-assessment tax calculations. In software, the off-payroll working status is retrieved using the [Retrieve an Employment and its Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/get) endpoint. The status is also available in the [Retrieve A Self Assessment Tax Calculation](/api-documentation/docs/api/service/individual-calculations-api/5.0/oas/page#tag/Tax-Calculations/paths/~1individuals~1calculations~1%7Bnino%7D~1self-assessment~1%7BtaxYear%7D~1%7BcalculationId%7D/get) endpoint. If the status is set to false, indicating the worker is not regarded as being subject to OPW rules, the software should not display it to the customer. This status is view-only: the customer does not need to take any action unless they think it has been set in error, in which case they must contact their employer.

After the end of the tax year, the off-payroll working status will be displayed to the customer along with the employment data fields. As part of their self assessment, if a customer agrees with their off-payroll working status, there is no further action required from them. However, if a customer disagrees with their off-payroll working status, they can change it after the end of tax year before completing their final declaration. This change can be made in software or through their HMRC online services account. The software must call the [Create and Amend Employment Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put) endpoint to change the off-payroll working status. 

The following warning message must be displayed to the customer:

> “Do you want to change your employment details? You are about to change information [insert employer name] sent to HMRC:

> * Off-payroll working status

> HMRC may review this change.”

As stated in the warning message, this action may be reviewed by HMRC.

### Create and amend employment details

The following endpoints enable the customer to create and amend different types of employment details:

- [Add a Custom Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D/post)
- [Amend a Custom Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/put)
- [Create and Amend Employment Financial Details ](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put)
- [Create and Amend Other Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1employments-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)

At the end of the tax year, if the customer thinks an employment is missing in data held by HMRC, they can add it. In software, this is done by calling the [Add a Custom Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D/post) endpoint. After adding an employment, the customer needs to add the appropriate financial details for that employment. In software, this is done by calling the [Create and Amend Employment Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/put) endpoint. 

If a customer thinks that the financial details are incorrect for an employer in data held by HMRC, they can update it using the same endpoint. If the customer also thinks their non-financial details or other employment details are inaccurate, they can amend it. In software, this is done by calling the [Amend a Custom Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D/put) or [Create and Amend Other Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1employments-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/put) endpoint respectively.

### Delete employment details

The following endpoints allow the customer to delete different types of employment details:

- [Delete Employment Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/delete)
- [Delete Other Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1employments-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)
- [Ignore Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1ignore/post)
- [Unignore Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1unignore/post)

If a customer has incorrect employment details, they can delete them. This can be done only at the end of the tax year. In the software, this is done by calling the [Delete Employment Financial Details](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1financial-details/delete) or [Delete Other Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Other-Employment-Income/paths/~1individuals~1employments-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete) endpoint, depending on the detail type.

For some incorrect employment details held by HMRC, the customer can ask HMRC to ignore this information. In software, this is done by calling the [Ignore Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1ignore/post) endpoint. This action can be reversed by using the [Unignore Employment](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Employments/paths/~1individuals~1employments-income~1%7Bnino%7D~1%7BtaxYear%7D~1%7BemploymentId%7D~1unignore/post) endpoint.

## Dividends income

Customers might get a dividend if they own shares in a company. They must pay tax on dividend income if it is above their personal allowance. For more information, refer to [Tax on dividends (GOV.UK)](https://www.gov.uk/tax-on-dividends).

Customers can use their software to submit different types of dividend income. This includes UK dividend income, foreign dividend income, stock dividend income, redeemable shares income, bonus securities, dividend income received while abroad and close company loans written off.

The software can use the following endpoints to enable customers to:

- [Create and Amend Dividends Income](/api-documentation/docs/api/service/individuals-dividends-income-api/1.0/oas/page#tag/Dividends-Income/paths/~1individuals~1dividends-income~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Create and Amend a UK Dividends Income Annual Summary](/api-documentation/docs/api/service/individuals-dividends-income-api/1.0/oas/page#tag/UK-Dividends-Income/paths/~1individuals~1dividends-income~1uk~1%7Bnino%7D~1%7BtaxYear%7D/put)
- [Retrieve Dividends Income](/api-documentation/docs/api/service/individuals-dividends-income-api/1.0/oas/page#tag/Dividends-Income/paths/~1individuals~1dividends-income~1%7Bnino%7D~1%7BtaxYear%7D/get) 
- [Retrieve a UK Dividends Income Annual Summary](/api-documentation/docs/api/service/individuals-dividends-income-api/1.0/oas/page#tag/UK-Dividends-Income/paths/~1individuals~1dividends-income~1uk~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Delete Dividends Income](/api-documentation/docs/api/service/individuals-dividends-income-api/1.0/oas/page#tag/Dividends-Income/paths/~1individuals~1dividends-income~1%7Bnino%7D~1%7BtaxYear%7D/delete)
- [Delete a UK Dividends Income Annual Summary](/api-documentation/docs/api/service/individuals-dividends-income-api/1.0/oas/page#tag/UK-Dividends-Income/paths/~1individuals~1dividends-income~1uk~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Foreign income

Foreign income is any income earned outside England, Wales, Scotland and Northern Ireland. The Channel Islands and the Isle of Man are classed as foreign. 

Customers might need to pay UK income tax on their foreign income. This includes wages if they work abroad, foreign investment income and income from pensions held overseas. For more information about tax on foreign income, refer to [Tax on foreign income (GOV.UK)](https://www.gov.uk/tax-foreign-income).

Customers can use their software to submit information about foreign earnings and unremittable foreign income. The software can use the following endpoints to enable customers to:

- [Create and Amend Foreign Income](/api-documentation/docs/api/service/individuals-foreign-income-api/1.0/oas/page#tag/Foreign-Income/paths/~1individuals~1foreign-income~1%7Bnino%7D~1%7BtaxYear%7D/put)
- [Retrieve Foreign Income](/api-documentation/docs/api/service/individuals-foreign-income-api/1.0/oas/page#tag/Foreign-Income/paths/~1individuals~1foreign-income~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Delete Foreign Income](/api-documentation/docs/api/service/individuals-foreign-income-api/1.0/oas/page#tag/Foreign-Income/paths/~1individuals~1foreign-income~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Insurance policies income

Income from insurance policies is any chargeable gains from UK life insurance policies. This includes cash or other benefits received on a full or part surrender of a policy, a policy matured or brought to an end by the death of the life insured, the sale or assignment of a UK policy, or part of a policy. For more information about insurance policies income tax, refer to [Insurance Policyholder Taxation Manual (GOV.UK)](https://www.gov.uk/hmrc-internal-manuals/insurance-policyholder-taxation-manual).

Customers can use their software to submit different types of insurance policies income. This includes information about life insurance policies, capital redemption policies, life annuities, voided ISAs, and foreign policies.

The software can use the following endpoints to enable customers to:

- [Create and Amend Insurance Policies Income](/api-documentation/docs/api/service/individuals-insurance-policies-income-api/1.0/oas/page#/paths/~1individuals~1insurance-policies-income~1%7Bnino%7D~1%7BtaxYear%7D/put)
- [Retrieve Insurance Policies Income](/api-documentation/docs/api/service/individuals-insurance-policies-income-api/1.0/oas/page#/paths/~1individuals~1insurance-policies-income~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Delete Insurance Policies Income](/api-documentation/docs/api/service/individuals-insurance-policies-income-api/1.0/oas/page#/paths/~1individuals~1insurance-policies-income~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Pensions income

Customers in receipt of foreign pensions must continue to report this income to HMRC. For more information about these income types, refer to [Self Assessment: Foreign (SA106) (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-foreign-sa106). Customers should also tell HMRC about their overseas pension. For more information, refer to [Self Assessment: additional information SA101 (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-additional-information-sa101).

Customers can use their software to submit the information above. The software can use the following endpoints to enable customers to:

* [Retrieve Pensions Income](/api-documentation/docs/api/service/individuals-pensions-income-api/1.0/oas/page#tag/Pensions-Income/paths/~1individuals~1pensions-income~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Income](/api-documentation/docs/api/service/individuals-pensions-income-api/1.0/oas/page#tag/Pensions-Income/paths/~1individuals~1pensions-income~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Income](/api-documentation/docs/api/service/individuals-pensions-income-api/1.0/oas/page#tag/Pensions-Income/paths/~1individuals~1pensions-income~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Other income

Customers should tell HMRC about their other taxable income. This includes miscellaneous income like casual earnings, commission or freelance income.

Customers can use their software to submit different types of other income. This includes information about business receipts, all other income received while abroad, overseas income and gains, chargeable foreign benefits and gifts and omitted foreign income.

The software can use the following endpoints to enable customers to:

* [Retrieve Other Income](/api-documentation/docs/api/service/individuals-other-income-api/1.0/oas/page#tag/Other-Income/paths/~1individuals~1other-income~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Income](/api-documentation/docs/api/service/individuals-other-income-api/1.0/oas/page#tag/Other-Income/paths/~1individuals~1other-income~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Income](/api-documentation/docs/api/service/individuals-other-income-api/1.0/oas/page#tag/Other-Income/paths/~1individuals~1other-income~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Savings income

Savings income can include interest for certain securities and income from overseas savings. For more information, refer to [How to complete your tax return for Self Assessment (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100#supplementary-pages).

Customers can use their software to submit information about savings income. The software can use the following endpoints to enable customers to:

* [Retrieve Savings Income](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/Savings-Income/paths/~1individuals~1savings-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Savings Income](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/Savings-Income/paths/~1individuals~1savings-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Savings Income](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/Savings-Income/paths/~1individuals~1savings-income~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Savings accounts

Customers must submit information to HMRC about any UK savings accounts they hold. For information about eligible account types, refer to [How to complete your tax return for Self Assessment (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100#supplementary-pages).

Customers can use their software to submit information about each account and record the annual interest income data for it. The software can use the following endpoints to enable customers to:

- [Add a UK Savings Account](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1savings-income~1uk-accounts~1%7Bnino%7D/post)
- [Create and Amend a UK Savings Account Annual Summary](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1savings-income~1uk-accounts~1%7Bnino%7D~1%7BtaxYear%7D~1%7BsavingsAccountId%7D/put)
- [List All UK Savings Accounts](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1savings-income~1uk-accounts~1%7Bnino%7D/get)
- [Retrieve UK Savings Account Annual Summary](/api-documentation/docs/api/service/individuals-savings-income-api/1.0/oas/page#tag/UK-Savings-Account/paths/~1individuals~1savings-income~1uk-accounts~1%7Bnino%7D~1%7BtaxYear%7D~1%7BsavingsAccountId%7D/get)

## Disclosures

Customers should tell HMRC if they think they have not paid the correct amount of tax. In serious cases of undisclosed tax or income, HMRC may consider starting a criminal investigation. 

Customers are encouraged to voluntarily tell HMRC about any failures or errors rather than wait for HMRC to contact them. This might reduce any potential penalties on outstanding tax. For more information about making disclosures, refer to [How to make a voluntary disclosure to HMRC (GOV.UK)](https://www.gov.uk/government/publications/hmrc-your-guide-to-making-a-disclosure/your-guide-to-making-a-disclosure).

Customers can use their software to submit disclosures about tax avoidance. The software can use the following endpoints to enable customers to:

* [Create and Amend Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Disclosures](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Disclosures/paths/~1individuals~1disclosures~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Individual Charges

This currently applies only to a customer’s pension charges. For more information, refer to [Pension savings - tax charges (GOV.UK)](https://www.gov.uk/government/publications/pensions-tax-charges-on-any-excess-over-the-lifetime-allowance-annual-allowance-special-annual-allowance-and-on-unauthorised-payments-hs345-self).

Customers can use their software to submit different types of pension charges. This includes UK and overseas pension contributions, tax on unauthorised payments, transfer of overseas pension to another pension scheme and tax paid for exceeding their lifetime allowance.

The software can use the following endpoints to enable customers to:

* [Retrieve Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pension Charges](/api-documentation/docs/api/service/individuals-charges-api/2.0/oas/page#/paths/~1individuals~1charges~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Individual reliefs

‘Tax relief’ means that you either:

- pay less tax to take account of money you have spent on specific things, such as business expenses if you’re self-employed
- get tax back or get it repaid in another way, such as personal pension payments

For more information about individual tax reliefs, refer to [Tax reliefs (GOV.UK)](https://www.gov.uk/government/publications/self-assessment-tax-return-sa100/how-to-fill-in-your-tax-return-2021#tax-reliefs). The following sections cover the different types of tax reliefs and the endpoints needed to submit in the  software.

### Pensions relief

Customers can use their software to submit different types of pension relief. This includes regular pension contributions, one-off pension contributions, retirement annuity payments, payments to employer’s scheme, and overseas pensions contributions.

The software can use the following endpoints to enable customers to:

* [Retrieve Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Pensions Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Pensions-Reliefs/paths/~1individuals~1reliefs~1pensions~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Relief investments

Customers can use their software to submit different types of relief investments. This includes venture capital subscriptions, Enterprise Investment Scheme (EIS), community investments, seed enterprise investments, and social enterprise investments.

The software can use the following endpoints to enable customers to:

* [Retrieve Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Relief Investments](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Relief-Investments/paths/~1individuals~1reliefs~1investment~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Other reliefs

Customers can use their software to submit other types of tax relief. This includes non-deductible loan interests, payroll giving, redemption of shares and securities, maintenance payments, post-cessation trade relief, annual payments made, and qualifying loan interest payments.

The software can use the following endpoints to enable customers to:

* [Retrieve Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Other-Reliefs/paths/~1individuals~1reliefs~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Foreign reliefs

Customers can use their software to submit different types of foreign relief. This includes foreign tax credit, foreign income tax credit, and foreign tax not claimed.

The software can use the following endpoints to enable customers to:

* [Retrieve Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Foreign Reliefs](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Foreign-Reliefs/paths/~1individuals~1reliefs~1foreign~1%7Bnino%7D~1%7BtaxYear%7D/delete)

### Charitable giving

Customers can use their software to submit information about gifts and gift aid payments to non-UK charities. The software can use the following endpoints to enable customers to:

- [Retrieve Charitable Giving Tax Relief](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings/paths/~1individuals~1reliefs~1charitable-giving~1{nino}~1{taxYear}/get)
- [Create and Amend Charitable Giving Tax Relief](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings/paths/~1individuals~1reliefs~1charitable-giving~1{nino}~1{taxYear}/put)
- [Delete Charitable Giving Tax Relief](/api-documentation/docs/api/service/individuals-reliefs-api/1.0/oas/page#tag/Charitable-Givings/paths/~1individuals~1reliefs~1charitable-giving~1{nino}~1{taxYear}/delete)

## Other deductions

This currently applies only to people working at sea outside of the UK. For more information, refer to [Seafarers Earnings Deduction: tax relief if you work on a ship (GOV.UK)](https://www.gov.uk/guidance/seafarers-earnings-deduction-tax-relief-if-you-work-on-a-ship).

Customers can use their software to submit information about seafarers. The software can use the following endpoints to enable customers to:

* [Retrieve Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Deductions](/api-documentation/docs/api/service/other-deductions-api/1.0/oas/page#/paths/~1individuals~1deductions~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Employment expenses

Customers can claim tax relief on certain expenses related to their work. For more information, refer to [Claim tax relief for your job expenses (GOV.UK).](https://www.gov.uk/tax-relief-for-employees) 

Customers can use their software to claim tax relief on the following types of expenses related to their employment:

- travel, vehicle, clothing, uniform, equipment or tools costs
- annual subscriptions paid to approved professional bodies relevant to their work

The software can use the following endpoints to enable customers to:

- [Create and Amend Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}/put)
- [Retrieve Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}/get)
- [Delete Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}/delete)
- [Ignore Employment Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Employment-Expenses/paths/~1individuals~1expenses~1employments~1{nino}~1{taxYear}~1ignore/post)

Customers can also use their software to claim tax relief on other types of expenses related to their work:

- annual subscriptions paid to an approved trade union or friendly society that entitle the customer to a pension, life assurance, or death benefits
- non-annual UK [patent royalty payments](https://www.gov.uk/hmrc-internal-manuals/savings-and-investment-manual/saim9130)

 The software can use the following endpoints to enable customers to:

* [Retrieve Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create and Amend Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Delete Other Expenses](/api-documentation/docs/api/service/individuals-expenses-api/2.0/oas/page#tag/Other-Expenses/paths/~1individuals~1expenses~1other~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Non-PAYE income

Customers might need to pay taxes on any tips they have received. For more information about paying taxes on tips, refer to [Tips at work (GOV.UK)](https://www.gov.uk/tips-at-work).

Customers can use their software to submit information about tips they have received through their employment. The software can use the following endpoints to enable customers to:

* [Create and Amend Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1employments-income~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Retrieve Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1employments-income~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Delete Non-PAYE Employment Income](/api-documentation/docs/api/service/individuals-employments-income-api/1.0/oas/page#tag/Non-PAYE-Employment-Income/paths/~1individuals~1employments-income~1non-paye~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## State benefits

State benefits are sums of money paid by the government to people in certain circumstances to help meet their day-to-day living needs. They exist to make sure no one falls below a minimum standard of living. State benefits are sometimes called allowances, pensions, tax credits or entitlements. For more information, refer to [Tax-free and taxable state benefits (GOV.UK)](https://www.gov.uk/income-tax/taxfree-and-taxable-state-benefits).

Customers can use their software to submit information about incapacity benefits, state pension lump sums and other state benefits. The software can use the following endpoints to enable customers to:

* [List State Benefits](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Create State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D/post)
* [Amend State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/put)
* [Delete State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D/delete)
* [Amend State Benefit Amounts](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/put)
* [Delete State Benefit Amounts](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1amounts/delete)
* [Ignore State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1ignore/post)
* [Unignore State Benefit](/api-documentation/docs/api/service/individuals-state-benefits-api/1.0/oas/page#/paths/~1individuals~1state-benefits~1%7Bnino%7D~1%7BtaxYear%7D~1%7BbenefitId%7D~1unignore/post)

## Providing information about how to treat a loss

A self-employed business can have a loss when trade expenses are more than trade income. If the business has a loss for a year before signing up to Making Tax Digital, the customer or agent will need to submit details about the loss to be brought forward. For more information, refer to [HS227 Losses (GOV.UK).](https://www.gov.uk/government/publications/losses-hs227-self-assessment-helpsheet/hs227-losses-2023#using-losses-types-of-claim)

Customers can submit different types of losses through their software. This includes brought forward losses and capital gains losses. Brought forward losses can be calculated for the customer’s self-employment, UK property, and foreign property business income types. The software can use the following endpoints to enable customers to:

- [Create a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses/post)
- [List brought forward losses](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1tax-year~1{taxYearBroughtForwardFrom}/get)
- [Amend a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1{lossId}~1change-loss-amount/post)
- [Retrieve a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1{lossId}/get)
- [Delete a brought forward loss](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Brought-Forward-Losses/paths/~1individuals~1losses~1{nino}~1brought-forward-losses~1{lossId}/delete)

For capital gains losses, the software can use the following endpoints to enable customers to:

- [Create and Amend Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/put)
- [Retrieve Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/get)
- [Delete Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/delete)

After submitting the above losses, customers can view their loss position. If they do not agree with that, they can submit an independent loss claim. The software can use the following endpoints to enable a customer to:

- [Create a Loss Claim](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims/post)
- [List Loss Claims](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1tax-year~1{taxYearClaimedFor}/get)
- [Retrieve a Loss Claim](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1{claimId}/get)
- [Delete a Loss Claim](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1{claimId}/delete)
- [Amend a Loss Claim Type](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1{claimId}~1change-type-of-claim/post)
- [Amend Loss Claims Order](/api-documentation/docs/api/service/individual-losses-api/4.0/oas/page#tag/Loss-Claims/paths/~1individuals~1losses~1{nino}~1loss-claims~1order~1{taxYearClaimedFor}/put)

## Capital Gains Tax

Capital Gains Tax (CGT) is a tax on the profit when someone sells or disposes of an asset that has increased in value. Customers may need to report on the following types of asset:

* residential property
* other property 
* listed and unlisted shares and securities 

For more information about Capital Gains Tax, refer to [Capital Gains Tax: what you pay it on, rates and allowances (GOV.UK)](https://www.gov.uk/capital-gains-tax).

MTD customers can also report any losses they have made. This charge may be set against earlier or later years. When the customer sells or disposes of the whole or part of a UK residential property and is liable to pay CGT, they must tell HMRC within a specific time following the date of completion of the sale. For more information about the reporting requirement, refer to [Report and pay your Capital Gains Tax: If you sold a property in the UK on or after 6 April 2020 (GOV.UK)](https://www.gov.uk/report-and-pay-your-capital-gains-tax/if-you-sold-a-property-in-the-uk-on-or-after-6-april-2020). For non-resident customers, refer to [Tell HMRC about Capital Gains Tax on UK property or land if you’re not a UK resident (GOV.UK)](https://www.gov.uk/guidance/capital-gains-tax-for-non-residents-uk-residential-property), which advises on how these gains must be reported in year.

The customer can create, update, or delete their CGT in software only after the end of the tax year. If they need to make changes during the year, they need to use HMRC online services. In some cases, customers must report and pay before they submit their final declaration. However, this information will still need to be included in their final declaration if they are a Self Assessment or MTD customer.

An MTD customer can do the following: 

* view CGT Residential Property Disposals for personal property disposal (PPD), non-PPD and other capital gains and disposals
* create or amend CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals
* delete CGT Residential Property Disposals for PPD, non-PPD and other capital gains and disposals

### Viewing CGT

At any time, a customer can view their capital gains tax information. In software, this information is retrieved using the following endpoints:

* [Retrieve All CGT Residential Property Disposals and Overrides (Includes PPD and Non-PPD)](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1disposals-income~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/get)
* [Retrieve Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/get)

### Creating or Amending CGT

Customers can create or amend the different types of CGT information after the end of the tax year. This change must be done before they submit their final declaration. In software, this information is updated using the following endpoints:

* [Create and Amend ‘Report and Pay Capital Gains Tax on Property’ Overrides](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1disposals-income~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D~1ppd/put)
* [Create and Amend CGT Residential Property Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1disposals-income~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/put)
* [Create and Amend Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/put)

### Deleting CGT

Customers can delete different types of CGT only after the end of the tax year and only after they have created CGT using software. However, this change must be done before they submit their final declaration.  In software, this deletion is made using the following endpoints:

* [Delete ‘Report and Pay Capital Gains Tax on Residential Property’ Overrides](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1disposals-income~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D~1ppd/delete)
* [Delete CGT Residential Property Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Capital-Gains-on-Residential-Property-Disposals/paths/~1individuals~1disposals-income~1residential-property~1%7Bnino%7D~1%7BtaxYear%7D/delete)
* [Delete Other Capital Gains and Disposals](/api-documentation/docs/api/service/individuals-capital-gains-income-api/1.0/oas/page#tag/Other-Capital-Gains-and-Disposals/paths/~1individuals~1disposals-income~1other-gains~1%7Bnino%7D~1%7BtaxYear%7D/delete)

## Marriage Allowance

Marriage Allowance allows the customer to transfer some of their Personal Allowance to their husband, wife or civil partner. This will reduce the customer's tax in the next tax year (6 April to 5 April). For more information about marriage allowance, refer to [Marriage Allowance: How it works - GOV.UK](https://www.gov.uk/marriage-allowance).

Customers can create a Marriage Allowance claim using their name, date of birth and National Insurance number. To do this action, the software must call the [Create Marriage Allowance](/api-documentation/docs/api/service/individuals-disclosures-api/1.0/oas/page#tag/Marriage-Allowance/paths/~1individuals~1disclosures~1marriage-allowance~1{nino}/post) endpoint in the [Individuals Disclosures API](/api-documentation/docs/api/service/individuals-disclosures-api/). After the claim has been accepted by HMRC, the customer can view their Marriage Allowance in their tax calculations.
