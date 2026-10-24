USE AirbnbEurope;
GO

-- Fill the dimension tables with distinct values
INSERT INTO cities (city_name)
SELECT DISTINCT city FROM stg_airbnb ORDER BY city;

INSERT INTO room_types (room_type_name)
SELECT DISTINCT room_type FROM stg_airbnb ORDER BY room_type;

INSERT INTO day_types (day_type_name)
SELECT DISTINCT day_type FROM stg_airbnb ORDER BY day_type;

-- Fill the fact table by replacing text values with foreign keys
INSERT INTO listings (
    listing_id, city_id, room_type_id, day_type_id, real_sum, price_per_person,
    person_capacity, bedrooms, is_studio, host_is_superhost, is_multi_listing,
    is_business, cleanliness_rating, guest_satisfaction_overall, dist, metro_dist,
    attr_index, attr_index_norm, rest_index, rest_index_norm, lng, lat,
    is_iqr_outlier, is_extreme_price
)
SELECT
    s.listing_id, c.city_id, r.room_type_id, d.day_type_id, s.real_sum, s.price_per_person,
    s.person_capacity, s.bedrooms, s.is_studio, s.host_is_superhost, s.multi,
    s.biz, s.cleanliness_rating, s.guest_satisfaction_overall, s.dist, s.metro_dist,
    s.attr_index, s.attr_index_norm, s.rest_index, s.rest_index_norm, s.lng, s.lat,
    s.is_iqr_outlier, s.is_extreme_price
FROM stg_airbnb s
JOIN cities c      ON c.city_name = s.city
JOIN room_types r  ON r.room_type_name = s.room_type
JOIN day_types d   ON d.day_type_name = s.day_type;