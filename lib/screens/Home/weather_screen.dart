import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app/blocs/weather_bloc/weather_status.dart';
import 'package:weather_app/modals/Weather.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherStatus>(
      builder: (context, state) {
        Weather weather = state.weather;

        return Column(
          children: <Widget>[
            Text('Temperature: ${(weather.temperature - 273).round()}'),
            Text('Max temperature: ${(weather.temperatureMax - 273).round()}'),
            Text('Min temperature: ${(weather.temperatureMin - 273).round()}'),
            FlatButton(
              child: Text(
                'Search More',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              onPressed: () {
                WeatherEvent event = WeatherEvent(
                    cityName: null, eventType: EventType.SearchWeather);
                context.bloc<WeatherBloc>().add(event);
              },
            )
          ],
        );
      },
    );
  }
}
