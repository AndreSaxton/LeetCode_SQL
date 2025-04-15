WITH CTE_TreeLeaf AS
(
    SELECT DISTINCT
           T1.id   AS id
         , T2.p_id AS p_id
         , CASE WHEN T2.p_id IS NULL
                THEN 'Leaf'
                ELSE 'Inner'
           END     AS type
      FROM Tree T1
      LEFT 
      JOIN Tree T2 ON T2.p_id = T1.id
),
CTE_Tree AS
(
    SELECT id AS id
         , 0  AS p_id
         , CONVERT(VARCHAR(10),'Root') AS type
      FROM Tree
     WHERE p_id IS NULL

     UNION ALL

    SELECT T.id   AS id
         , T.p_id AS p_id
         , CONVERT(VARCHAR(10),CTE_LEAF.type) AS type
      FROM Tree T
      JOIN CTE_Tree     CTE_TREE ON CTE_TREE.id = T.p_id
      JOIN CTE_TreeLeaf CTE_LEAF ON CTE_LEAF.id = T.id
)


SELECT CTE.id
     , CTE.type
  FROM CTE_Tree CTE