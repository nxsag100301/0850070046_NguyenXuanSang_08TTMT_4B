import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: WeatherPage(),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City Name'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final cityName = cityController.text;
                weatherBloc.add(FetchWeather(cityName));
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20.0),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state.cityName.isEmpty) {
                  return Text('Enter a city name to get weather data');
                } else if (state.cityName == 'Error') {
                  return Text('Error: ${state.weatherCondition}');
                } else {
                  return Column(
                    children: [
                      Text('City: ${state.cityName}'),
                      Text('Temperature: ${state.temperature}°C'),
                      Text('Weather Condition: ${state.weatherCondition}'),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
