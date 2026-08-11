@id("efce813d-ded2-4098-8186-0ac9a7bc4109")
@nodeType("696")
@clusterKey(true)
@clusterKeyConfig("", "[object Object]")


SELECT
     "N_NATIONKEY" AS "N_NATIONKEY",
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY",
     "N_COMMENT" AS "N_COMMENT",
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP"
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"