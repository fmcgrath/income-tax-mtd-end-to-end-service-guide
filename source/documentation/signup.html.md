---
title: Sign up | Income Tax (Making Tax Digital) end-to-end service guide
weight: 2
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# Sign up

## Signing up to Making Tax Digital for Income Tax

Sign up by means of an API has been ruled out for security reasons.

Taxpayers can sign up for Making Tax Digital for Income Tax without having software in place. However, they must get and authorise [software](/guides/income-tax-mtd-end-to-end-service-guide/index.html#software-choices) before they start using Making Tax Digital for Income Tax.

To use Making Tax Digital for Income Tax, individuals need to sign up first.

To sign up, a user must:

- be a sole trader (self-employed) and/or
- have income from property, either in the UK or abroad

See [Sign up as an individual for Making Tax Digital for Income Tax](https://www.gov.uk/guidance/sign-up-your-business-for-making-tax-digital-for-income-tax) for more information.

If an individual is a self employed partner in a partnership, they do not need to sign up to MTD ITSA unless they have other MTD qualifying income, such as:

- sole trader income
- UK or foreign property income

If this is the case, the individual must not include either their partner or partnership business details in the sign up service. Instead, this income will continue to be submitted as part of their self assessment tax return.  There is no requirement at this time to submit partner or partnership income quarterly to HMRC.

A user can also get their appointed tax agent (for instance, an accountant or bookkeeper) to sign up on their behalf, with their permission.

We advise customers to speak to their agent (if they have one) before choosing software to ensure that it is compatible.

## Agent sign-up

Before agents can sign up clients to Making Tax Digital, they must:

- [create an agent services account](https://www.gov.uk/guidance/get-an-hmrc-agent-services-account)
- use their [agent services account](https://www.gov.uk/guidance/sign-in-to-your-agent-services-account) to have authorisation in place from their clients:
  - existing clients - copy existing authorisations from Self Assessment
  - new clients - request authorisation

For more information, refer to [Making Tax Digital for Income Tax as an agent: step by step](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-as-an-agent-step-by-step).

## Individual sign-up

Individuals who are self employed and/or have property income can sign themselves up for Making Tax Digital for Income Tax.

For more information, refer to [Making Tax Digital for Income Tax for individuals: step by steps](https://www.gov.uk/government/collections/making-tax-digital-for-income-tax-for-businesses-step-by-step).

## Linking software to HMRC

Businesses and agents using your software to connect to the [Income Tax (Making Tax Digital) APIs](/api-documentation/docs/api?filter=income-tax) must grant authority to your software to interact with HMRC on their behalf. We use the open standard [OAuth 2.0](https://oauth.net/2/) (opens in a new tab), which involves the business or agent signing in via their Government Gateway account and following the grant authority user journey.

<a href="figures/link-software-to-hmrc.svg" target="blank"><img src="figures/link-software-to-hmrc.svg" alt="Link software to HMRC" style="width:720px;" /></a>

[Open the link software to HMRC process diagram in a new tab.](/guides/vat-mtd-end-to-end-service-guide/documentation/figures/link-software-to-hmrc.svg)

1.	Business or agent requests to link your software to HMRC.
2.	Your software launches the grant authority user journey.
3.	Business or agent views the HMRC start page for an overview of the process and chooses to continue.
4.	Business or agent signs in with their Government Gateway user ID and password (**agents must use their new agent services user ID**).
5.	Business or agent registers for or completes 2-step verification as applicable.
6.	Business or agent completes identity checks if applicable.
7.	Business or agent grants authority for the software to interact with HMRC on their behalf.
8.	HMRC generates an OAuth token for the business or agent.
9.	Your software stores the business or agent’s OAuth token for later use in API calls on their behalf.

Businesses and agents authenticate directly with us using their Government Gateway user ID and password, and grant the software the authority to interact with HMRC on their behalf. They grant this for a set of functions called API scopes which are required for each ITSA (MTD) endpoint.

In the case of agents, they must sign in to their Government Gateway account with the user ID and password for their new agent services account, which was generated as part of the agent services account journey.

We then generate an OAuth 2.0 access token for the software which is specific to the business or agent. The software must pass this access token in subsequent API requests as explained in authorisation of user-restricted endpoints.
