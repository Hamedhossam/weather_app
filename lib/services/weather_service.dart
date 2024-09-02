import 'package:dio/dio.dart';
import 'package:my_weather/models/today_weather_model.dart';

class WeatherService {
  Dio dio = Dio();

  Future<TodayWeatherModel?> getTodayWeather({required String cityName}) async {
    String apiKey = "84237ba2bdce4ea2a7140228242808";
    String api = "https://api.weatherapi.com/v1/forecast.json?key=$apiKey";
    try {
      Response apiResponse = await dio.get('$api&q=$cityName&days=1');
      Map<String, dynamic> response = apiResponse.data;
      TodayWeatherModel todayWeatherModel =
          TodayWeatherModel.fromJson(response);
      return todayWeatherModel;
    } on Exception {
      return null;
    }
  }
}
