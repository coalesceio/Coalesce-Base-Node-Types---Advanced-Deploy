@id("1694b8d8-b439-466a-9ce0-be126ae69f27")
@nodeType("696")
@clusterKey(true)
@truncateBefore(false)
@clusterKeyConfig("trunc(""N_NATIONKEY"", -5)", "[object Object]")
@description("adf''kgjt - edited")
@selectDistinct(true)
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @nullable(false) @inHash("1|GH_COL") @description("jkdfh''adfjh"),
     "N_NAME" AS "N_NAME",
     "N_REGIONKEY" AS "N_REGIONKEY_RENAME" @defaultValue(0) @previousName("N_REGIONKEY"),
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP"  @nullable(false) @description("jkadfh''afjh"),
     {{ get_hash("GH_COL") }}::string AS "GH_COL"
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
