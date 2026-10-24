USE AirbnbEurope;
GO

-- Dimension tables
CREATE TABLE cities (
    city_id   INT IDENTITY(1,1) PRIMARY KEY,
    city_name NVARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE room_types (
    room_type_id   INT IDENTITY(1,1) PRIMARY KEY,
    room_type_name NVARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE day_types (
    day_type_id   INT IDENTITY(1,1) PRIMARY KEY,
    day_type_name NVARCHAR(10) NOT NULL UNIQUE
);

-- Fact table
CREATE TABLE listings (
    listing_id                 INT PRIMARY KEY,
    city_id                    INT NOT NULL,
    room_type_id               INT NOT NULL,
    day_type_id                INT NOT NULL,
    real_sum                   DECIMAL(12,4) NOT NULL,
    price_per_person           DECIMAL(12,4) NOT NULL,
    person_capacity            INT NOT NULL,
    bedrooms                   INT NOT NULL,
    is_studio                  BIT NOT NULL,
    host_is_superhost          BIT NOT NULL,
    is_multi_listing           BIT NOT NULL,
    is_business                BIT NOT NULL,
    cleanliness_rating         DECIMAL(4,1) NOT NULL,
    guest_satisfaction_overall DECIMAL(5,1) NOT NULL,
    dist                       DECIMAL(10,6) NOT NULL,
    metro_dist                 DECIMAL(10,6) NOT NULL,
    attr_index                 DECIMAL(12,6) NOT NULL,
    attr_index_norm            DECIMAL(12,6) NOT NULL,
    rest_index                 DECIMAL(12,6) NOT NULL,
    rest_index_norm            DECIMAL(12,6) NOT NULL,
    lng                        DECIMAL(9,6) NOT NULL,
    lat                        DECIMAL(9,6) NOT NULL,
    is_iqr_outlier             BIT NOT NULL,
    is_extreme_price           BIT NOT NULL,

    CONSTRAINT fk_listings_city      FOREIGN KEY (city_id)      REFERENCES cities(city_id),
    CONSTRAINT fk_listings_room_type FOREIGN KEY (room_type_id) REFERENCES room_types(room_type_id),
    CONSTRAINT fk_listings_day_type  FOREIGN KEY (day_type_id)  REFERENCES day_types(day_type_id)
);