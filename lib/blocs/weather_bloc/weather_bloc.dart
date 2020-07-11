import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/blocs/weather_bloc/weather_status.dart';
import 'package:weather_app/modals/Weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherStatus> {
  static WeatherStatus initialWeather = WeatherStatus(
      statusType: StatusType.notSearched,
      weather: Weather(temperature: 0, temperatureMax: 0, temperatureMin: 0));

  WeatherBloc() : super(initialWeather);

  @override
  Stream<WeatherStatus> mapEventToState(WeatherEvent event) async* {
    switch (event.eventType) {
      case EventType.GetWeather:
        yield WeatherStatus(statusType: StatusType.loading, weather: null);

        Weather result =
            await WeatherService().getWeatherWithCityName(event.cityName);

        WeatherStatus status =
            WeatherStatus(statusType: StatusType.loaded, weather: result);

        yield status;
        break;

      case EventType.SearchWeather:
        WeatherStatus status =
            WeatherStatus(statusType: StatusType.notSearched, weather: null);

        yield status;
        break;
        
      default:
    }
  }
}
