import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/cubit/weather_cubit/weather_states.dart';
import 'package:my_weather/data/repository/weather_repository.dart';
import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  getTodayWeather(String cityName) async {
    TodayWeatherModel? todayWeatherModel;

    try {
      emit(WeatherLoading());
      await Future.delayed(Duration(seconds: 2));
      todayWeatherModel =
          await WeatherService().getTodayWeather(cityName: cityName);
      // if (todayWeatherModel == null) {
      //   emit(WeatherFailure());
      // } else {

      emit(WeatherLoaded(todayWeatherModel: todayWeatherModel));
      // }
    } catch (e) {
      emit(WeatherFailure());
    }

    return todayWeatherModel;
  }
}


// class WeatherCubit extends Cubit<WeatherState> {
//   WeatherRepository? weatherRepository;
//   TodayWeatherModel? todayWeatherModel;

//   WeatherCubit(this.weatherRepository) : super(WeatherInitial());

//   TodayWeatherModel? getTodayWeather(String cityName) {
//     weatherRepository?.getTodayWeather(cityName).then((todayWeather) {
//       emit(WeatherLoaded(todayWeatherModel: todayWeather));
//       todayWeatherModel = todayWeather;
//     });
//     return todayWeatherModel;
//   }
// }
