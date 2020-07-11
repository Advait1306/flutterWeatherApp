import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_event.dart';

class SearchStateHomeScreen extends StatelessWidget {
  SearchStateHomeScreen({
    Key key,
  }) : super(key: key);

  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BuildTextField(cityController: cityController),
        SizedBox(
          height: 20.0,
        ),
        BuildButton(cityController: cityController)
      ],
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key key,
    @required this.cityController,
  }) : super(key: key);

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: FlatButton(
          onPressed: () {
            context.bloc<WeatherBloc>().add(WeatherEvent(
                eventType: EventType.GetWeather,
                cityName: cityController.text));
          },
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    Key key,
    @required this.cityController,
  }) : super(key: key);

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: cityController,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Colors.black, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Colors.blue, style: BorderStyle.solid)),
            hintText: "City Name"),
      ),
    );
  }
}
