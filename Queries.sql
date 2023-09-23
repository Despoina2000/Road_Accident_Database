--Display a catalog of the number of accidents per year and accident severity. The list should be sorted by year in descending order.
SELECT datepart(year, acc_date) , COUNT (DISTINCT a.id), s.severity
FROM  [ACCIDENTSDW ].[dbo].[accdata],[ACCIDENTSDW ].[dbo].[accident_info] a, [ACCIDENTSDW ].[dbo].[severity_level] s
WHERE a.id=accident_id AND s.id=severity_id 
GROUP BY datepart(year, acc_date), s.severity
ORDER BY datepart(year, acc_date) DESC;

-- Display a catalog of the number of fatal accidents (Fatal) and the total number of victims by gender and age of the driver at fault (driver responsible for the accident).
SELECT  d.sex,d.age, COUNT (DISTINCT a.id) as accidents
FROM  [ACCIDENTSDW ].[dbo].[accdata],[ACCIDENTSDW ].[dbo].[accident_info] a, [ACCIDENTSDW ].[dbo].[severity_level] s, [ACCIDENTSDW ].[dbo].[driver] d
WHERE a.id=accident_id AND s.id=severity_id AND d.driver_class=driver_class_id  AND s.id=1
GROUP BY CUBE(d.sex,d.age);

-- Display a catalog with a breakdown of the number of accidents based on road surface conditions and the severity of the accident.
SELECT  s.severity,r.condition, COUNT (DISTINCT a.id) as accidents
FROM  [ACCIDENTSDW ].[dbo].[accdata],[ACCIDENTSDW ].[dbo].[accident_info] a, [ACCIDENTSDW ].[dbo].[severity_level] s, [ACCIDENTSDW ].[dbo].[road_condition] r
WHERE a.id=accident_id AND s.id=severity_id AND r.id= road_surface_conditions_id
GROUP BY s.severity,r.condition;

--
