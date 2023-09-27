-- The creation of a data cube, each cell of which contains the number of accidents for a specific combination of values: accident severity, road_surface_conditions and vehicle type.
SELECT  s.severity,r.condition, v.v_type, COUNT (DISTINCT a.id) as accidents
FROM [ACCIDENTSDW ].[dbo].[accidents] a, [ACCIDENTSDW ].[dbo].[vehicle] v,[ACCIDENTSDW ].[dbo].[road_condition] r,[ACCIDENTSDW ].[dbo].[severity_level] s
WHERE a.id=accident_id AND v.id=vehicle_type_id AND s.id=severity_id AND r.id= road_surface_conditions_id
GROUP BY Cube (s.severity,r.condition, v.v_type);

--Create a MATERIALIZED view (INDEXED VIEW in the SQL SERVER) which will contain the result of the previous query.

    --View
CREATE VIEW Accidents
WITH SCHEMABINDING AS
SELECT  s.severity,r.condition, v.v_type, COUNT (DISTINCT a.id) as accidents
FROM  [ACCIDENTSDW ].[dbo].[accdata],[ACCIDENTSDW ].[dbo].[accident_info] a, [ACCIDENTSDW ].[dbo].[vehicle] v,[ACCIDENTSDW ].[dbo].[road_condition] r,[ACCIDENTSDW ].[dbo].[severity_level] s
WHERE a.id=accident_id AND v.id=vehicle_type_id AND s.id=severity_id AND r.id= road_surface_conditions_id
GROUP BY s.severity,r.condition, v.v_type;

    --Index
CREATE UNIQUE CLUSTERED INDEX accindent_indx ON
Accidents(severity, road_surface_conditions, vehicle_type)

    --Queries (CUBE simulation)

Select *
from Accindets;

Select condition, v_type, SUM (DISTINCT a.id) as accidents
from Accindets
GROUP BY condition, v_type;

Select severity, v_type, SUM (DISTINCT a.id) as accidents
from Accindets
Group By severity, v_type;

Select v_type, SUM (DISTINCT a.id) as accidents
from Accindets
Group By v_type;

Select severity, conditon, SUM (DISTINCT a.id) as accidents
from Accindets
Group By severity, conditon;

Select conditon, SUM (DISTINCT a.id) as accidents
from AccindetsG
Group By conditon;

Select severity, SUM (DISTINCT a.id) as accidents
from Accindets
Group By severity;

Select SUM (DISTINCT a.id) as accidents
from Accindets;

