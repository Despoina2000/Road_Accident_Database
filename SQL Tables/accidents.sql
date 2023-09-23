create table accidents
(accident_id varchar(15) primary key,
severity_id int foreign key references severity(severity_id),
road_surface_conditions_id int foreign key references
road_surface(road_surface_conditions_id),
vehicle_type_id int foreign key references vehicle(vehicle_type_id),
driver_class_id int foreign key references driver_class(driver_class_id),
accident_date date foreign key references d_time(accident_date),
number_of_vehicles int,
number_of_casualties int
);
insert accidents
 select [accident_id], [severity_id], [road_surface_conditions_id],
[vehicle_type_id], [driver_class_id], [accident_date],
 [number_of_vehicles], count(*)
from [ACCIDENTSDW ].[dbo].[accdata]
 group by [accident_id], [severity_id], [road_surface_conditions_id],
[vehicle_type_id], [driver_class_id], [accident_date],
 [number_of_vehicles]