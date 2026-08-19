@id("1cd51e4b-cc37-480a-900a-0666b20a5942")
@nodeType("702")
@clusterEnabled
SELECT
    c.c_name AS nation @isClusterKey(1),
    r.r_name AS region @isClusterKey(2),
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