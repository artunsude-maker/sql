WITH ranked_stations AS (
  SELECT
    SAFE_CAST(trips.end_station_id AS INT64) AS end_station_id,
    COUNT(*) AS total_trips
  FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips` AS trips
  INNER JOIN `bigquery-public-data.austin_bikeshare.bikeshare_stations` AS stations
    ON SAFE_CAST(trips.end_station_id AS INT64) = stations.station_id
  WHERE stations.status = 'active'
  GROUP BY end_station_id
  ORDER BY total_trips DESC
  LIMIT 10
)

SELECT
  trips.subscriber_type,
  trips.bike_type,
  trips.start_station_id,
  SAFE_CAST(trips.end_station_id AS INT64) AS end_station_id,
  stations.status,
  rs.total_trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips` AS trips
INNER JOIN `bigquery-public-data.austin_bikeshare.bikeshare_stations` AS stations
  ON SAFE_CAST(trips.end_station_id AS INT64) = stations.station_id
INNER JOIN ranked_stations AS rs
  ON SAFE_CAST(trips.end_station_id AS INT64) = rs.end_station_id
WHERE stations.status = 'active'
ORDER BY rs.total_trips DESC, trips.end_station_id
