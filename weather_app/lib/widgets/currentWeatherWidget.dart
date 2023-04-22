import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data_current.dart';

class CurrentWeatherWidget extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //IconWidget(),
        Container(
          margin: const EdgeInsets.fromLTRB(34, 10, 0, 0),
          child: Text(
            '${widget.weatherDataCurrent.current.temp!.round()}°C',
            style: const TextStyle(fontSize: 19),
          ),
        )
      ],
    );
  }
}
