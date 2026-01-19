# Fleet-Analytics-Maintenance-Planning
## Project Overview

This project analyzes airline fleet data to assess fleet health, operational efficiency, maintenance risk, and retirement readiness.
Using SQL for analysis and Power BI for visualization, the project converts raw aircraft data into structured, decision-ready insights to support maintenance prioritization and fleet planning.

## Objectives

- Validate and structure aircraft fleet data for accurate analysis

- Analyze fleet composition, aircraft age, and performance efficiency

- Identify high-risk and maintenance-intensive aircraft

- Classify aircraft into maintenance and retirement risk categories

- Present insights through an interactive Power BI dashboard

## Dataset Description

The dataset contains aircraft-level information including:

- Airline

- Aircraft model

- Registration ID

- Year built

- Seating capacity

- Engine type

- Range (km)

- Fuel burn (liters/hour)

- Operational status (Active / Retired)

## Tools & Technologies

- SQL (PostgreSQL) – Data validation, aggregation, and analysis

- Power BI – Interactive dashboards and KPI reporting

## Data Quality & Validation (SQL)

Before analysis, data quality checks were performed to ensure reliability:

- Duplicate aircraft detection using Registration_ID

- Missing value checks across key fields

- Validation of build year ranges

- Detection of invalid numeric values (seats, range, fuel burn)

- Review of inconsistent status values

## Analytical Approach
1️. Fleet Health & Composition

- Active vs Retired aircraft distribution

- Fleet breakdown by airline and aircraft model

2️. Aircraft Age & Lifecycle Analysis

- Dynamic age calculation using build year

- Classification into New, Mid-life, and Old aircraft

3️. Performance & Efficiency Metrics

- Fuel burn per seat for standardized efficiency comparison

- Range efficiency (km per liter) to evaluate aircraft performance

- Ranking of aircraft models by efficiency

4️. Maintenance & Risk Assessment

- Identification of 18 high-risk aircraft using age and fuel indicators

- Classification into 3 spare-parts demand tiers (High / Medium / Low)

- Engine-type distribution for maintenance planning

5️. Retirement Readiness

- Aircraft categorized into:

- Immediate Retirement

- Near Retirement

- Active & Healthy

## Power BI Dashboard
![Fleet Performance Dashboard](https://github.com/monika-git27/Fleet-Analytics-Maintenance-Planning/blob/main/Dashboard.png)

The Power BI dashboard provides:

- Fleet KPIs (total aircraft, active fleet, average age)

- Fuel efficiency rankings by aircraft model

- Age distribution and retirement readiness

- Maintenance and spare-parts demand categories

 Interactive filters allow users to analyze data by:

- Airline

- Aircraft model

- Status

- Age group

## Key Outcomes

- Established a clear fleet health baseline using validated data

- Identified 18 high-risk aircraft requiring closer maintenance review

- Standardized performance comparison across aircraft models

- Enabled targeted maintenance planning using 3 demand tiers

- Delivered decision-ready insights through an interactive dashboard

## Business Value

This analysis helps airline stakeholders:

- Prioritize maintenance efforts

- Identify inefficient and aging aircraft

- Support fleet renewal and retirement planning

- Reduce reliance on manual analysis


