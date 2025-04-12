CREATE SCHEMA IF NOT EXISTS landing_zone;


CREATE TABLE IF NOT EXISTS landing_zone.cdc_control (
    table_name TEXT PRIMARY KEY,
    last_loaded TIMESTAMP
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'landing_zone';

CREATE TABLE IF NOT EXISTS landing_zone.stg_rental AS
SELECT * FROM landing_zone.rental WHERE 1=0;

CREATE TABLE IF NOT EXISTS landing_zone.stg_payment AS
SELECT * FROM landing_zone.payment WHERE 1=0;

-- Verifica última carga
WITH last_load AS (
    SELECT COALESCE(last_loaded, '1900-01-01') AS last_loaded
    FROM landing_zone.cdc_control
    WHERE table_name = 'rental'
)
-- Captura novos registros
INSERT INTO landing_zone.stg_rental
SELECT *
FROM landing_zone.rental, last_load
WHERE last_update > last_load;

-- Atualiza controle
INSERT INTO landing_zone.cdc_control (table_name, last_loaded)
VALUES ('rental', NOW())
ON CONFLICT (table_name) DO UPDATE
SET last_loaded = EXCLUDED.last_loaded;




WITH last_load AS (
    SELECT COALESCE(last_loaded, '1900-01-01') AS last_loaded
    FROM landing_zone.cdc_control
    WHERE table_name = 'payment'
)
INSERT INTO landing_zone.stg_payment
SELECT *
FROM landing_zone.payment, last_load
WHERE payment_date > last_load;

INSERT INTO landing_zone.cdc_control (table_name, last_loaded)
VALUES ('payment', NOW())
ON CONFLICT (table_name) DO UPDATE
SET last_loaded = EXCLUDED.last_loaded;
