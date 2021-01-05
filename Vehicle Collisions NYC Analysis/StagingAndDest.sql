use VehicleCrash_New_york_20162020

-- Staging tables

create table crash_stage
(	CRASH_DATE varchar(50),
	CRASH_TIME	varchar(50),	
	BOROUGH	varchar(50),
	ZIP_CODE	varchar(50),
	LATITUDE	varchar(50),
	LONGITUDE	varchar(50),
	LOCATION	varchar(50),
	ON_STREET_NAME	varchar(50),
	CROSS_STREET_NAME	varchar(50),
	OFF_STREET_NAME	varchar(50),
	NUMBER_OF_PERSONS_INJURED	varchar(50),
	NUMBER_OF_PERSONS_KILLED	varchar(50),
	NUMBER_OF_PEDESTRIANS_INJURED	varchar(50),
	NUMBER_OF_PEDESTRIANS_KILLED	varchar(50),
	NUMBER_OF_CYCLIST_INJURED	varchar(50),
	NUMBER_OF_CYCLIST_KILLED	varchar(50),
	NUMBER_OF_MOTORIST_INJURED	varchar(50),
	NUMBER_OF_MOTORIST_KILLED	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_1	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_2	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_3	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_4	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_5	varchar(50),
	COLLISION_ID	varchar(50),
	VEHICLE_TYPE_CODE_1	varchar(50),
	VEHICLE_TYPE_CODE_2	varchar(50),
	VEHICLE_TYPE_CODE_3	varchar(50),
	VEHICLE_TYPE_CODE_4	varchar(50),
	VEHICLE_TYPE_CODE_5 varchar(50)
)


create table hospital_stage
(	Hospital_ID int,
	Facility_Type varchar(50),	
	Borough	varchar(50),
	Facility_Name	varchar(50),
	Cross_Streets	varchar(50),
	Phone	varchar(50),
	Location_1	varchar(50)
)

create table vehicle_stage
(	UNIQUE_ID varchar(50),
	COLLISION_ID varchar(50),
	CRASH_DATE varchar(50),
	CRASH_TIME varchar(50),
	VEHICLE_ID varchar(50),
	STATE_REGISTRATION varchar(50),
	VEHICLE_TYPE varchar(50),
	VEHICLE_MAKE varchar(50),
	VEHICLE_MODEL varchar(50),
	VEHICLE_YEAR varchar(50),
	TRAVEL_DIRECTION varchar(50),
	VEHICLE_OCCUPANTS varchar(50),
	DRIVER_SEX varchar(50),
	DRIVER_LICENSE_STATUS varchar(50),
	DRIVER_LICENSE_JURISDICTION varchar(50),
	PRE_CRASH varchar(50),
	POINT_OF_IMPACT varchar(50),
	VEHICLE_DAMAGE varchar(50),
	VEHICLE_DAMAGE_1 varchar(50),
	VEHICLE_DAMAGE_2 varchar(50),
	VEHICLE_DAMAGE_3 varchar(50),
	PUBLIC_PROPERTY_DAMAGE varchar(50),
	PUBLIC_PROPERTY_DAMAGE_TYPE varchar(50),
	CONTRIBUTING_FACTOR_1 varchar(50),
	CONTRIBUTING_FACTOR_2 varchar(50)	
)

create table person_stage
(	UNIQUE_ID varchar(50),
	COLLISION_ID varchar(50),
	CRASH_DATE varchar(50),
	CRASH_TIME varchar(50),
	PERSON_ID varchar(50),
	PERSON_TYPE varchar(50),
	PERSON_INJURY varchar(50),
	VEHICLE_ID varchar(50),
	PERSON_AGE varchar(50),
	EJECTION varchar(50),
	EMOTIONAL_STATUS varchar(50),
	BODILY_INJURY varchar(50),
	POSITION_IN_VEHICLE varchar(50),
	SAFETY_EQUIPMENT varchar(50),
	PED_LOCATION varchar(50),
	PED_ACTION varchar(50),
	COMPLAINT varchar(50),
	PED_ROLE varchar(50),
	CONTRIBUTING_FACTOR_1 varchar(50),
	CONTRIBUTING_FACTOR_2 varchar(50),
	PERSON_SEX varchar(50)
)

create table weather_stage
(	STATION varchar(50),
	NAME varchar(50),
	LATITUDE varchar(50),
	LONGITUDE varchar(50),
	ELEVATION varchar(50),
	DATE varchar(50),
	AWND varchar(50),
	AWND_ATTRIBUTES varchar(50),
	DAPR varchar(50),
	DAPR_ATTRIBUTES varchar(50),
	DASF varchar(50),
	DASF_ATTRIBUTES varchar(50),
	MDPR varchar(50),
	MDPR_ATTRIBUTES varchar(50),
	MDSF varchar(50),
	MDSF_ATTRIBUTES varchar(50),
	PGTM varchar(50),
	PGTM_ATTRIBUTES varchar(50),
	PRCP varchar(50),
	PRCP_ATTRIBUTES varchar(50),
	PSUN varchar(50),
	PSUN_ATTRIBUTES varchar(50),
	SNOW varchar(50),
	SNOW_ATTRIBUTES varchar(50),
	SNWD varchar(50),
	SNWD_ATTRIBUTES varchar(50),
	TAVG varchar(50),
	TAVG_ATTRIBUTES varchar(50),
	TMAX varchar(50),
	TMAX_ATTRIBUTES varchar(50),
	TMIN varchar(50),
	TMIN_ATTRIBUTES varchar(50),
	TOBS varchar(50),
	TOBS_ATTRIBUTES varchar(50),
	TSUN varchar(50),
	TSUN_ATTRIBUTES varchar(50),
	WDF2 varchar(50),
	WDF2_ATTRIBUTES varchar(50),
	WDF5 varchar(50),
	WDF5_ATTRIBUTES varchar(50),
	WESD varchar(50),
	WESD_ATTRIBUTES varchar(50),
	WESF varchar(50),
	WESF_ATTRIBUTES varchar(50),
	WSF2 varchar(50),
	WSF2_ATTRIBUTES varchar(50),
	WSF5 varchar(50),
	WSF5_ATTRIBUTES varchar(50),
	WT01 varchar(50),
	WT01_ATTRIBUTES varchar(50),
	WT02 varchar(50),
	WT02_ATTRIBUTES varchar(50),
	WT03 varchar(50),
	WT03_ATTRIBUTES varchar(50),
	WT04 varchar(50),
	WT04_ATTRIBUTES varchar(50),
	WT05 varchar(50),
	WT05_ATTRIBUTES varchar(50),
	WT06 varchar(50),
	WT06_ATTRIBUTES varchar(50),
	WT08 varchar(50),
	WT08_ATTRIBUTES varchar(50),
	WT09 varchar(50),
	WT09_ATTRIBUTES varchar(50),
	WT11 varchar(50),
	WT11_ATTRIBUTES varchar(50)
)

create table contributing_factors
( contributing_factor varchar(50))

insert into contributing_factors select distinct CONTRIBUTING_FACTOR_VEHICLE_1  from crash_stage

create table vehicle_type
( vehicle_type varchar(50))

insert into vehicle_type select distinct vehicle_type from vehicle_stage

create table travel_direction
( travel_direction varchar(50))

insert into travel_direction select distinct TRAVEL_DIRECTION from vehicle_stage

create table pre_crash
( pre_crash varchar(50))
insert into pre_crash select distinct PRE_CRASH from vehicle_stage

create table damage_loc
( loc varchar(50))
insert into damage_loc select distinct POINT_OF_IMPACT from vehicle_stage

create table compliant
(compliant varchar(50))
insert into compliant select distinct COMPLAINT from person_stage

create table SE
(SE varchar(50))
insert into SE select distinct SAFETY_EQUIPMENT from person_stage

create table ES
(ES varchar(50))
insert into ES select distinct EMOTIONAL_STATUS from person_stage

create table facility_type
(	ft varchar(50))
insert into facility_type select distinct Facility_Type from hospital_stage


-- Temp tables


create table crash_temp
(	CRASH_DATE varchar(50),
	CRASH_TIME	varchar(50),	
	BOROUGH	varchar(50),
	ZIP_CODE	varchar(50),
	LATITUDE	varchar(50),
	LONGITUDE	varchar(50),
	LOCATION	varchar(50),
	ON_STREET_NAME	varchar(50),
	CROSS_STREET_NAME	varchar(50),
	OFF_STREET_NAME	varchar(50),
	NUMBER_OF_PERSONS_INJURED	varchar(50),
	NUMBER_OF_PERSONS_KILLED	varchar(50),
	NUMBER_OF_PEDESTRIANS_INJURED	varchar(50),
	NUMBER_OF_PEDESTRIANS_KILLED	varchar(50),
	NUMBER_OF_CYCLIST_INJURED	varchar(50),
	NUMBER_OF_CYCLIST_KILLED	varchar(50),
	NUMBER_OF_MOTORIST_INJURED	varchar(50),
	NUMBER_OF_MOTORIST_KILLED	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_1	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_2	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_3	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_4	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_5	varchar(50),
	COLLISION_ID	varchar(50),
	VEHICLE_TYPE_CODE_1	varchar(50),
	VEHICLE_TYPE_CODE_2	varchar(50),
	VEHICLE_TYPE_CODE_3	varchar(50),
	VEHICLE_TYPE_CODE_4	varchar(50),
	VEHICLE_TYPE_CODE_5 varchar(50)
)


create table hospital_temp
(	Hospital_ID int,
	Facility_Type varchar(50),	
	Borough	varchar(50),
	Facility_Name	varchar(50),
	Cross_Streets	varchar(50),
	Phone	varchar(50),
	Location_1	varchar(50)
)

create table vehicle_temp
(	UNIQUE_ID varchar(50),
	COLLISION_ID varchar(50),
	CRASH_DATE varchar(50),
	CRASH_TIME varchar(50),
	VEHICLE_ID varchar(50),
	STATE_REGISTRATION varchar(50),
	VEHICLE_TYPE varchar(50),
	VEHICLE_MAKE varchar(50),
	VEHICLE_MODEL varchar(50),
	VEHICLE_YEAR varchar(50),
	TRAVEL_DIRECTION varchar(50),
	VEHICLE_OCCUPANTS varchar(50),
	DRIVER_SEX varchar(50),
	DRIVER_LICENSE_STATUS varchar(50),
	DRIVER_LICENSE_JURISDICTION varchar(50),
	PRE_CRASH varchar(50),
	POINT_OF_IMPACT varchar(50),
	VEHICLE_DAMAGE varchar(50),
	VEHICLE_DAMAGE_1 varchar(50),
	VEHICLE_DAMAGE_2 varchar(50),
	VEHICLE_DAMAGE_3 varchar(50),
	PUBLIC_PROPERTY_DAMAGE varchar(50),
	PUBLIC_PROPERTY_DAMAGE_TYPE varchar(50),
	CONTRIBUTING_FACTOR_1 varchar(50),
	CONTRIBUTING_FACTOR_2 varchar(50)	
)

create table person_temp
(	UNIQUE_ID varchar(50),
	COLLISION_ID varchar(50),
	CRASH_DATE varchar(50),
	CRASH_TIME varchar(50),
	PERSON_ID varchar(50),
	PERSON_TYPE varchar(50),
	PERSON_INJURY varchar(50),
	VEHICLE_ID varchar(50),
	PERSON_AGE varchar(50),
	EJECTION varchar(50),
	EMOTIONAL_STATUS varchar(50),
	BODILY_INJURY varchar(50),
	POSITION_IN_VEHICLE varchar(50),
	SAFETY_EQUIPMENT varchar(50),
	PED_LOCATION varchar(50),
	PED_ACTION varchar(50),
	COMPLAINT varchar(50),
	PED_ROLE varchar(50),
	CONTRIBUTING_FACTOR_1 varchar(50),
	CONTRIBUTING_FACTOR_2 varchar(50),
	PERSON_SEX varchar(50)
)

create table weather_temp
(	STATION varchar(50),
	NAME varchar(50),
	LATITUDE varchar(50),
	LONGITUDE varchar(50),
	ELEVATION varchar(50),
	DATE varchar(50),
	AWND varchar(50),
	AWND_ATTRIBUTES varchar(50),
	DAPR varchar(50),
	DAPR_ATTRIBUTES varchar(50),
	DASF varchar(50),
	DASF_ATTRIBUTES varchar(50),
	MDPR varchar(50),
	MDPR_ATTRIBUTES varchar(50),
	MDSF varchar(50),
	MDSF_ATTRIBUTES varchar(50),
	PGTM varchar(50),
	PGTM_ATTRIBUTES varchar(50),
	PRCP varchar(50),
	PRCP_ATTRIBUTES varchar(50),
	PSUN varchar(50),
	PSUN_ATTRIBUTES varchar(50),
	SNOW varchar(50),
	SNOW_ATTRIBUTES varchar(50),
	SNWD varchar(50),
	SNWD_ATTRIBUTES varchar(50),
	TAVG varchar(50),
	TAVG_ATTRIBUTES varchar(50),
	TMAX varchar(50),
	TMAX_ATTRIBUTES varchar(50),
	TMIN varchar(50),
	TMIN_ATTRIBUTES varchar(50),
	TOBS varchar(50),
	TOBS_ATTRIBUTES varchar(50),
	TSUN varchar(50),
	TSUN_ATTRIBUTES varchar(50),
	WDF2 varchar(50),
	WDF2_ATTRIBUTES varchar(50),
	WDF5 varchar(50),
	WDF5_ATTRIBUTES varchar(50),
	WESD varchar(50),
	WESD_ATTRIBUTES varchar(50),
	WESF varchar(50),
	WESF_ATTRIBUTES varchar(50),
	WSF2 varchar(50),
	WSF2_ATTRIBUTES varchar(50),
	WSF5 varchar(50),
	WSF5_ATTRIBUTES varchar(50),
	WT01 varchar(50),
	WT01_ATTRIBUTES varchar(50),
	WT02 varchar(50),
	WT02_ATTRIBUTES varchar(50),
	WT03 varchar(50),
	WT03_ATTRIBUTES varchar(50),
	WT04 varchar(50),
	WT04_ATTRIBUTES varchar(50),
	WT05 varchar(50),
	WT05_ATTRIBUTES varchar(50),
	WT06 varchar(50),
	WT06_ATTRIBUTES varchar(50),
	WT08 varchar(50),
	WT08_ATTRIBUTES varchar(50),
	WT09 varchar(50),
	WT09_ATTRIBUTES varchar(50),
	WT11 varchar(50),
	WT11_ATTRIBUTES varchar(50)
)

-- Error_log tables


create table crash_error_log
(	CRASH_DATE varchar(50),
	CRASH_TIME	varchar(50),	
	BOROUGH	varchar(50),
	ZIP_CODE	varchar(50),
	LATITUDE	varchar(50),
	LONGITUDE	varchar(50),
	LOCATION	varchar(50),
	ON_STREET_NAME	varchar(50),
	CROSS_STREET_NAME	varchar(50),
	OFF_STREET_NAME	varchar(50),
	NUMBER_OF_PERSONS_INJURED	varchar(50),
	NUMBER_OF_PERSONS_KILLED	varchar(50),
	NUMBER_OF_PEDESTRIANS_INJURED	varchar(50),
	NUMBER_OF_PEDESTRIANS_KILLED	varchar(50),
	NUMBER_OF_CYCLIST_INJURED	varchar(50),
	NUMBER_OF_CYCLIST_KILLED	varchar(50),
	NUMBER_OF_MOTORIST_INJURED	varchar(50),
	NUMBER_OF_MOTORIST_KILLED	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_1	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_2	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_3	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_4	varchar(50),
	CONTRIBUTING_FACTOR_VEHICLE_5	varchar(50),
	COLLISION_ID	varchar(50),
	VEHICLE_TYPE_CODE_1	varchar(50),
	VEHICLE_TYPE_CODE_2	varchar(50),
	VEHICLE_TYPE_CODE_3	varchar(50),
	VEHICLE_TYPE_CODE_4	varchar(50),
	VEHICLE_TYPE_CODE_5 varchar(50),
	Error_type varchar(50),
	load_date date
)

create table hospital_error_log
(	hostpital_ID int,
	Facility_Type varchar(50),	
	Borough	varchar(50),
	Facility_Name	varchar(50),
	Cross_Streets	varchar(50),
	Phone	varchar(50),
	Location_1	varchar(50),
	Error_type varchar(50),
	load_date date
)

create table vehicle_error_log
(	UNIQUE_ID varchar(50),
	COLLISION_ID varchar(50),
	CRASH_DATE varchar(50),
	CRASH_TIME varchar(50),
	VEHICLE_ID varchar(50),
	STATE_REGISTRATION varchar(50),
	VEHICLE_TYPE varchar(50),
	VEHICLE_MAKE varchar(50),
	VEHICLE_MODEL varchar(50),
	VEHICLE_YEAR varchar(50),
	TRAVEL_DIRECTION varchar(50),
	VEHICLE_OCCUPANTS varchar(50),
	DRIVER_SEX varchar(50),
	DRIVER_LICENSE_STATUS varchar(50),
	DRIVER_LICENSE_JURISDICTION varchar(50),
	PRE_CRASH varchar(50),
	POINT_OF_IMPACT varchar(50),
	VEHICLE_DAMAGE varchar(50),
	VEHICLE_DAMAGE_1 varchar(50),
	VEHICLE_DAMAGE_2 varchar(50),
	VEHICLE_DAMAGE_3 varchar(50),
	PUBLIC_PROPERTY_DAMAGE varchar(50),
	PUBLIC_PROPERTY_DAMAGE_TYPE varchar(50),
	CONTRIBUTING_FACTOR_1 varchar(50),
	CONTRIBUTING_FACTOR_2 varchar(50),
	Error_type varchar(50),
	load_date date
)

create table person_error_log
(	UNIQUE_ID varchar(50),
	COLLISION_ID varchar(50),
	CRASH_DATE varchar(50),
	CRASH_TIME varchar(50),
	PERSON_ID varchar(50),
	PERSON_TYPE varchar(50),
	PERSON_INJURY varchar(50),
	VEHICLE_ID varchar(50),
	PERSON_AGE varchar(50),
	EJECTION varchar(50),
	EMOTIONAL_STATUS varchar(50),
	BODILY_INJURY varchar(50),
	POSITION_IN_VEHICLE varchar(50),
	SAFETY_EQUIPMENT varchar(50),
	PED_LOCATION varchar(50),
	PED_ACTION varchar(50),
	COMPLAINT varchar(50),
	PED_ROLE varchar(50),
	CONTRIBUTING_FACTOR_1 varchar(50),
	CONTRIBUTING_FACTOR_2 varchar(50),
	PERSON_SEX varchar(50),
	Error_type varchar(50),
	load_date date
)

create table weather_error_log
(	STATION varchar(50),
	NAME varchar(50),
	LATITUDE varchar(50),
	LONGITUDE varchar(50),
	ELEVATION varchar(50),
	DATE varchar(50),
	AWND varchar(50),
	AWND_ATTRIBUTES varchar(50),
	DAPR varchar(50),
	DAPR_ATTRIBUTES varchar(50),
	DASF varchar(50),
	DASF_ATTRIBUTES varchar(50),
	MDPR varchar(50),
	MDPR_ATTRIBUTES varchar(50),
	MDSF varchar(50),
	MDSF_ATTRIBUTES varchar(50),
	PGTM varchar(50),
	PGTM_ATTRIBUTES varchar(50),
	PRCP varchar(50),
	PRCP_ATTRIBUTES varchar(50),
	PSUN varchar(50),
	PSUN_ATTRIBUTES varchar(50),
	SNOW varchar(50),
	SNOW_ATTRIBUTES varchar(50),
	SNWD varchar(50),
	SNWD_ATTRIBUTES varchar(50),
	TAVG varchar(50),
	TAVG_ATTRIBUTES varchar(50),
	TMAX varchar(50),
	TMAX_ATTRIBUTES varchar(50),
	TMIN varchar(50),
	TMIN_ATTRIBUTES varchar(50),
	TOBS varchar(50),
	TOBS_ATTRIBUTES varchar(50),
	TSUN varchar(50),
	TSUN_ATTRIBUTES varchar(50),
	WDF2 varchar(50),
	WDF2_ATTRIBUTES varchar(50),
	WDF5 varchar(50),
	WDF5_ATTRIBUTES varchar(50),
	WESD varchar(50),
	WESD_ATTRIBUTES varchar(50),
	WESF varchar(50),
	WESF_ATTRIBUTES varchar(50),
	WSF2 varchar(50),
	WSF2_ATTRIBUTES varchar(50),
	WSF5 varchar(50),
	WSF5_ATTRIBUTES varchar(50),
	WT01 varchar(50),
	WT01_ATTRIBUTES varchar(50),
	WT02 varchar(50),
	WT02_ATTRIBUTES varchar(50),
	WT03 varchar(50),
	WT03_ATTRIBUTES varchar(50),
	WT04 varchar(50),
	WT04_ATTRIBUTES varchar(50),
	WT05 varchar(50),
	WT05_ATTRIBUTES varchar(50),
	WT06 varchar(50),
	WT06_ATTRIBUTES varchar(50),
	WT08 varchar(50),
	WT08_ATTRIBUTES varchar(50),
	WT09 varchar(50),
	WT09_ATTRIBUTES varchar(50),
	WT11 varchar(50),
	WT11_ATTRIBUTES varchar(50),
	Error_type varchar(50),
	load_date date
)




--DIM TABLES

CREATE TABLE DIM_WIND
(
WindID int identity PRIMARY KEY,
WDF2 varchar(50),
WDF5 varchar(50),
WSF2 varchar(50),
WSF5 varchar(50),
PGTM varchar(50)
)

CREATE TABLE DIM_AIRTEMP
(
AirTempID int identity PRIMARY KEY,
TAVG  Varchar(50),
TMAX Varchar(50),
TMIN Varchar(50),
TOBS Varchar(50)
)


CREATE TABLE DIM_LOCATION
(
LocationID int identity PRIMARY KEY,
Street varchar(50),
Borough varchar(50),
Zipcode  varchar(50),
Latitude  varchar(50),
Longitude varchar(50),
OnStreet varchar(50),
OffStreet varchar(50),
CrossStreet varchar(50)
)


CREATE TABLE DIM_PRECIPITATION
(
PrecipitationID  int identity PRIMARY KEY,
MDPR varchar(50),
DAPR  varchar(50),
PRCP  varchar(50),
SNWD  varchar(50),
SNOW varchar(50)
)

CREATE TABLE DIM_WATER
(
WaterID int identity PRIMARY KEY,
WESD varchar(50),
WESF varchar(50)
)

CREATE TABLE DIM_PERSONLOCATION
(
ID int identity PRIMARY KEY,
SafetyEquipment varchar(50),
PositionInVehicle varchar(50),
Ejection varchar(50)
)


CREATE TABLE DIM_DATETIME
(
TimestampID int identity PRIMARY KEY,
crash_Date varchar(50),
crash_Time varchar(50)
)

CREATE TABLE DIM_CONTRIBUTINGFACTORS
(
CFID  int identity PRIMARY KEY,
CF1 varchar(50),
CF2 varchar(50),
CF3 varchar(50),
CF4 varchar(50),
CF5 varchar(50)
)


CREATE TABLE DIM_CRASHCASUALTIES
(
CasualtyID  int identity PRIMARY KEY,
PersonInjured varchar(50),
PersonKilled varchar(50),
PedestrainInjured varchar(50),
PedestrainKilled varchar(50),
CyclistInjured varchar(50),
CyclistKilled varchar(50),
MotoristInjured varchar(50),
MotoristKilled varchar(50)
)

CREATE TABLE DIM_VEHICLEINFO
(
VehicleInfoID int identity PRIMARY KEY,
VehicleType varchar(50),
VehicleMake varchar(50),
VehicleModel varchar(50),
VehicleYear  varchar(50)
)

CREATE TABLE DIM_LICENSEINFO
(
LicenseID int identity PRIMARY KEY,
RegistrationStage varchar(50),
DLStatus varchar(50),
DLJurisdiction varchar(50)
)

CREATE TABLE DIM_PASSENGERTRAVELINFO
(
ID1 int identity PRIMARY KEY,
TravelDirection varchar(50),
VehicleOccupants varchar(50),
PreCrash varchar(50)
)

CREATE TABLE DIM_DAMAGES
(
DamageID1 int identity PRIMARY KEY,
PointOfImpact varchar(50),
VehicleMainDamage varchar(50),
VehicleDamage1 varchar(50),
VehicleDamage2 varchar(50),
VehicleDamage3 varchar(50),
PublicPropertyDamage varchar(50),
PublicPropertyDamageType varchar(50),
)

CREATE TABLE DIM_PERSONDAMAGES
(
DamageID int identity PRIMARY KEY,
PersonInjury varchar(50),
EmotionalStatus varchar(50),
BodilyStatus varchar(50),
Compliant varchar(50)
)

CREATE TABLE DIM_PEDESTRIANINFO
(
PedID int identity PRIMARY KEY,
PedLocation varchar(50),
PedAction varchar(50),
PedRole varchar(50)
)

CREATE TABLE DIM_PERSONINFO
(
PersonID varchar(50) PRIMARY KEY,
PersonType varchar(50),
PersonaAge varchar(50),
PersonSex varchar(50)
)

create table DIM_weather_type
(	
weathertypeID int identity primary key,
WT01 varchar(50),
WT02 varchar(50),
WT03 varchar(50),
WT04 varchar(50),
WT05 varchar(50),
WT06 varchar(50),
WT07 varchar(50),
WT08 varchar(50),
WT09 varchar(50),
WT11 varchar(50))


--FACT TABLES

CREATE TABLE FACT_WEATHER
(
Station varchar(50),
[Date] date,
WindID int FOREIGN KEY REFERENCES DIM_WIND(WindID),
WaterID int FOREIGN KEY REFERENCES DIM_WATER(WaterID),
LocationID int FOREIGN KEY REFERENCES DIM_Location(LocationID),
AirTempID int FOREIGN KEY REFERENCES DIM_AIRTEMP(AirTempID),
PrecipitationID int FOREIGN KEY REFERENCES DIM_PRECIPITATION(PrecipitationID),
weathertypeID int FOREIGN KEY REFERENCES DIM_weather_type(weathertypeID),

primary key(Station, [Date])
 )

CREATE TABLE FACT_HOSPITAL(
hospitalID int primary key,
LocationID int FOREIGN KEY REFERENCES DIM_LOCATION(LocationID),
FacilityName varchar(50),
FacilityType varchar(50),
Phone varchar(50)
)

CREATE TABLE FACT_CRASH
(
CollisionID varchar(50) PRIMARY KEY,
TimestampID int FOREIGN KEY REFERENCES DIM_DATETIME(TimestampID),
LocationID int FOREIGN KEY REFERENCES DIM_LOCATION(LocationID),
CasualtyID int FOREIGN KEY REFERENCES DIM_CRASHCASUALTIES(CasualtyID),
CFID int FOREIGN KEY REFERENCES DIM_CONTRIBUTINGFACTORS(CFID),
VehicleInfoID int FOREIGN KEY REFERENCES DIM_VEHICLEINFO(VehicleInfoID)
)

CREATE TABLE FACT_VEHICLE
(
UniqueID1 varchar(50) primary key,
VehicleID varchar(50),
CFID  int  FOREIGN KEY REFERENCES DIM_CONTRIBUTINGFACTORS(CFID),
VehicleinfoID  int FOREIGN KEY REFERENCES DIM_VEHICLEINFO(VehicleInfoID),
ID1  int FOREIGN KEY REFERENCES DIM_PASSENGERTRAVELINFO(ID1),
DamageID1  int FOREIGN KEY REFERENCES DIM_Damages(DamageID1),
CollisionID  varchar(50) FOREIGN KEY REFERENCES FACT_CRASH(CollisionID),
TimestampID  int FOREIGN KEY REFERENCES DIM_DATETIME(TimestampID),
LicenseID int FOREIGN KEY REFERENCES DIM_LICENSEINFO(LicenseID),
)

CREATE TABLE FACT_PERSON
(
UniqueID varchar(50) primary key,
PersonID varchar(50) FOREIGN KEY REFERENCES DIM_PERSONINFO(PersonID),
ID int FOREIGN KEY REFERENCES DIM_PERSONLOCATION(ID),
DamageID int FOREIGN KEY REFERENCES DIM_PERSONDAMAGES(DamageID),
PedID int FOREIGN KEY REFERENCES DIM_PEDESTRIANINFO(PedID),
CFID int FOREIGN KEY REFERENCES DIM_CONTRIBUTINGFACTORS(CFID),
TimestampID int FOREIGN KEY REFERENCES DIM_DATETIME(TimestampID),
VehicleID  varchar(50)
)









--DROP TABLE DIM_WIND
--DROP TABLE DIM_AIRTEMP
--DROP TABLE DIM_LOCATION
--DROP TABLE DIM_PRECIPITATION
--DROP TABLE DIM_WATER
--DROP TABLE DIM_PERSONLOCATION
--DROP TABLE DIM_DATETIME
--DROP TABLE DIM_CONTRIBUTINGFACTORS
--DROP TABLE DIM_CRASHCASUALTIES
--DROP TABLE DIM_VEHICLEINFO
--DROP TABLE DIM_LICENSEINFO
--DROP TABLE DIM_PASSENGERTRAVELINFO
--DROP TABLE DIM_DAMAGES
--DROP TABLE DIM_PERSONDAMAGES
--DROP TABLE DIM_PEDESTRIANINFO
--DROP TABLE DIM_PERSONINFO

--DROP TABLE FACT_WEATHER
--DROP TABLE FACT_HOSPITAL
--DROP TABLE FACT_VEHICLE
--DROP TABLE FACT_CRASH
--DROP TABLE FACT_PERSON
