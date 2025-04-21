SELECT B.user_id    AS user_id
     , B.time_stamp AS last_stamp

FROM Logins B
JOIN (
       SELECT A.user_id
            , MAX(A.time_stamp) AS last_stamp
            , ROW_NUMBER() OVER(ORDER BY A.user_id) AS ROW
         FROM Logins A
        WHERE YEAR(A.time_stamp) = 2020
        GROUP BY A.user_id
     ) X ON X.user_id = B.user_id AND B.time_stamp = X.last_stamp