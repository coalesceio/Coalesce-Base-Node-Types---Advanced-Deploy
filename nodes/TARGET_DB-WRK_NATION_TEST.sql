@id("1694b8d8-b439-466a-9ce0-be126ae69f27")
@nodeType("696")
@clusterKey(true)
@truncateBefore(false)
@clusterKeyConfig(" trunc(""N_NATIONKEY"", -5)", "[object Object]")
@description("adf''kgjt")
@selectDistinct(true)
@orderbycolumn("[object Object]", "desc")
@testsEnabled(true)
@preSQL("SELECT count(*) FROM {{ this }}")
@postSQL("SELECT count(*) FROM {{ this }}")
@tests("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT HAVING COUNT(*) > 1", "Before", true)
@tests("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT HAVING COUNT(*) > 1", "After", true)
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @nullable(false),
     "N_NAME" AS "N_NAME" @description("jkadfh''adfjh"),
     "N_REGIONKEY" AS "N_REGIONKEY" @defaultValue(0),
     "N_COMMENT" AS "N_COMMENT",
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP"
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
