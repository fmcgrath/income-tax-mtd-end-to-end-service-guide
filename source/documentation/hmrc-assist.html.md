---
title: HMRC Assist | Income Tax (Making Tax Digital) end-to-end service guide
weight: 50
description: Software developers, designers, product owners or business analysts. Integrate your software with the Income Tax API for Making Tax Digital.
---

# HMRC Assist
<!--- Section owner: Transactional Risking --->

As part of Making Tax Digital, HMRC Assist is a set of APIs that will create a better customer experience by prompting customers with help through their software when they make the following tax calculations: 

- in-year to date
- in-year forecast
- end-of-year

HMRC Assist is a new digital service for customers who have signed up for Making Tax Digital ITSA. It will provide targeted and tailored messaging to support individual customers with their tax affairs. Agents acting on behalf of clients will receive the same service when they request a tax calculation.

The service will encourage customers to submit accurate information using personalised real-time guidance, increasing correct first-time submissions and compliance.

The service will take the calculation data of the customer, analyse the submission and generate a series of guidance materials, links and suggested actions for the customer to review. 

HMRC Assist will be integrated into HMRC’s ITSA Submission Service so that customers completing their final declaration or return amendment using HMRC online services will receive tailored assistance.

## High-level HMRC Assist customer journey

<a href="figures/customer-journey-transactional-risking-high-level.svg" target="blank"><img src="figures/customer-journey-transactional-risking-high-level.svg" alt="High level diagram" style="width:720px;" /></a>

<a href="figures/customer-journey-transactional-risking-high-level.svg" target="blank">Open the high-level diagram in a new tab.</a>

## HMRC Assist endpoints

There are two endpoints.

| Endpoint | Description |
| -------- | ----------- |
| [Produce a HMRC Self Assessment Assist Report](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-assist/1.0/oas/page#tag/Generate-Report/paths/~1individuals~1self-assessment~1assist~1reports~1{nino}~1{taxYear}~1{calculationId}/post) | Enables you to generate and return a HMRC Self Assessment Assist report for a tax calculation for a given customer. |
| [Acknowledge a HMRC Self Assessment Assist Report](https://developer.service.hmrc.gov.uk/api-documentation/docs/api/service/self-assessment-assist/1.0/oas/page#tag/Acknowledge-Report/paths/~1individuals~1self-assessment~1assist~1reports~1acknowledge~1{nino}~1{reportId}~1{correlationId}/post) | Enables you to acknowledge that the customer or agent has read the report. |

### Produce a HMRC Self Assessment Assist Report

The report contains targeted feedback based on what the customer advises HMRC in their update for the given National Insurance number (NINO), Calculation ID, and tax year.

<a href="figures/customer-journey-transactional-risking-produce-report.svg" target="blank"><img src="figures/customer-journey-transactional-risking-produce-report.svg" alt="Produce report" style="width:720px;" /></a>

<a href="figures/customer-journey-transactional-risking-produce-report.svg" target="blank">Open the produce a report diagram in a new tab.</a>

An HTTP 200 success code is returned and the targeted message, recommended action and guidance links are within the JSON for the software to display.

### Acknowledge a HMRC Self Assessment Assist Report

This endpoint enables you to acknowledge that the given report has been read by either the customer or agent.

<a href="figures/customer-journey-transactional-risking-acknowledge.svg" target="blank"><img src="figures/customer-journey-transactional-risking-acknowledge.svg" alt="Acknowledge a HMRC Assist Report" style="width:720px;" /></a>

<a href="figures/customer-journey-transactional-risking-acknowledge.svg" target="blank">Open the Acknowledge HMRC Assist report diagram in a new tab</a>.

To acknowledge the report, an HTTP 204 code is returned and contains no content.
