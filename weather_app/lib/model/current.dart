import 'package:weather_app/model/feels_like.dart';
import 'package:weather_app/model/weather.dart';

class Current {
  int dt;
  int sunrise;
  int sunset;
  double temp;
  Feels_like feels_like;
  int pressure;
  int humidity;
  double dew_point;
  int uvi;
  int clouds;
  int visibility;
  double wind_speed;
  int wind_deg;
  double wind_gust;
  List<Weather> weather;

  Current.fromJsonMap(Map<String, dynamic> map)
      : dt = map["dt"],
        sunrise = map["sunrise"],
        sunset = map["sunset"],
        temp = map["temp"],
        feels_like = map["feels_like"],
        pressure = map["pressure"],
        humidity = map["humidity"],
        dew_point = map["dew_point"],
        uvi = map["uvi"],
        clouds = map["clouds"],
        visibility = map["visibility"],
        wind_speed = map["wind_speed"],
        wind_deg = map["wind_deg"],
        wind_gust = map["wind_gust"],
        weather = List<Weather>.from(
            map["weather"].map((it) => Weather.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feels_like'] = feels_like;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dew_point;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = wind_speed;
    data['wind_deg'] = wind_deg;
    data['wind_gust'] = wind_gust;
    data['weather'] =
        weather != null ? this.weather.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
