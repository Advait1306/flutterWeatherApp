import 'package:weather_app/modals/Weather.dart';

enum StatusType { notSearched, loading, loaded }

class WeatherStatus {
  final StatusType statusType;
  final Weather weather;

  WeatherStatus({this.statusType, this.weather});
}
