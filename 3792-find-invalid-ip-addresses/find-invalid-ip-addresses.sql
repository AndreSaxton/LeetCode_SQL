SELECT X.ip
     , COUNT(X.ip) AS invalid_count
  FROM (
         SELECT L.ip AS ip
              , COUNT(CASE WHEN SPLIT.value > 255 THEN 1 END) AS greater_than_255
              , COUNT(CASE WHEN LEFT(SPLIT.value,1) = 0 THEN 1 END ) AS leading_zeros
              , CASE WHEN COUNT(SPLIT.value) <> 4 THEN 1 ELSE 0 END AS not_four_octet
           FROM logs L
          CROSS APPLY STRING_SPLIT(L.ip , '.') SPLIT
          GROUP BY L.ip, L.log_id
       ) X
 WHERE 1=1
   AND (greater_than_255 + leading_zeros + not_four_octet) > 0
 GROUP BY X.ip
 ORDER BY invalid_count DESC, X.ip DESC
