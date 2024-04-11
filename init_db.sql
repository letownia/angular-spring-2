CREATE DATABASE zoo_db;
\c zoo_db;


CREATE TABLE room (
  id SERIAL PRIMARY KEY,
  identifier VARCHAR(64)
);


CREATE TABLE thermometer (
  id SERIAL PRIMARY KEY,
  identifier VARCHAR(64) NOT NULL,
  room_id INTEGER REFERENCES room NOT NULL
);

CREATE TABLE temperature (
  id SERIAL PRIMARY KEY,
  thermometer_id INTEGER REFERENCES thermometer NOT NULL,
  timestamp_ms BIGINT NOT NULL,
  temperature FLOAT8 NOT NULL,
  time_sensitive_anomaly BOOLEAN default FALSE NOT NULL,
  time_agnostic_anomaly BOOLEAN default FALSE NOT NULL
);

CREATE INDEX temperature_timestamp_ms ON temperature(timestamp_ms);
CREATE INDEX time_sensitive_anomaly ON temperature(time_sensitive_anomaly);
CREATE INDEX time_agnostic_anomaly ON temperature(time_agnostic_anomaly);


CREATE USER zoo_user WITH ENCRYPTED PASSWORD 'sK2rPjqfufz30jT';

GRANT all privileges on database zoo_db to zoo_user ;
-- WARNING / TODO - next two lines should be changed. since it grants privileges on all databases
GRANT pg_read_all_data TO zoo_user;
GRANT pg_write_all_data TO zoo_user;



