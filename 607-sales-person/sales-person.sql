SELECT S.NAME
  FROM SalesPerson S
 WHERE NOT EXISTS (SELECT O.sales_id
                     FROM Company C
                     JOIN Orders  O ON O.com_id = C.com_id
                    WHERE C.name     = 'RED'
                      AND O.sales_id = S.sales_id)