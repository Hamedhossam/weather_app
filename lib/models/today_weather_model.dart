class TodayWeatherModel {
  String? country;
  String? town;
  String? city;
  String? condition;
  double? temperature;
  String? date;
  String? sunriseTime;
  String? moonRiseTime;
  int humidity;
  double? windSpeed;

  TodayWeatherModel({
    required this.city,
    required this.condition,
    required this.country,
    required this.date,
    required this.humidity,
    required this.moonRiseTime,
    required this.sunriseTime,
    required this.temperature,
    required this.town,
    required this.windSpeed,
  });

  factory TodayWeatherModel.fromJson(Map<String, dynamic> json) {
    return TodayWeatherModel(
      city: json["location"]["region"],
      condition: json["current"]["condition"]["text"],
      country: json["location"]["country"],
      date: json["forecast"]["forecastday"][0]["date"],
      humidity: json["current"]["humidity"],
      moonRiseTime: json["forecast"]["forecastday"][0]["astro"]["moonrise"],
      sunriseTime: json["forecast"]["forecastday"][0]["astro"]["sunrise"],
      temperature: json["current"]["temp_c"],
      town: json["location"]["region"],
      windSpeed: json["current"]["wind_kph"],
    );
  }
}
