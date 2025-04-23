     SELECT R.contest_id     AS contest_id
          , ROUND((CONVERT(NUMERIC(5,2),COUNT(R.user_id))
                 / CONVERT(NUMERIC(5,2),U.QTTY_USERS)) * 100,2) AS percentage

       FROM Register R
 CROSS JOIN (SELECT COUNT(user_id) AS QTTY_USERS FROM Users) U

   GROUP BY R.contest_id, U.QTTY_USERS
   
   ORDER BY percentage DESC, contest_id ASC