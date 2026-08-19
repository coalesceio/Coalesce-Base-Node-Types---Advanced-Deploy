@id("3d35ffd4-0f57-42aa-b1d9-746c4665ab97")
@nodeType("702")
@description("a join example using two'' CTEs")
WITH nation_cte AS (
    SELECT
        N_NATIONKEY,
        N_NAME,
        N_REGIONKEY
    FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
),
region_cte AS (
    SELECT
        N_REGIONKEY,
        COUNT(*) AS nation_count
    FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} "NATION_TEST"
    GROUP BY N_REGIONKEY
)
SELECT
    n.N_NAME @notNull,
    r.nation_count @description("Region''' Count")
FROM nation_cte n
JOIN region_cte r
    ON n.N_REGIONKEY = r.N_REGIONKEY