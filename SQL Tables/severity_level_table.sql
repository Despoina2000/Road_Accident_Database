CREATE TABLE severity_level(
	id int,
	severity varchar(10)
);

insert into severity_level
Select [severity_id],[severity] FROM [ACCIDENTSDW ].[dbo].[accdata];
