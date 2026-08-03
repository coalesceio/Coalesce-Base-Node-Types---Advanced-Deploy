@id("1694b8d8-b439-466a-9ce0-be126ae69f27")
@nodeType("696")
@clusterKey(true)
@truncateBefore(false)
@clusterKeyConfig("trunc(""N_NATIONKEY"", -5)", "[object Object]")
@description("adf''kgjt - edited")
@selectDistinct(true)
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @nullable(true) @inHash("1|GH_COL") @description("jkadfh''adfjh"),
     "N_NAME" AS "N_NAME" @description("jkadfh''afjh"),
     "N_REGIONKEY" AS "N_REGIONKEY_RENAME" @defaultValue(0) @previousName("N_REGIONKEY"),
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP",
     {{ get_hash("GH_COL") }}::string AS "GH_COL" @nullable(false)
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
