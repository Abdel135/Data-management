/**
True data types
**/


DROP TABLE US_HEART_MORTALITY;    
CREATE TABLE US_HEART_MORTALITY (
year_ INT, 
LocationAbbr VARCHAR2(4), 
LocationDesc VARCHAR2(78), 
GeographicLevel VARCHAR2(12), 
DataSource VARCHAR2(8), 
Class_ VARCHAR2(46), 
Topic VARCHAR2(46), 
Data_Value NUMBER, 
Data_Value_Unit VARCHAR2(44), 
Data_Value_Type VARCHAR2(106), 
Data_Value_Footnote_Symbol VARCHAR2(2), 
Data_Value_Footnote VARCHAR2(34), 
StratificationCategory1 VARCHAR2(12), 
Stratification1 VARCHAR2(14), 
StratificationCategory2 VARCHAR2(28), 
Stratification2 VARCHAR2(68), 
TopicID VARCHAR2(4), 
LocationID INT, 
Location_1 VARCHAR2(50)
);



DROP TABLE RISK_FACTORS_AND_HEALTH_INDICATORS;    
CREATE TABLE RISK_FACTORS_AND_HEALTH_INDICATORS (
id INTEGER, 
Surveillance_Year NUMBER, 
State_Abbreviation VARCHAR2(4), 
State VARCHAR2(12), 
Health_Indicator_or_Class VARCHAR2(50), 
Risk_Factor_or_Topic_Description VARCHAR2(44), 
Surveillance_Question VARCHAR2(312), 
Surveillance_Response VARCHAR2(90), 
Variables_or_Breakout VARCHAR2(110), 
Population_Characteristic_or_Breakout_Category VARCHAR2(36), 
Sample_Size NUMBER, 
Data_Value_Percentage NUMBER, 
Low_Confidence_Limit NUMBER, 
High_Confidence_Limit NUMBER, 
Display_Order NUMBER, 
Data_Value_Footnote VARCHAR2(398), 
Class_Id VARCHAR2(14), 
Topic_Id VARCHAR2(14), 
Location_ID NUMBER, 
Breakout_ID VARCHAR2(14), 
Breakout_Category_ID VARCHAR2(8), 
Question_ID VARCHAR2(16), 
Response_ID VARCHAR2(14), 
Latitude NUMBER, 
Longitude NUMBER
);

