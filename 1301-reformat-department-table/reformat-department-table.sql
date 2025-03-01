SELECT pvt.id    AS id
     , pvt.[Jan] AS Jan_Revenue
     , pvt.[Feb] AS Feb_Revenue
     , pvt.[Mar] AS Mar_Revenue
     , pvt.[Apr] AS Apr_Revenue
     , pvt.[May] AS May_Revenue
     , pvt.[Jun] AS Jun_Revenue
     , pvt.[Jul] AS Jul_Revenue
     , pvt.[Aug] AS Aug_Revenue
     , pvt.[Sep] AS Sep_Revenue
     , pvt.[Oct] AS Oct_Revenue
     , pvt.[Nov] AS Nov_Revenue
     , pvt.[Dec] AS Dec_Revenue

  FROM Department A

  PIVOT (SUM(A.revenue) FOR A.month
         IN ([Jan],[Feb],[Mar],[Apr],[May],[Jun],[Jul],[Aug],[Sep],[Oct],[Nov],[Dec])
        ) pvt