@id("823286d6-bf42-44e7-805f-09dceb5b77c8")
@nodeType("699")
@clusterKey(true)
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @clusterBy("3|"),
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY" @clusterBy("2|trunc(N_REGIONKEY,-5)"),
     "N_COMMENT" AS "N_COMMENT",
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP" @clusterBy("1|TO_DATE(N_LOAD_TIMESTAMP)")
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"