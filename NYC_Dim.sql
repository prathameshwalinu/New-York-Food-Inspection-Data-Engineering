CREATE TABLE `Dim_Date`  (
  `DateSK` int NOT NULL,
  `FullDateAK` date NOT NULL,
  `DayNumberOfWeek` int NOT NULL,
  `DayNameOfWeek` varchar(10) NOT NULL,
  `DayNumberOfMonth` int NOT NULL,
  `DayNumberOfYear` int NOT NULL,
  `WeekNumberOfYear` int NOT NULL,
  `MonthName` varchar(10) NOT NULL,
  `MonthNumberOfYear` int NOT NULL,
  `CalendarQuarter` int NOT NULL,
  `CalendarYear` smallint NOT NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL,
  PRIMARY KEY (`DateSK`)
);

CREATE TABLE `Dim_Actions`  (
  `ActionSK` varchar(255) NOT NULL,
  `Action` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL
);

CREATE TABLE `Dim_Business`  (
  `BusinessSK` integer NOT NULL,
  `CAMIS` varchar(255) NULL,
  `DBA` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL
);

CREATE TABLE `Dim_Grade`  (
  `GradeSK` integer NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL
);

CREATE TABLE `Dim_Inspection_Type`  (
  `InspectionTypeSK` varchar(255) NOT NULL,
  `InspectionType` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL
);

CREATE TABLE `Dim_Location`  (
  `LocationSK` varchar(255) NOT NULL,
  `BORO_SK(FK)` varchar(255) NULL,
  `Street` varchar(255) NULL,
  `ZipCode` varchar(255) NULL,
  `Building` varchar(255) NULL,
  `Latitude` varchar(255) NULL,
  `Longitute` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL
);

CREATE TABLE `Dim_Violation`  (
  `ViolationSK` varchar(255) NOT NULL,
  `ViolationCode` varchar(255) NULL,
  `ViolationDescrition` varchar(255) NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL
);

CREATE TABLE `Fact_Inspection_Results`  (
  `InspectionResultsSK` integer NOT NULL,
  `InspectionTypeSK(FK)` integer NULL,
  `Score` integer NULL,
  `GradeDateSK(FK)` datetime NULL,
  `RecordDateSK(FK)` datetime NULL,
  `InspectionTypeSK(FK)` integer NULL,
  `ActionSK(FK)` integer NULL,
  `BusinessSK(FK)` integer NULL,
  `GradeSK(FK)` integer NULL,
  `LocationSK(FK)` integer NULL,
  `VoilationsSK(FK)` integer NULL,
  `DI_CreateDate` datetime NULL,
  `DI_WorkFlowFileName` varchar(255) NULL,
  `DateSK(FK)` datetime NULL,
  `InspectionDateSK(FK)` datetime NULL
);

ALTER TABLE `Dim_Date` ADD CONSTRAINT `D` FOREIGN KEY () REFERENCES ();
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `InspectionTypeSK(FK)` FOREIGN KEY (`InspectionTypeSK(FK)`) REFERENCES `Dim_Inspection_Type` (`InspectionTypeSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `ActionSK(FK)` FOREIGN KEY () REFERENCES `Dim_Actions` (`ActionSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `BusinessSK(FK)` FOREIGN KEY () REFERENCES `Dim_Business` (`BusinessSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `GradeSK(FK)` FOREIGN KEY () REFERENCES `Dim_Grade` (`GradeSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `LocationSK(FK)` FOREIGN KEY () REFERENCES `Dim_Location` (`LocationSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `ViolationSK(FK)` FOREIGN KEY () REFERENCES `Dim_Violation` (`ViolationSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `RecordDateSK(FK)` FOREIGN KEY () REFERENCES `Dim_Date` (`DateSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `GradeDateSK(FK)` FOREIGN KEY () REFERENCES `Dim_Date` (`DateSK`);
ALTER TABLE `Fact_Inspection_Results` ADD CONSTRAINT `InspectionDateSK(FK)` FOREIGN KEY () REFERENCES `Dim_Date` (`DateSK`);

