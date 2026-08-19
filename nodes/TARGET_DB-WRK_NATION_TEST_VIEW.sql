@id("dc6a5305-6063-4c33-8462-328b5dbadd07")
@nodeType("702")
@clusterEnabled
@materializationType("view")
@description("Table '''decsripton --adfk")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @isClusterKey(5) @description("Column '''decsripton --adfk") @inHash("GH_COL", 1),
     "N_NAME" AS "N_NAME" @isClusterKey(6) @inHash("GH_COL", 2),
     "N_REGIONKEY" AS "N_REGIONKEY" @previousName("N_REGIONKEY") @inHash("GH_COL", 3),
     "N_COMMENT" AS "N_COMMENT",
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP" @isClusterKey(2, "DATE_TRUNC('MONTH', N_LOAD_TIMESTAMP)") @isClusterKey(3, "DATE_TRUNC('YEAR', N_LOAD_TIMESTAMP)") @isClusterKey(4, "TO_DATE(N_LOAD_TIMESTAMP)"),
     {{get_hash("GH_COL")}}::STRING AS HASH_COL,
     {{get_hash("GH_COL", algo='SHA256', delimiter='-') }}::STRING AS HASH_COL_SHA256,
     {{get_hash("GH_COL", algo='MD5', delimiter='&') }}::STRING AS HASH_COL_MD5,
     {{get_hash("GH_COL", delimiter='&') }}::STRING AS HASH_COL_DELIM
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"