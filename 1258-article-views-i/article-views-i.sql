SELECT DISTINCT
       A.author_id AS id
  FROM Views A
  JOIN Views V ON V.article_id = A.article_id
              AND V.viewer_id  = A.author_id