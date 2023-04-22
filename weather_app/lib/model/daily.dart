import 'package:weather_app/model/feels_like.dart';
import 'package:weather_app/model/rain.dart';
import 'package:weather_app/model/temp.dart';
import 'package:weather_app/model/weather.dart';

class Daily {
  int dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moon_phase;
  Temp temp;
  Feels_like feels_like;
  int pressure;
  int humidity;
  double dew_point;
  double wind_speed;
  int wind_deg;
  double wind_gust;
  List<Weather> weather;
  int clouds;
  double pop;
  Rain rain;
  double uvi;

  Daily.fromJsonMap(Map<String, dynamic> map)
      : dt = map["dt"],
        sunrise = map["sunrise"],
        sunset = map["sunset"],
        moonrise = map["moonrise"],
        moonset = map["moonset"],
        moon_phase = map["moon_phase"],
        temp = Temp.fromJsonMap(map["temp"]),
        feels_like = Feels_like.fromJsonMap(map["feels_like"]),
        pressure = map["pressure"],
        humidity = map["humidity"],
        dew_point = map["dew_point"],
        wind_speed = map["wind_speed"],
        wind_deg = map["wind_deg"],
        wind_gust = map["wind_gust"],
        weather = List<Weather>.from(
            map["weather"].map((it) => Weather.fromJsonMap(it))),
        clouds = map["clouds"],
        pop = map["pop"],
        rain = map["rain"],
        uvi = map["uvi"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['moonrise'] = moonrise;
    data['moonset'] = moonset;
    data['moon_phase'] = moon_phase;
    data['temp'] = temp == null ? null : temp.toJson();
    data['feels_like'] = feels_like == null ? null : feels_like.toJson();
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dew_point;
    data['wind_speed'] = wind_speed;
    data['wind_deg'] = wind_deg;
    data['wind_gust'] = wind_gust;
    data['weather'] =
        weather != null ? this.weather.map((v) => v.toJson()).toList() : null;
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    data['uvi'] = uvi;
    return data;
  }
}
