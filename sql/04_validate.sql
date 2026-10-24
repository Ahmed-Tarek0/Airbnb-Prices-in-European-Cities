USE AirbnbEurope;
GO

-- 1) Row counts must match (expected 51707)
SELECT
    (SELECT COUNT(*) FROM stg_airbnb) AS staging_rows,
    (SELECT COUNT(*) FROM listings)   AS listings_rows;

-- 2) No orphan rows (all joins matched)
SELECT COUNT(*) AS orphan_rows
FROM listings l
LEFT JOIN cities c ON c.city_id = l.city_id
WHERE c.city_id IS NULL;

-- 3) Sanity check: median-like view of price by city
SELECT c.city_name, COUNT(*) AS listings, ROUND(AVG(l.real_sum), 1) AS avg_price
FROM listings l
JOIN cities c ON c.city_id = l.city_id
GROUP BY c.city_name
ORDER BY avg_price DESC;