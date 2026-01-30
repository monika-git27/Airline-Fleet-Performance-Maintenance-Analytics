-- Business Applications
-- 1. Classify Aircraft by Age Group
SELECT
    "Airline",
    "Aircraft_Model",
    CASE
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" < 10
            THEN 'New (0-9 yrs)'
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" BETWEEN 10 AND 20
            THEN 'Mid-life (10-20 yrs)'
        ELSE 'Old (>20 yrs)'
    END AS age_group,
    COUNT(*) AS aircraft_count
FROM fleet_table
GROUP BY
    "Airline",
    "Aircraft_Model",
    age_group
ORDER BY
    age_group DESC,
    aircraft_count DESC;

-- 2. Spare Parts Demand Forecast
SELECT
    "Airline",
    "Aircraft_Model",
    COUNT(*) AS aircraft_count,
    ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built"), 1) AS avg_age,
    ROUND(AVG("Fuel_Burn_L_hr" * 1.0 / "Seats"), 2) AS avg_fuel_burn_per_seat,
    CASE
        WHEN AVG(EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built") > 20
             OR AVG("Fuel_Burn_L_hr" * 1.0 / "Seats") > 35
            THEN 'High Demand'
        WHEN AVG(EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built") BETWEEN 10 AND 20
            THEN 'Medium Demand'
        ELSE 'Low Demand'
    END AS spare_part_demand_category
FROM fleet_table
WHERE "Status" = 'Active'
GROUP BY
    "Airline",
    "Aircraft_Model"
ORDER BY
    spare_part_demand_category DESC,
    avg_age DESC;

-- 3. Airline Fleet Standardization (Complexity Index)
SELECT
    "Airline",
    COUNT(DISTINCT "Aircraft_Model") AS unique_models,
    COUNT(*) AS total_aircraft,
    ROUND(
        COUNT(*) * 1.0 / COUNT(DISTINCT "Aircraft_Model"),
        2
    ) AS aircraft_per_model
FROM fleet_table
GROUP BY
    "Airline"
ORDER BY
    unique_models DESC;

-- 4. Aircraft Retirement Forecast (based on Age Thresholds)
SELECT
    "Airline",
    "Aircraft_Model",
    COUNT(*) FILTER (
        WHERE EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" > 25
    ) AS immediate_retirement,
    COUNT(*) FILTER (
        WHERE EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" BETWEEN 20 AND 25
    ) AS near_retirement,
    COUNT(*) FILTER (
        WHERE EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" < 20
    ) AS active_healthy
FROM fleet_table
GROUP BY
    "Airline",
    "Aircraft_Model"
ORDER BY
    immediate_retirement DESC;

-- 5. Engine Reliability Risk by Age
SELECT
    "Engine_Type",
    CASE
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" > 20
            THEN 'High Risk'
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" BETWEEN 10 AND 20
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level,
    COUNT(*) AS aircraft_count
FROM fleet_table
WHERE "Status" = 'Active'
GROUP BY
    "Engine_Type",
    risk_level
ORDER BY
    "Engine_Type",
    risk_level;

-- 6. Spare Part Demand by Age Group
SELECT
    CASE
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" < 10
            THEN 'New (<10 yrs)'
        WHEN EXTRACT(YEAR FROM CURRENT_DATE) - "Year_Built" BETWEEN 10 AND 20
            THEN 'Mid-life (10–20 yrs)'
        ELSE 'Old (>20 yrs)'
    END AS age_group,
    COUNT(*) AS aircraft_count
FROM fleet_table
WHERE "Status" = 'Active'
GROUP BY
    age_group
ORDER BY
    aircraft_count DESC;

-- 7. Engine Type & Spare Part Planning
SELECT
    "Engine_Type",
    COUNT(*) AS aircraft_count
FROM fleet_table
WHERE "Status" = 'Active'
GROUP BY
    "Engine_Type"
ORDER BY
    aircraft_count DESC;

-- 8. Transitioning Fleet Models (Active and Retired Mix)
SELECT
    "Aircraft_Model",
    COUNT(CASE WHEN "Status" = 'Active' THEN 1 END) AS active_count,
    COUNT(CASE WHEN "Status" = 'Retired' THEN 1 END) AS retired_count
FROM fleet_table
WHERE "Aircraft_Model" IN (
    SELECT
        "Aircraft_Model"
    FROM fleet_table
    GROUP BY
        "Aircraft_Model"
    HAVING
        COUNT(DISTINCT "Status") > 1
)
GROUP BY
    "Aircraft_Model"
ORDER BY
    retired_count DESC;

-- 9. Fuel Inefficiency & Maintenance Demand
SELECT
    "Airline",
    "Aircraft_Model",
    ROUND(AVG("Fuel_Burn_L_hr"), 0) AS avg_fuel_burn,
    ROUND(AVG("Range_km"), 0) AS avg_range
FROM fleet_table
WHERE "Status" = 'Active'
GROUP BY
    "Airline",
    "Aircraft_Model"
ORDER BY
    avg_fuel_burn DESC;

