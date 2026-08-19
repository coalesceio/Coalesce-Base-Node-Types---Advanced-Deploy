@id("dc6a5305-6063-4c33-8462-328b5dbadd07")
@nodeType("702")
@materializationType("view")
@clusterEnabled
@truncateBefore
@testsEnabled
@tests("SELECT 1 FROM {{ this }}")
@tests("SELECT 2 FROM {{ this }}", "Before", true)
@tests("SELECT 3 FROM {{ this }}", "After")
@tests("SELECT 4 FROM {{ this }}", "After", true)
@selectDistinct
@description("Table '''decsripton --adfk")
@preSQL("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT HAVING COUNT(*) > 1")
@preSQL("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT HAVING COUNT(*) > 2")
@postSQL("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT HAVING COUNT(*) > 1")
@postSQL("SELECT 1 FROM {{ this }} GROUP BY N_COMMENT HAVING COUNT(*) > 2")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @isClusterKey(5) @description("Column '''decsripton --adfk") @inHash("GH_COL", 1),
     "N_NAME" AS "N_NAME" @isClusterKey(6) @inHash("GH_COL", 2) @notNull @tests("null") @tests("unique"),
     "N_REGIONKEY" AS "N_REGIONKEY" @previousName("N_REGIONKEY") @inHash("GH_COL", 3) @inHash("GH_COL", 4) @tests("null"),
     "N_COMMENT" AS "N_COMMENT" @tests("unique") @defaultValue("N/A"),
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP" @isClusterKey(2, "DATE_TRUNC('MONTH', N_LOAD_TIMESTAMP)") @isClusterKey(3, "DATE_TRUNC('YEAR', N_LOAD_TIMESTAMP)") @isClusterKey(4, "TO_DATE(N_LOAD_TIMESTAMP)"),
     {{get_hash("GH_COL")}}::STRING AS HASH_COL,
     {{get_hash("GH_COL", algo='SHA256', delimiter='-') }}::STRING AS HASH_COL_SHA256,
     {{get_hash("GH_COL", algo='MD5', delimiter='&') }}::STRING AS HASH_COL_MD5,
     {{get_hash("GH_COL", delimiter='&') }}::STRING AS HASH_COL_DELIM
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"