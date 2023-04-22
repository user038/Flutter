import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/api/apiKey.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/model/weather_data_current.dart';

class FetchWeatherData {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiKey(lat, lon)));
    //print(apiKey(lat, lon));
    var jsonString = jsonDecode(response.body.toString());
    //print(jsonString);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
    print(weatherData?.getCurrentWeather().current.temp?.round());
    return weatherData!;
  }
}

String apiKey(lat, lon) {
  String url;
  url =
      'http://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&AppId=$api_key&units=metric&exclude=minutely';
  return url;
}
