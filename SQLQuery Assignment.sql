/* Problem 1: Find the total number of crimes recorded in the CRIME table */
select count(ID) from ChicagoCrimeData

/* Problem 2: List community areas with per capita income less than 11000. */
select COMMUNITY_AREA_NAME, PER_CAPITA_INCOME from ChicagoCensusData
where PER_CAPITA_INCOME < 11000

/* Problem 3: List all case numbers for crimes  involving minors?(children are not considered minors for the purposes of crime analysis) */
select CASE_NUMBER from ChicagoCrimeData
where [DESCRIPTION] LIKE '%Minor%'

/* Problem 4: List all kidnapping crimes involving a child? */
select PRIMARY_TYPE,[DESCRIPTION] from ChicagoCrimeData
where PRIMARY_TYPE LIKE '%KIDNAPPING%'  AND [DESCRIPTION] LIKE '%Child%'

/* Problem 5: What kind of crimes were recorded at schools */
select PRIMARY_TYPE,[DESCRIPTION],LOCATION_DESCRIPTION from ChicagoCrimeData
where LOCATION_DESCRIPTION LIKE '%school%'

/* Problem 6: List the average safety score for all types of schools. */
select Elementary_Middle_or_High_School, AVG(SAFETY_SCORE)from ChicagoPublicSchools
group by Elementary_Middle_or_High_School

/* Problem 7: List 5 community areas with highest % of households below poverty line. */
select TOP(5)PERCENT_HOUSEHOLDS_BELOW_POVERTY,COMMUNITY_AREA_NAME from ChicagoCensusData
order by PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC

/* Problem 8: Which community area(number) is most crime prone? */
select TOP(1)COMMUNITY_AREA_NUMBER, COUNT(COMMUNITY_AREA_NUMBER)from ChicagoCrimeData
group by COMMUNITY_AREA_NUMBER
order by COUNT(COMMUNITY_AREA_NUMBER) DESC

/* Problem 9: Use a sub-query to find the name of the community area with highest hardship index. */
select COMMUNITY_AREA_NAME, HARDSHIP_INDEX from ChicagoCensusData
where HARDSHIP_INDEX = (select max(HARDSHIP_INDEX) from ChicagoCensusData)

/* Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes? */
select COMMUNITY_AREA_NAME from ChicagoCensusData
where COMMUNITY_AREA_NUMBER = (select TOP(1)COMMUNITY_AREA_NUMBER from ChicagoCrimeData group by COMMUNITY_AREA_NUMBER order by count(COMMUNITY_AREA_NUMBER) DESC)
