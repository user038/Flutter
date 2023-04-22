class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJsonMap(json['current']));
}

class Current {
  double? temp;
  int? humidity;
  int? clouds;
  double? windSpeed;
  List<Weather> weather;

  Current.fromJsonMap(Map<String, dynamic> map)
      : temp = map["temp"],
        humidity = map["humidity"],
        clouds = map["clouds"],
        windSpeed = map["windSpeed"],
        weather = List<Weather>.from(
            map["weather"].map((it) => Weather.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['clouds'] = clouds;
    data['windSpeed'] = windSpeed;
    data['weather'] = weather.map((v) => v.toJson()).toList();
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        main = map["main"],
        description = map["description"],
        icon = map["icon"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
