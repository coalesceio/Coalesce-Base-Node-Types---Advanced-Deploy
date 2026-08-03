@id("1694b8d8-b439-466a-9ce0-be126ae69f27")
@nodeType("696")
@clusterKey(true)
@truncateBefore(false)
@clusterKeyConfig("trunc(""N_NATIONKEY"", -5)", "[object Object]")
@description("adf''kgjt - edited")
@selectDistinct(true)
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @inHash("1|GH_COL") @description("jkdfh''afjh") @defaultValue(1),
     "N_NAME" AS "N_NAME" @nullable(false) @description("jkafh''afjh"),
     "N_REGIONKEY" AS "N_REGIONKEY_RENAME" @defaultValue(1) @previousName("N_REGIONKEY"),
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP"  @nullable(true) ,
     {{ get_hash("GH_COL") }}::string AS "GH_COL" @nullable(true)
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
