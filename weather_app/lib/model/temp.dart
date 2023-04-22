
class Temp {

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

	Temp.fromJsonMap(Map<String, dynamic> map): 
		day = map["day"],
		min = map["min"],
		max = map["max"],
		night = map["night"],
		eve = map["eve"],
		morn = map["morn"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['day'] = day;
		data['min'] = min;
		data['max'] = max;
		data['night'] = night;
		data['eve'] = eve;
		data['morn'] = morn;
		return data;
	}
}
