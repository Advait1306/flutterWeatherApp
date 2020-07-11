import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_status.dart';
import 'package:weather_app/screens/Home/loading_screen.dart';
import 'package:weather_app/screens/Home/search_state_home_screen.dart';
import 'package:weather_app/screens/Home/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Weather app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {},
          )
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherStatus>(
        builder: (context, state) {
          if (state.statusType == StatusType.notSearched) {
            return SearchStateHomeScreen();
          }
          if (state.statusType == StatusType.loading) {
            return LoadingScreen();
          }
          if (state.statusType == StatusType.loaded) {
            return WeatherScreen();
          }
          return Container();
        },
      ),
    );
  }
}
