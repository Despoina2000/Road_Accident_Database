CREATE TABLE vehicle(
	id int,
	v_type varchar(50)
);

insert into vehicle
Select [vehicle_type_id],[vehicle_type] FROM [ACCIDENTSDW ].[dbo].[accdata];
