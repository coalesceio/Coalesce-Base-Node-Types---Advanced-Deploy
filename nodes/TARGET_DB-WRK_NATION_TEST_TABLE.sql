@id("4674efd2-be46-4557-9565-2cf9fcfa2f7f")
@nodeType("702")
@clusterEnabled
@description("Table '''decsripton --adfk")
SELECT
     "N_NATIONKEY" AS "N_NATIONKEY" @isClusterKey(5) @description("Column '''decsripton --adfk"),
     "N_NAME" AS "N_NAME" @isClusterKey(6),
     "N_REGIONKEY" AS "N_REGIONKEY" @previousName("N_REGIONKEY"),
     "N_COMMENT" AS "N_COMMENT",
     "N_LOAD_TIMESTAMP" AS "N_LOAD_TIMESTAMP" @isClusterKey(2, "DATE_TRUNC('MONTH', N_LOAD_TIMESTAMP)") @isClusterKey(3, "DATE_TRUNC('YEAR', N_LOAD_TIMESTAMP)") @isClusterKey(4, "TO_DATE(N_LOAD_TIMESTAMP)")
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"