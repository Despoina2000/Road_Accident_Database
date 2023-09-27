--Display a catalog of the number of accidents per year and accident severity. The list should be sorted by year in descending order.
SELECT t_year , COUNT (DISTINCT a.id), s.severity
FROM  [ACCIDENTSDW ].[dbo].[accdata],[ACCIDENTSDW ].[dbo].[accidents] a, [ACCIDENTSDW ].[dbo].[severity_level] s
WHERE a.id=accident_id AND s.id=severity_id 
GROUP BY t_year, s.severity
ORDER BY t_year DESC;

-- Display a catalog of the number of fatal accidents (Fatal) and the total number of victims by gender and age of the driver at fault (driver responsible for the accident).
SELECT  d.sex,d.age, COUNT (DISTINCT a.id) as accidents,SUM(number_of_casualties) as victims
FROM  [ACCIDENTSDW ].[dbo].[accident_date],[ACCIDENTSDW ].[dbo].[accidents] a, [ACCIDENTSDW ].[dbo].[severity_level] s, [ACCIDENTSDW ].[dbo].[driver] d
WHERE a.id=accident_id AND s.id=severity_id AND d.driver_class=driver_class_id  AND s.id=1
GROUP BY CUBE(d.sex,d.age);

-- Display a catalog with a breakdown of the number of accidents based on road surface conditions and the severity of the accident.
SELECT  s.severity,r.condition, COUNT (DISTINCT a.id) as accidents
FROM  [ACCIDENTSDW ].[dbo].[accidents] a, [ACCIDENTSDW ].[dbo].[severity_level] s, [ACCIDENTSDW ].[dbo].[road_condition] r
WHERE a.id=accident_id AND s.id=severity_id AND r.id= road_surface_conditions_id
GROUP BY s.severity,r.condition;

--Display a catalog of the number of accidents and the number of victims by year and type of vehicle (vehicle type) that caused the accident. The list shall only be calculated for accidents involving more than 2 vehicles.
SELECT  t_year, v.v_type, COUNT (DISTINCT a.id) as accidents, SUM(a.age_of_casualty) as victims
FROM  [ACCIDENTSDW ].[dbo].[accident_date],[ACCIDENTSDW ].[dbo].[accidents] a, [ACCIDENTSDW ].[dbo].[vehicle] v 
WHERE a.id=accident_id AND v.id=vehicle_type_id AND a.number_of_vehicles>2
GROUP BY t_year, v.v_type
ORDER BY t_year;

--A report containing the following information:
--    a.	The total number of accidents, the total number of vehicles involved in an accident, and the total number of fatalities over the ten-year period (2005 to 2015). 
--    b.	 The number of accidents, the number of vehicles involved in an accident, and the number of fatalities on an annual basis.
--    c.	The number of accidents, the number of vehicles involved in an accident, and the number of victims by quarter and month of each year.

SELECT  count(v.v_type) as vehicles, t_quarter as year, COUNT (DISTINCT a.id) as accidents, count(a.age_of_casualty) as victims
FROM  [ACCIDENTSDW ].[dbo].[accident_date],[ACCIDENTSDW ].[dbo].[accidents] a, [ACCIDENTSDW ].[dbo].[vehicle] v 
WHERE a.id=accident_id AND v.id=vehicle_type_id AND acc_date = a.accident_date AND a.number_of_vehicles>2
GROUP BY ROLLUP (t_year, t_quarter, t_month);