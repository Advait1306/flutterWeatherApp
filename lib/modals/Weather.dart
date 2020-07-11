class Weather {
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;

  Weather({this.temperature, this.temperatureMax, this.temperatureMin});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temperature: json['temp'],
        temperatureMax: json['temp_max'],
        temperatureMin: json['temp_min']);
  }
}
