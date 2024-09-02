import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/services/weather_service.dart';

class WeatherRepository {
  final WeatherService weatherService;

  WeatherRepository({required this.weatherService});
  getTodayWeather(String cityName) async {
    final todayWeatherModel =
        await weatherService.getTodayWeather(cityName: cityName);
    return todayWeatherModel;
  }
}
