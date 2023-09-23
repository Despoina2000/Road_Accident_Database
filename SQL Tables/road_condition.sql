CREATE TABLE road_condition(
	id int,
	condition varchar(50) NULL
);

insert into road_condition
Select[road_surface_conditions_id],[road_surface_conditions] FROM [ACCIDENTSDW ].[dbo].[accdata];
