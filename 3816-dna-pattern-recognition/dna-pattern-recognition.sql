SELECT sample_id                                                                AS sample_id
     , dna_sequence                                                             AS dna_sequence
     , species                                                                  AS species
     , CASE WHEN LEFT(dna_sequence ,3)  = 'ATG'               THEN 1 ELSE 0 END AS has_start
     , CASE WHEN RIGHT(dna_sequence,3) IN ('TAA','TAG','TGA') THEN 1 ELSE 0 END AS has_stop
     , CASE WHEN CHARINDEX('ATAT',dna_sequence) > 0           THEN 1 ELSE 0 END AS has_atat
     , CASE WHEN CHARINDEX('GGG' ,dna_sequence) > 0           THEN 1 ELSE 0 END AS has_ggg
  FROM Samples
 ORDER BY sample_id ASC