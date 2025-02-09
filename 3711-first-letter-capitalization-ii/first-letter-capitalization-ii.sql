/* Write your T-SQL query statement below */
SELECT

uc.content_id   AS content_id,
uc.content_text AS original_text,


STRING_AGG(
CASE WHEN IIF(CHARINDEX('-',split.value) > 0, CHARINDEX('-',split.value) ,0) > 0
     THEN CONCAT(UPPER(SUBSTRING(split.value,1,1))
      ,SUBSTRING(REPLACE(split.value,RIGHT(LEFT(split.value,CHARINDEX('-',split.value)+1),2),UPPER(RIGHT(LEFT(split.value,CHARINDEX('-',split.value)+1),2))),2,LEN(split.value))
     )
     ELSE CONCAT(UPPER(LEFT(split.value,1)),SUBSTRING(split.value,2,LEN(split.value)))
END
, ' ') AS converted_text

FROM user_content uc
CROSS APPLY STRING_SPLIT(LOWER(uc.content_text),' ') split

GROUP BY uc.content_text, uc.content_id

