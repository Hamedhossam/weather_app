import 'package:my_weather/models/today_weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherFailure extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final TodayWeatherModel? todayWeatherModel;

  WeatherLoaded({required this.todayWeatherModel});
}
