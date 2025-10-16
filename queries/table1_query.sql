SELECT
trips.subscriber_type,
trips.bike_type,
trips.start_station_id,
trips.end_station_id,
stations.status,
COUNT(*) AS total_trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips` AS trips
INNER JOIN `bigquery-public-data.austin_bikeshare.bikeshare_stations` AS stations
ON SAFE_CAST (trips.end_station_id AS INT64) = stations.station_id
WHERE status = 'active'
GROUP BY trips.subscriber_type, trips.bike_type, trips.start_station_id,trips.end_station_id,stations.status
ORDER BY total_trips DESC
LIMIT 10
