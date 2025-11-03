CREATE OR REPLACE TABLE kimia_farma.tabel_analisa AS
SELECT
    -- Kolom dari tabel transaction
    t.transaction_id,
    t.date,
    t.branch_id,
    t.customer_name,
    t.product_id,
    t.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi,

    -- Kolom dari tabel kantor_cabang
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating AS rating_cabang,

    -- Kolom dari tabel product
    p.product_name,

    -- Kolom kalkulasi
    -- 1. Menghitung persentase gross laba berdasarkan harga
    CASE
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
        WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
        WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,

    -- 2. Menghitung harga setelah diskon (Nett Sales)
    (t.price * (1 - t.discount_percentage)) AS nett_sales,

    -- 3. Menghitung Keuntungan (Nett Profit)
    (t.price * (1 - t.discount_percentage)) * (
        CASE
            WHEN t.price <= 50000 THEN 0.10
            WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
            WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
            WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
            ELSE 0.30
        END
    ) AS nett_profit

FROM
    `rakamin-kf-analytics-476707.kimia_farma.kf_final_transaction` AS t
LEFT JOIN
    `rakamin-kf-analytics-476707.kimia_farma.kf_kantor_cabang` AS kc ON t.branch_id = kc.branch_id
LEFT JOIN
    `rakamin-kf-analytics-476707.kimia_farma.kf_product` AS p ON t.product_id = p.product_id;
