@id("c95ef347-678e-4df3-8379-1bf3adb2a4d0")
@nodeType("702")
WITH combined_data AS (
    SELECT
        c.c_name AS nation,
        r.r_name AS region,
        c.c_custkey AS customer_key,
        o.o_orderkey AS order_key,
        l.l_linenumber AS line_number,
        l.l_extendedprice AS extended_price
    FROM {{ ref('SOURCE_DATA', 'CUSTOMER') }} c
    JOIN {{ ref('SOURCE_DATA', 'NATION_TEST') }} n
        ON c.c_nationkey = n.n_nationkey
    JOIN {{ ref('SOURCE_DATA', 'REGION_PK') }} r
        ON n.n_regionkey = r.r_regionkey
    JOIN {{ ref('SOURCE_DATA', 'ORDERS') }} o
        ON c.c_custkey = o.o_custkey
    JOIN {{ ref('SOURCE_DATA', 'LINEITEM') }} l
        ON o.o_orderkey = l.l_orderkey

    UNION ALL

    SELECT
        n.n_name AS nation,
        r.r_name AS region,
        c.c_custkey AS customer_key,
        o.o_orderkey AS order_key,
        l.l_linenumber AS line_number,
        l.l_extendedprice AS extended_price
    FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} n
    JOIN {{ ref('SOURCE_DATA', 'REGION_PK') }} r
        ON n.n_regionkey = r.r_regionkey
    JOIN {{ ref('SOURCE_DATA', 'CUSTOMER') }} c
        ON c.c_nationkey = n.n_nationkey
    JOIN {{ ref('SOURCE_DATA', 'ORDERS') }} o
        ON c.c_custkey = o.o_custkey
    JOIN {{ ref('SOURCE_DATA', 'LINEITEM') }} l
        ON o.o_orderkey = l.l_orderkey
)

SELECT
    nation @notNull,
    region @description("Region Name"),
    COUNT(DISTINCT customer_key) AS customer_count,
    COUNT(DISTINCT order_key) AS order_count,
    SUM(extended_price) AS total_revenue
FROM combined_data
GROUP BY nation, region