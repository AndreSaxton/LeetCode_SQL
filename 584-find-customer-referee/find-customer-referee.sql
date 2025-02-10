select a.name
  from Customer a
 where isnull(a.referee_id,0) <> 2