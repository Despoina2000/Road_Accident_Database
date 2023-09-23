CREATE TABLE accident_date(
    acc_date date,
    t_year int,
 t_quarter int,
 t_month int
)
insert into accident_date
 select distinct [accident_date], [datepart(year, accident_date)],
 [datepart(quarter, accident_date)],[datepart(month, accident_date)]
from [ACCIDENTSDW ].[dbo].[accdata];