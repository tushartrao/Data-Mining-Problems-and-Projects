--Creating  Kiln 
CREATE TABLE Kiln 
( KilnID char(3) not null, 
	KilnName varchar(5), 
	CONSTRAINT Kiln_PK primary key (KilnID) );
--
--Creating Booster House

CREATE TABLE BoosterHouse 
	(KilnID1 char(3) not null, 
	KilnID2 char(3) not null, 
	BoosterHouseID char(3) not null, 
	FilterType varchar(10), 
	CONSTRAINT FilterType_CHK CHECK(FilterType='Nylon' or FilterType='Ferrule'),
	CONSTRAINT BoosterHouse_PK PRIMARY KEY (BoosterHouseID), 
	CONSTRAINT BoosterHouse_FK1 FOREIGN KEY (KilnID1) references Kiln(KilnID),
	CONSTRAINT BoosterHouse_FK2 FOREIGN KEY (KilnID2) REFERENCES Kiln(KilnID));

--Cearting Booster Base
CREATE TABLE Booster_Base 
	( BaseID int not null, 
	BoosterHouseID char(3) not null, 
	CONSTRAINT Base_PK PRIMARY KEY (BaseID), 
	CONSTRAINT Base_FK FOREIGN KEY (BoosterHouseID) 
	references BoosterHouse(BoosterHouseID) );

--Creating Booster
CREATE TABLE Booster
	( BoosterID char(4) not null, 
	[Type] char(2) , 
	PurchaseDate date,
	CONSTRAINT Type_CHK CHECK([Type]='SV' or [Type]='IV'),
	CONSTRAINT Booster_PK PRIMARY KEY (BoosterID) );

--Creating  KilnTimeline

CREATE TABLE KilnTimeline
	(KilnTimelineID int not null PRIMARY KEY IDENTITY (1,1) ,	
	KilnID char(3) not null, 
	Base char(3)not null, 
	BoosterRemoved char(4), 
	BoosterInstalled char(4), 
	[Date] date not null, 
	Remark varchar(100), 
	CONSTRAINT KilnTimeline_FK1 FOREIGN KEY (KilnID) references Kiln(KilnID),
	TimelineNumber AS 'KT' + RIGHT('000'+cast(KilnTimelineID as varchar(7)),7));

--Creating Observation Lookup table
CREATE TABLE [dbo].[Observation LU](
	[ObservationIndex] [numeric](5, 0) PRIMARY KEY ,
	[Description] [varchar](50) NULL)

-- Creating Observations
CREATE TABLE Observations
( ObservationIndex int not null,
  KilnTimelineID int not null ,
  Remarks varchar(50),
  CONSTRAINT Observations_FK FOREIGN KEY (KilnTimelineID) REFERENCES KilnTimeline(KilnTimelineID),
  CONSTRAINT Observations_PK PRIMARY KEY ( ObservationIndex, KilnTimelineID));

--Creating Repair

CREATE TABLE Repair
(RepairID int not null IDENTITY(1,1),
KilnTimelineID int not null ,
InDate date not null,
OutDate date,
Remark varchar(50),
CONSTRAINT Repair_FK FOREIGN KEY (KilnTimelineID) REFERENCES KilnTimeline(KilnTimelineID),
CONSTRAINT Repair_PK PRIMARY KEY (RepairID));

--Creating  faults lookup

CREATE TABLE [Faults LU]
(FaultID int not null PRIMARY KEY,
Fault varchar(50));

--Creating Faults inspection
CREATE TABLE [Faults inspection] 
	(RepairID int not null, 
	OccurDate date, 
	FaultID int not null, 
	Remark varchar(100), 
	CONSTRAINT [Faults inspection_FK] FOREIGN KEY (RepairID) REFERENCES [Repair](RepairID), 
	CONSTRAINT [Faults inspection_PK] PRIMARY KEY (RepairID, FaultID) );

--Creating triggers and jobs table( including dummy tables for trigger catching)

CREATE TABLE OutDateCatch
( RepairID int not null,
JobIndex int not null,
JobDone varchar(50) not null,
[Date]date NOT NULL,
[Hours] int not null,
Remark varchar(50))

CREATE TABLE Jobs
( RepairID int not null,
JobIndex int not null,
JobDone varchar(50) not null,
[Date]date NOT NULL,
[Hours] int not null,
Remark varchar(50),
CONSTRAINT Jobs_FK FOREIGN KEY (RepairID) REFERENCES Repair(RepairID),
CONSTRAINT Jobs_PK PRIMARY KEY (JobIndex, RepairID));

CREATE TRIGGER dbo.OutDateCatchtrg ON Jobs
AFTER INSERT 
AS BEGIN
INSERT INTO OutDateCatch
(RepairID,JobIndex,JobDone,[Date],[Hours],Remark)
SELECT  RepairID, JobIndex,JobDone,[Date],[Hours],Remark FROM Jobs
WHERE JobDone='Complete'
END

CREATE TABLE DUMMY 
(KilnTimelineID int not null,
RepairID int not null,
InDate date,
OutDate date)

CREATE TRIGGER OutDateTrg on OutDateCatch
AFTER INSERT 
AS BEGIN 
INSERT INTO DUMMY (KilnTimelineID, RepairID, InDate, OutDate)
SELECT r.KilnTimelineID ,r.RepairID,r.InDate,o.[Date] AS OutDate 
	 FROM Repair r 
	RIGHT JOIN OutDateCatch o 
	ON r.RepairID=o.RepairID 
	GROUP BY r.KilnTimelineID,r.RepairID, r.InDate,o.[Date]

UPDATE        Repair
SET           Repair.OutDate = DUMMY.OutDate
FROM          Repair
lefT  JOIN    DUMMY
ON            Repair.RepairID = DUMMY.RepairID
END 
------------------------------------------------------------------------------------------------------------------------
-- PROCEDURES-----------------------------------------------------------------------------------------------------------

--Creating and executing procedure to pull up records to check repairing history of a booster 

CREATE PROCEDURE BoosterRecord @BoosterID char(4)
 as
 BEGIN
 SET NOCOUNT ON
 SELECT kt.BoosterRemoved as BoosterID, b.[Type], r.RepairID, r.OutDate as [Repair Completed On], k.KilnName, ol.[Description]
 FROM KilnTimeline kt 
 JOIN Observations o
 ON kt.KilnTimelineID=o.KilnTimelineID
 JOIN [Observation LU] ol
 ON o.ObservationIndex=ol.ObservationIndex
 JOIN Kiln k
 ON kt.KilnID=k.KilnID
 JOIN Booster b
 ON kt.BoosterRemoved = b.BoosterID
 JOIN Repair r
 ON kt.KilnTimelineID = r.KilnTimelineID
  WHERE kt.BoosterRemoved=@BoosterID
END;

--EXEC BoosterRecord @BoosterID='1020'
------------------------------------------------------------------------------------------------------------------------
--Creating and executing procedure to pull up observation timeline for a particular kiln
CREATE PROCEDURE KilnRecord @KilnID char(3)
 as
 BEGIN
 SET NOCOUNT ON
 SELECT kt.TimelineNumber, kt.KilnID, k.KilnName, kt.BoosterRemoved, b.[Type], o.ObservationIndex, ol.[Description]
 FROM KilnTimeline kt JOIN Observations o
 ON kt.KilnTimelineID=o.KilnTimelineID
    JOIN [Observation LU] ol
 ON o.ObservationIndex=OL.ObservationIndex
 JOIN Booster b
 ON kt.BoosterRemoved = b.BoosterID
 JOIN Kiln k
 ON kt.KilnID=k.KilnID
  WHERE kt.KilnID = @KilnID
 
END;

--DROP PROCEDURE  KilnRecord

--EXEC KilnRecord @KilnID='KL2'
--------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE check repairing
CREATE PROCEDURE Repairing @Checkdate date
as
BEGIN
SELECT kt.BoosterRemoved as BoosterID, kt.Base, b.[Type] as BoosterType, r.InDate, ol.[Description]
FROM Repair r
JOIN KilnTimeline kt
ON kt.KilnTimelineID=r.KilnTimelineID
JOIN Observations o
ON o.KilnTimelineID=r.KilnTimelineID
JOIN [Observation LU] ol
ON ol.ObservationIndex=o.ObservationIndex
JOIN Booster b
ON kt.BoosterRemoved = b.BoosterID
where (Indate<=@Checkdate and Outdate IS NULL) or (Indate<=@Checkdate and Outdate>=@checkdate)
END

--EXEC Repairing @Checkdate='2019-05-20'

--------------------------------------------------------------------------------------------------------------------------
--VIEWS-------------------------------------------------------------------------------------------------------------------


--Creating View for pulling up All booster repair records
CREATE VIEW RepairShopSummary AS
SELECT KilnTimeline.BoosterRemoved,Repair.RepairID,Repair.InDate,Repair.OutDate ,DATEDIFF(day, Repair.InDate,Repair.OutDate) AS [Repair(days)] FROM
KilnTimeline Right outer JOIN Repair ON KilnTimeline.KilnTimelineID=Repair.KilnTimelineID

--DROP VIEW RepairShopSummary
--SELECT * FROM RepairShopSummary

--------------------------------------------------------------------------------------------------------------------------
-- Creating View for summary of the entire plant

CREATE VIEW Summary AS
SELECT KilnTimeline.KilnID,KilnTimeline.Base,
	KilnTimeline.BoosterRemoved,KilnTimeline.BoosterInstalled,
	KilnTimeline.KilnTimelineID,[Observation LU].[Description],
	Repair.RepairID,Repair.InDate,Repair.OutDate,Repair.Remark,
	DATEDIFF(day,Repair.InDate,Repair.OutDate) AS [Repair(days)]
	FROM KilnTimeline 
	JOIN Observations ON KilnTimeline.KilnTimelineID = Observations.KilnTimelineID
	JOIN [Observation LU] ON Observations.ObservationIndex = [Observation LU].ObservationIndex
	JOIN Repair ON Repair.KilnTimelineID= KilnTimeline.KilnTimelineID

--SELECT * FROM Summary
-------------------------------------------------------------------------------------------------------------------------
--NEEDED NON CLUSTERED INDICES-----------------------------------------------------------------------------------------

CREATE INDEX JObsIndex ON
Jobs (RepairID, [Date])

ALTER TABLE [Faults inspection]
DROP CONSTRAINT [FaultsInspection_PK}
ALTER TABLE [Faults inspection]
ADD CONSTRAINT FaultsInspection_PK PRIMARY KEY (RepairID,FaultID)

CREATE INDEX FaulsInsepctionIndex ON
[Faults Inspection] (OccurDate,RepairID)

ALTER TABLE [Faults LU]
ADD CONSTRAINT [FaultsLU_PK] PRIMARY KEY (FaultID) ;

CREATE INDEX FaultsLookupIndex ON
[Faults LU] (Fault)
--------------------------------------------------------------------------------------------------------------------------
------------------------------------------------- X 0 X 0 X 0 X 0 --------------------------------------------------------
