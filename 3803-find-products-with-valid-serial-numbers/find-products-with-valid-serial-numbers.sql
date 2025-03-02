SELECT A.*

  FROM products A
  
 WHERE A.description     LIKE '%SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]%'
   AND A.description NOT LIKE '%SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]%'
 
 ORDER BY A.product_id ASC