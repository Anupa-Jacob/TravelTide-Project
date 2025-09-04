-- TravelTide_cleaned_cohort_selection.sql
-- This SQL query is designed to analyze user behavior and trip data from a travel booking platform
-- The query focuses on users who have had more than 7 sessions since January 5, 2023


# Using CTE to filter the sessions first and then joining session data with user, flight, and hotel information. The output was sorted by user ID and stored as a DataFrame for further processing.


WITH sessions_2023 AS (
  SELECT *
  FROM sessions
  WHERE session_start > '2023-01-04'
),


selected_sessions AS (
  SELECT
    s.session_id, s.user_id, s.trip_id, s.session_start, s.session_end, s.page_clicks,
    s.flight_discount, s.flight_discount_amount, s.hotel_discount, s.hotel_discount_amount,
    s.flight_booked, s.hotel_booked, s.cancellation,
    u.birthdate, u.gender, u.married, u.has_children, u.home_country, u.home_city,
    u.home_airport, u.home_airport_lat, u.home_airport_lon, u.sign_up_date,
    f.origin_airport, f.destination, f.destination_airport, f.seats, f.return_flight_booked,
    f.departure_time, f.return_time, f.checked_bags, f.trip_airline,
    f.destination_airport_lat, f.destination_airport_lon, f.base_fare_usd,
    h.hotel_name, h.nights, h.rooms, h.check_in_time, h.check_out_time,
    h.hotel_per_room_usd AS hotel_price_per_room_night_usd
  FROM sessions_2023 s
  LEFT JOIN users u ON s.user_id = u.user_id
  LEFT JOIN flights f ON s.trip_id = f.trip_id
  LEFT JOIN hotels h ON s.trip_id = h.trip_id

  WHERE s.user_id IN (
    SELECT user_id
    FROM sessions_2023
    GROUP BY user_id
    HAVING COUNT(*) > 7
  )
)

SELECT *
FROM selected_sessions
ORDER BY user_id;
"""
df_selected_sessions = pd.read_sql(query, engine)
