@id("1694b8d8-b439-466a-9ce0-be126ae69f27")
@nodeType("696")
@truncateBefore(false)
@clusterKeyConfig("trunc(""N_NATIONKEY"", -5)", "[object Object]")
@description("adf''kgjt - edited")
@selectDistinct(true)
@materializationType("transient table")
@asOfJoin(true)
@asofJoinConfig("SOURCE_DATA", "NATION_HISTORY", "NATION_TEST.N_LOAD_TIMESTAMP>=NATION_HISTORY.N_LOAD_TIMESTAMP", "ON", "NATION_TEST.N_NATIONKEY = NATION_HISTORY.N_NATIONKEY")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @inHash("1|GH_COL") @description("jkdfh''afjh") @defaultValue(1),
     "N_NAME"::VARCHAR(200) AS "N_NAME" @nullable(false) @description("jkafh''afjh"),
     "N_REGIONKEY" AS "N_REGIONKEY_RENAME" @inHash("2|GH_COL") @defaultValue(2) @previousName("N_REGIONKEY"),
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP"  @nullable(true) ,
     {{ get_hash("GH_COL") }}::string AS "GH_COL" @nullable(true)
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
WHERE NATION_TEST.N_NATIONKEY = 2