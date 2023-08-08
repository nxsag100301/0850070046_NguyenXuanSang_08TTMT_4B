import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState(cityName: '', temperature: 0.0, weatherCondition: ''));

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield* _mapFetchWeatherToState(event);
    }
  }

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }


  Stream<WeatherState> _mapFetchWeatherToState(FetchWeather event) async* {
    final apiKey = 'af4c9418cbbcfdde3ab97fcf4303bdda';
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=${event.cityName}&appid=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final cityName = jsonData['name'];
      final temperature = jsonData['main']['temp'];
      final weatherCondition = jsonData['weather'][0]['description'];
      final temperatureCelsius = kelvinToCelsius(temperature); // Chuyển đổi sang Celsius

      yield WeatherState(
        cityName: cityName,
        temperature: temperatureCelsius,
        weatherCondition: weatherCondition,
      );
    } else {
      yield WeatherState(
        cityName: 'Error',
        temperature: 0.0,
        weatherCondition: 'Unable to fetch weather data',
      );
    }
  }
}
