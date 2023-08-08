import 'package:equatable/equatable.dart';

class WeatherState extends Equatable {
  final String cityName;
  final double temperature;
  final String weatherCondition;

  WeatherState({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
  });

  @override
  List<Object?> get props => [cityName, temperature, weatherCondition];
}
