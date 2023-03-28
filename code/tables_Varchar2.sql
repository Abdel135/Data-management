--------------------------------------------------------
-- tables with only varchar2 data type to insert raw data from a csv  file
--------------------------------------------------------
DROP TABLE "CHRONIC_DISEASES_RISK_FACTORS";
DROP TABLE "HEART_DISEASE_MORTALITY";
--------------------------------------------------------
--  DDL for Table CHRONIC_DISEASES_RISK_FACTORS
--------------------------------------------------------

  CREATE TABLE "CHRONIC_DISEASES_RISK_FACTORS" 
   (	"ID" VARCHAR2(200), 
	"SURVEILLANCE_YEAR" VARCHAR2(200), 
	"STATE_ABBREVIATION" VARCHAR2(200), 
	"STATE" VARCHAR2(200), 
	"HEALTH_INDICATOR_OR_CLASS" VARCHAR2(200), 
	"RISK_FACTOR_OR_TOPIC_DESCRIPTION" VARCHAR2(200), 
	"SURVEILLANCE_QUESTION" VARCHAR2(300), 
	"SURVEILLANCE_RESPONSE" VARCHAR2(200), 
	"VARIABLES_OR_BREAKOUT" VARCHAR2(200), 
	"POPULATION_CHARACTERISTIC_OR_BREAKOUT_CATEGORY" VARCHAR2(200), 
	"SAMPLE_SIZE" VARCHAR2(200), 
	"DATA_VALUE_PERCENTAGE" VARCHAR2(200), 
	"LOW_CONFIDENCE_LIMIT" VARCHAR2(200), 
	"HIGH_CONFIDENCE_LIMIT" VARCHAR2(200), 
	"DISPLAY_ORDER" VARCHAR2(200), 
	"DATA_VALUE_FOOTNOTE" VARCHAR2(300), 
	"CLASS_ID" VARCHAR2(200), 
	"TOPIC_ID" VARCHAR2(200), 
	"LOCATION_ID" VARCHAR2(200), 
	"BREAKOUT_ID" VARCHAR2(200), 
	"BREAKOUT_CATEGORY_ID" VARCHAR2(200), 
	"QUESTION_ID" VARCHAR2(26), 
	"RESPONSE_ID" VARCHAR2(200), 
	"LATITUDE" VARCHAR2(200), 
	"LONGITUDE" VARCHAR2(200)
   ) ;

   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."ID" IS 'row ID';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."SURVEILLANCE_YEAR" IS 'Year of coveragefor the ChronicDiseases RiskFactors andHealth Indicatorssurveillance';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."STATE_ABBREVIATION" IS 'StateAbbreviation inthe US where thesurveillancereport wasgathered.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."STATE" IS 'State in the USwhere thesurveillancereport wasgathered.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."HEALTH_INDICATOR_OR_CLASS" IS 'Description of thehealth indicatoror class for thechronicconditions.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."RISK_FACTOR_OR_TOPIC_DESCRIPTION" IS 'Description of therisk factor or topicdescription forthe chronicconditions.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."SURVEILLANCE_QUESTION" IS 'Description of thesurveillancequestion used togather dataresponses.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."SURVEILLANCE_RESPONSE" IS 'Description of thesurveillanceresponse to thesurvey question.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."VARIABLES_OR_BREAKOUT" IS 'Description of thevariablesconsidered forthe chronicconditions; alsoreferred to asBreakout.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."POPULATION_CHARACTERISTIC_OR_BREAKOUT_CATEGORY" IS 'Description of thepopulationcharacteristic interms of age,gender, race,education andhouseholdincome; alsoreferred to asBreakoutCategory.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."SAMPLE_SIZE" IS 'Description of thetotal sample sizeor total number ofparticipants in thesurvey.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."DATA_VALUE_PERCENTAGE" IS 'Description of thepercentage ofdata value fromthe sample size';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."LOW_CONFIDENCE_LIMIT" IS 'Description of thelow respectivelevel ofsignificance of the data from the estimate population parameter or ample size';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."HIGH_CONFIDENCE_LIMIT" IS 'Description of the high respective level of significance of the data from the estimate population parameter or sample size.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."DISPLAY_ORDER" IS 'Description of thedisplay order ofthe data.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."DATA_VALUE_FOOTNOTE" IS 'Description ofany notes relatedto the ChronicDiseases RiskFactors andHealth Indicatorsdata.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."LATITUDE" IS 'The description of the mapping interms of latitude of the State where the surveillance report was gathered.';
   COMMENT ON COLUMN "CHRONIC_DISEASES_RISK_FACTORS"."LONGITUDE" IS 'The description of the mapping interms of longitude of the State where the surveillance report was gathered.';
   COMMENT ON TABLE "CHRONIC_DISEASES_RISK_FACTORS"  IS 'The Behavioral Risk Factor Surveillance System (BRFSS) is a collaborative project of the Centers for
Disease Control and Prevention (CDC) and U.S. states and territories. The BRFSS administered
combined landline and cell phone prevalence data is supported by CDCs Behavioral Risk Factor
Surveillance Branch. It is a continuous, state-based surveillance system that collects information about
modifiable risk factors for chronic diseases and other leading causes of death.';
--------------------------------------------------------
--  DDL for Table HEART_DISEASE_MORTALITY
--------------------------------------------------------

  CREATE TABLE "HEART_DISEASE_MORTALITY" 
   (	"YEAR" VARCHAR2(200), 
	"LOCATIONABBR" VARCHAR2(200), 
	"LOCATIONDESC" VARCHAR2(200), 
	"GEOGRAPHICLEVEL" VARCHAR2(200), 
	"DATASOURCE" VARCHAR2(200), 
	"CLASS" VARCHAR2(200), 
	"TOPIC" VARCHAR2(200), 
	"DATA_VALUE" VARCHAR2(200), 
	"DATA_VALUE_UNIT" VARCHAR2(200), 
	"DATA_VALUE_TYPE" VARCHAR2(200), 
	"DATA_VALUE_FOOTNOTE_SYMBOL" VARCHAR2(200), 
	"DATA_VALUE_FOOTNOTE_" VARCHAR2(200), 
	"STRATIFICATIONCATEGORY1" VARCHAR2(200), 
	"STRATIFICATION1" VARCHAR2(200), 
	"STRATIFICATIONCATEGORY2" VARCHAR2(200), 
	"STRATIFICATION2" VARCHAR2(200), 
	"TOPICID" VARCHAR2(200), 
	"LOCATIONID" VARCHAR2(200), 
	"LOCATION1" VARCHAR2(200)
   ) ;
