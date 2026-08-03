@id("1694b8d8-b439-466a-9ce0-be126ae69f27")
@nodeType("696")
@clusterKey(true)
@truncateBefore(false)
@clusterKeyConfig("trunc(""N_NATIONKEY"", -5)", "[object Object]")
@description("adf''kgjt")
@selectDistinct(true)
@orderby(true)
@orderbycolumn("[object Object]", "desc")
@orderbycolumn("[object Object]", "desc")
@materializationType("view")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @nullable(false),
     "N_NAME" AS "N_NAME" @description("jkadfh''adfjh"),
     "N_REGIONKEY" AS "N_REGIONKEY" @defaultValue(0),
     "N_COMMENT" AS "N_COMMENT",
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP"
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
