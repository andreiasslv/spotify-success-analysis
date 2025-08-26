WITH combined_data AS (
  SELECT
    t1.track_id,
    t1.track_name,
    t1.artists_name,
    t1.artist_count,
    t1.released_year,
    t1.released_month,
    t1.released_day,
    t1.in_spotify_playlists,
    t1.in_spotify_charts,
    t1.streams,
    t2.bpm,
    t2.key,
    t2.mode,
    t2.`danceability_%` AS danceability,
    t2.`valence_%` AS valence,
    t2.`energy_%` AS energy,
    t2.`acousticness_%` AS acousticness,
    t2.`instrumentalness_%` AS instrumentalness,
    t2.`liveness_%` AS liveness,
    t2.`speechiness_%` AS speechiness,
    t3.in_apple_playlists,
    t3.in_apple_charts,
    REPLACE(CAST(t3.in_deezer_playlists AS STRING), ',', '') AS in_deezer_playlists,
    t3.in_deezer_charts,
    REPLACE(CAST(t3.in_shazam_charts AS STRING), ',', '') AS in_shazam_charts
  FROM
    `projeto2-hipoteses-468022.spotify_dados.spotify` AS t1
  LEFT JOIN
    `projeto2-hipoteses-468022.spotify_dados.info` AS t2 ON t1.track_id = CAST(t2.track_id AS STRING)
  LEFT JOIN
    `projeto2-hipoteses-468022.spotify_dados.competition` AS t3 ON t1.track_id = CAST(t3.track_id AS STRING)
),

cleaned_data AS (
  SELECT
    *,
    SAFE.DATE(released_year, released_month, released_day) AS release_date,
    CASE
      WHEN artist_count = 1 THEN 'Solo'
      WHEN artist_count = 2 THEN 'Duo'
      ELSE 'Group'
    END AS artist_type
  FROM
    combined_data
  WHERE
    streams IS NOT NULL
    AND streams > 1000
    AND TRIM(IFNULL(track_name, '')) != ''
    AND released_year BETWEEN 1950 AND 2023
    AND bpm > 0
),

final_data AS (
  SELECT
    *
  FROM (
    SELECT
      *,
      ROW_NUMBER() OVER(PARTITION BY track_id ORDER BY in_spotify_playlists DESC) as rn
    FROM
      cleaned_data
  )
  WHERE
    rn = 1
)

SELECT
  track_id,
  track_name,
  artists_name,
  artist_count,
  artist_type,
  released_year,
  release_date,
  in_spotify_playlists,
  in_spotify_charts,
  SAFE_CAST(streams AS INT64) AS streams,
  bpm,
  `key`,
  mode,
  danceability,
  valence,
  energy,
  acousticness,
  instrumentalness,
  liveness,
  speechiness,
  in_apple_playlists,
  in_apple_charts,
  SAFE_CAST(in_deezer_playlists AS INT64) AS in_deezer_playlists,
  in_deezer_charts,
  SAFE_CAST(in_shazam_charts AS INT64) AS in_shazam_charts
FROM
  final_data;