-- Create the database and the staging table (raw copy of the silver file)
CREATE DATABASE AirbnbEurope;
GO
USE AirbnbEurope;
GO

CREATE TABLE stg_airbnb (
    listing_id                 INT,
    real_sum                   FLOAT,
    room_type                  NVARCHAR(30),
    room_shared                BIT,
    room_private               BIT,
    person_capacity            INT,
    host_is_superhost          BIT,
    multi                      INT,
    biz                        INT,
    cleanliness_rating         FLOAT,
    guest_satisfaction_overall FLOAT,
    bedrooms                   INT,
    dist                       FLOAT,
    metro_dist                 FLOAT,
    attr_index                 FLOAT,
    attr_index_norm            FLOAT,
    rest_index                 FLOAT,
    rest_index_norm            FLOAT,
    lng                        FLOAT,
    lat                        FLOAT,
    city                       NVARCHAR(30),
    day_type                   NVARCHAR(10),
    is_studio                  BIT,
    price_per_person           FLOAT,
    is_iqr_outlier             BIT,
    is_extreme_price           BIT
);