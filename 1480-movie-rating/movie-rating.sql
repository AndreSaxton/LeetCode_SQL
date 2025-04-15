WITH CTE_UserRating AS
(
    SELECT TOP 1
           U.name
         , RANK() OVER (ORDER BY COUNT(MR.user_id) DESC, U.name ASC) AS RANK_MR
      FROM Users U
      JOIN MovieRating MR ON MR.user_id = U.user_id
     GROUP BY U.name
     ORDER BY RANK_MR ASC
),
CTE_MovieRating AS
(
    SELECT TOP 1
           M.title
         , AVG(CONVERT(NUMERIC(10,2),MR.rating)) OVER (PARTITION BY MR.movie_id ORDER BY M.title) AS AVG_rating
      FROM MovieRating MR
      JOIN Movies      M  ON M.movie_id = MR.movie_id
     WHERE MR.created_at BETWEEN '2020-02-01'
                             AND EOMONTH('2020-02-01')
     ORDER BY AVG_rating DESC, M.title ASC
)


SELECT CTE_UR.name AS results
  FROM CTE_UserRating  CTE_UR
 
 UNION ALL

SELECT CTE_MR.title AS results
  FROM CTE_MovieRating CTE_MR