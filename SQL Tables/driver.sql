CREATE TABLE driver(
	driver_class int,
	sex varchar(6),
	age int
);

insert into driver 
Select distinct [driver_class_id] ,[sex_of_driver],[age_of_driver] FROM [ACCIDENTSDW ].[dbo].[accdata];
