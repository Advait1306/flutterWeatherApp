enum EventType { GetWeather, SearchWeather}

class WeatherEvent {
  EventType eventType;
  String cityName;

  WeatherEvent({this.eventType, this.cityName});
}
