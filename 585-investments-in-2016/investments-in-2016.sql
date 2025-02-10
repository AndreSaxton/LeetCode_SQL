select round(sum(b.tiv_2016),2) as tiv_2016
  from Insurance b

  join ( select tiv_2015 from Insurance group by tiv_2015 having count(tiv_2015) > 1 ) c on c.tiv_2015 = b.tiv_2015

 where exists ( select a.lat, a.lon
                  from Insurance a
                 group by a.lat, a.lon
                having count(*) = 1 
                   and a.lat = b.lat
                   and a.lon = b.lon
              )