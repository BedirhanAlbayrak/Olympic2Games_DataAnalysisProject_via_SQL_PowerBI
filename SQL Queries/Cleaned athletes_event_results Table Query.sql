--Cleaned athletes_event_results table--


SELECT 
       [Name] AS 'Competitor Name'
      ,CASE WHEN Sex = 'M' THEN 'Male' WHEN Sex = 'F' THEN 'Famale' END AS Sex
	  ,[Age]
      ,CASE					
			WHEN Age < 18 THEN 'Under 18'			-- Grouping competitors by age.
			WHEN Age Between 18 and 25 THEN '18-25'
			WHEN Age BETWEEN 26 AND 30 THEN '26-30'
			WHEN Age > 30 THEN 'Over 30'
			END AS 'Age Grouping'
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code'
      ,LEFT(Games, CHARINDEX(' ', Games) - 1) AS Year  -- Spliting column to find year information from Games column.
	  ,RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) - 1) AS Season -- Spliting column to find season information from Games column.
      --[City] -- It is not nessesary for the analysis.
      ,[Sport]
      ,[Event]
      ,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal -- Replaces 'NA' with 'Not Registered'.
FROM [olympic_games].[dbo].[athletes_event_results]
WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) - 1) = 'Summer' -- Adding where clause to bring only Summer Games.
