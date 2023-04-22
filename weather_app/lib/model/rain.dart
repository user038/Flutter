class Rain {
  double? oneHour;

  Rain({this.oneHour});

  Rain.fromJson(Map<String, dynamic> map) : oneHour = map["oneHour"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oneHour'] = oneHour;
    return data;
  }
}
