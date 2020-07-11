import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/modals/Weather.dart';

class WeatherService {
  final String apiKey = "227f116bb3a8f3bd4ff60fd712dce6eb";
  final String baseUrl = "http://api.openweathermap.org/data/2.5/weather?";

  Future<Weather> getWeatherWithCityName(String cityName) async {
    final String url = '${baseUrl}q=$cityName&appid=$apiKey';
    final result = await http.Client().get(url);
    print(result.body);

    if (result.statusCode != 200) {
      print('Error');
    }
    final jsonDecoded = json.decode(result.body);
    final jsonWeather = jsonDecoded['main'];

    return Weather.fromJson(jsonWeather);
  }
}
