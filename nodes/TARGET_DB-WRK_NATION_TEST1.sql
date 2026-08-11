@id("a787cad9-b63c-4dee-93f2-249747fc5e5f")
@nodeType("696")
SELECT
    N_NAME::VARCHAR(100) AS NATION_NAME @nullable(false) @defaultValue("NA") @collate('en') @description("Hello"),
    R_NAME::VARCHAR(100) AS REGION_NAME,
    N_COMMENT AS NATIONKEY @collate('en')
FROM {{ ref('SOURCE_DATA', 'NATION_TEST') }} NATION_TEST
INNER JOIN {{ ref('SOURCE_DATA', 'REGION_PK') }} REGION_PK
    ON NATION_TEST.N_REGIONKEY = REGION_PK.R_REGIONKEY;