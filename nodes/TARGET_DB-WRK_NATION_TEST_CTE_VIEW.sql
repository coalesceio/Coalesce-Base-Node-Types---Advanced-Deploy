@id("10491a59-3684-40d8-84aa-314c8a7faa2f")
@nodeType("702")
@description("a join example using two'' CTEs")
@materializationType("view")
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
    n.N_NAME @notNull @defaultValue("N/'A"),
    r.nation_count @description("Region''' Count")
FROM nation_cte n
JOIN region_cte r
    ON n.N_REGIONKEY = r.N_REGIONKEY