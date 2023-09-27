# Road_Accident_Database
## Description
The creation of this database provides useful information for road safety policy-making and the reduction of traffic fatalities. The ACCDATA.zip (Accidents Data) file contains data on traffic accidents recorded by UK police authorities between 2005 and 2015. The goal is to analyze the number of road traffic accidents, the number of victims, and the number of vehicles involved based on the gender and age of the at-fault driver, the type of vehicle, the severity of the accident, the condition of the surface conditions at the scene of the accident, and any combination thereof. It is understood that the analysis of the data should also take the time factor into account so that competent authorities are able to produce statistical reports with accident data by month, quarter, and year.

## The Ιmplementations
We set up our database with [SQL queries](https://github.com/Despoina2000/Road_Accident_Database/tree/main/SQL%20Tables) using the [MICROSOFT SQL SERVER](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) program. Then we created [two files with queries](https://github.com/Despoina2000/Road_Accident_Database/tree/main/Queries) to test the efficiency of the database and find necessary statistics.

## Team Members
- [Despoina Papadopoulou](https://github.com/Despoina2000)


## Data in ACCDATA.zip
  - **accident_id**
    -  [type: varchar(15)]
    -  Accident ID code
  - **severity_id**
    - [type:integer]
    - Severity classification ID code
  - **severity**
    -  [type: varchar(10)]
    -  Characterisation of the severity of the accident (fatal, serious, etc.)
  - **road_surface_conditions_id**
    - [type: integer]
    - Road condition ID code
  - **road_surface_conditions**
    -  [type: varchar(50)]
    -  Condition of the road surface at the place of the accident
  - **accident_date**
    - [type: date]
    - Ημερομηνία ατυχήματος
  - **number_of_vehicles**
    - [type: integer]
    - The number of vehicles involved in the accident.
  - **vehicle_type_id**
    - [type: integer]
    - Category code of the vehicle which caused the accident.
  - **vehicle_type**
    -  [type: varchar(50)]
    -   Category of vehicle which caused the accident.
  - **driver_class_id**
    - [type: integer]
    - Driver category code. It expresses the category to which the driver responsible for the accident is assigned according to sex and age. E.g. Female drivers of 20 years of age are classified in category 5 (5, Female, 20).
  - **sex_of_driver**
    -  [type: varchar(6)]
    -  The gender of the driver responsible for the accident.
  - **age_of_driver**
    - [type: integer]
    - The age of the driver responsible for the accident.
  - **sex_of_casualty**
    -  [type: varchar(6)]
    -  Gender of the victim. Victim means any person who has died, been seriously injured or slightly injured as a result of the accident.
  - **age_of_casualty**
    -  [type: integer]
    -  Age of the victim.
