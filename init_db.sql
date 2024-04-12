DROP DATABASE zoo_db;
DROP USER if exists zoo_user;

CREATE DATABASE zoo_db;
\c zoo_db;


CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = now();
   RETURN NEW;
END;
$$ language 'plpgsql';



CREATE TABLE map_feature (
  id SERIAL PRIMARY KEY,
  name             VARCHAR(64) NOT NULL,
  category         VARCHAR(16)  NOT NULL,
  -- see https://stackoverflow.com/questions/15965166/what-are-the-lengths-of-location-coordinates-latitude-and-longitude
  latitude         DECIMAL(10, 8) NOT NULL,
  longitude        DECIMAL(11,8) NOT NULL,
  description      VARCHAR(512) NOT NULL,
  google_place_id  VARCHAR(512) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


CREATE TRIGGER map_feature_update_timestamps BEFORE UPDATE
    ON map_feature FOR EACH ROW EXECUTE PROCEDURE
    update_timestamp();

ALTER TABLE map_feature
  ADD CONSTRAINT check_category CHECK (category IN ('MYTHICAL', 'FISH', 'BIRDS', 'AMPHIBIANS', 'MAMMALS', 'REPTILES', 'INSECTS', 'ARACHNIDS'));


--
--CREATE TABLE temperature (
--  id SERIAL PRIMARY KEY,
--  thermometer_id INTEGER REFERENCES thermometer NOT NULL,
--  timestamp_ms BIGINT NOT NULL,
--  temperature FLOAT8 NOT NULL,
--  time_sensitive_anomaly BOOLEAN default FALSE NOT NULL,
--  time_agnostic_anomaly BOOLEAN default FALSE NOT NULL
--);

ALTER TABLE map_feature
  ADD CONSTRAINT check_category CHECK (category IN ('MYTHICAL', 'FISH', 'BIRDS', 'AMPHIBIANS', 'MAMMALS', 'REPTILES', 'INSECTS', 'ARACHNIDS'));

--
--CREATE INDEX temperature_timestamp_ms ON temperature(timestamp_ms);
--CREATE INDEX time_sensitive_anomaly ON temperature(time_sensitive_anomaly);
--CREATE INDEX time_agnostic_anomaly ON temperature(time_agnostic_anomaly);

CREATE USER zoo_user WITH ENCRYPTED PASSWORD 'sK2rPjqfufz30jT';

GRANT all privileges on database zoo_db to zoo_user ;

GRANT pg_read_all_data TO zoo_user;
GRANT pg_write_all_data TO zoo_user;


