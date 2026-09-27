predict_flight_delay <- function(month, day, day_of_week, airline, departure_hour, distance, origin_delay_rate, destination_delay_rate) {

  new_flight <- data.frame(
    MONTH = month,
    DAY = day,
    DAY_OF_WEEK = day_of_week,
    AIRLINE = factor(airline, levels = c('AA','AS','B6','DL','EV','F9','HA','MQ','NK','OO','UA','US','VX','WN')),
    Departure_Hour = departure_hour,
    DISTANCE = distance,
    Origin_Delay_Rate = origin_delay_rate,
    Destination_Delay_Rate = destination_delay_rate
  )

  probability <- predict(rf_enhanced, newdata = new_flight, type = 'prob')[, '1']

  prediction <- ifelse(probability >= 0.3, 'Delayed', 'Not Delayed')

  return(list(Prediction = prediction, Delay_Probability = probability))
}
