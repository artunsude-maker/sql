# Austin Bikeshare Analysis
This project includes two BigQuery tables ( austin bikeshare trips, austin bikeshare station ) 
created for to detect the most preferred (top 10 ) end stations and most preferred (top 10)
subscriber_type, bike_type, start_station_id, end_station_id, status (grouped)

## Contents
- `queries/`: SQL scripts used to generate the tables.
- `data/`: Used Google Data for demonstration purposes.

## How to Reproduce
1. Run the queries in BigQuery.
2. Use exported tables in your analysis workflow.
   
## Files
- `queries/table1_query.sql` → Used to create `GROUP BY ALL.csv`
- `queries/table2_query.sql` → Used to create `GROUP BY end_station_id.csv`
