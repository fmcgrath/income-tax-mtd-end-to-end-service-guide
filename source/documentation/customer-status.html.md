---
title: Customer status | Income Tax (Making Tax Digital) end-to-end service guide
weight: 3
---

# Customer status

To manage a customer's filing obligations, MTD needs to identify different types of customer in the service. To do this, MTD has allocated a status for each customer for each tax year. This status will be reviewed annually by HMRC using the latest tax return received from the customer. This status will persist year-on-year. 

In software, the customer status can be retrieved using the [Self Assessment Individual Details](/api-documentation/docs/api/service/self-assessment-individual-details-api/) API. However, the software should not show the ITSA status to the customer. Instead, the statuses can be used in software in the following ways: 

- encourage customers to fulfil their obligations 
- where necessary, inform customers that they may receive a penalty if they do not submit their updates on time
- establish if a customer can opt out of MTD or sign up and direct them to HMRC online services 

The different types of customer status are described below.

## MTD mandated

MTD mandated customers have qualifying income above the MTD threshold. This status will not be set until the first mandated year when their obligations become penalty-bearing. These obligations include quarterly updates, end-of-period statement, and final declaration. 

## MTD voluntary

MTD voluntary customers have qualifying income below or equal to the MTD threshold. These customers will have the same obligations as MTD mandated customers but only the final declaration is penalty-bearing. 

## Annual

Annual customers have an annual self-assessment return obligation which is penalty-bearing. This status will include customers who have qualifying income below or equal to the MTD threshold and have chosen not to voluntarily sign up for MTD. 

## MTD exempt

MTD exempt customers have manually applied for an exemption from MTD. If a request has been made for VAT, it is applied to MTD ITSA without the need for a further application. These customers will have an annual self-assessment return obligation which is penalty-bearing.  

## Non-digital

Non-digital customers have manually applied for a non-digital status. If a request has been made for VAT, it is applied to MTD ITSA without the need for a further application.  These customers will have an annual self-assessment return obligation which is penalty-bearing. Customers with this status are unlikely to be using a software product to meet their self-assessment obligations. 

## Dormant

Dormant customers are no longer required to file a self-assessment tax return. No obligations will be created. Customers with this status may start using software and intend to file a self-assessment tax return but have yet to inform HMRC.
