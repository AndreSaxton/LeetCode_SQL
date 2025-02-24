SELECT X.machine_id                    AS machine_id
     , ROUND(AVG(X.processing_time),3) AS processing_time
  FROM (
        SELECT A.machine_id AS machine_id
             , A.process_id AS process_id
             , SUM(CASE WHEN A.activity_type = 'start'
                    THEN - A.timestamp
                    ELSE   A.timestamp
               END)         AS processing_time
          FROM Activity A
         GROUP BY A.machine_id, A.process_id
       ) X
 GROUP BY X.machine_id
 ORDER BY X.machine_id ASC
 