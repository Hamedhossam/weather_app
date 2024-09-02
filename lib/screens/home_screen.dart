import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/cubit/weather_cubit/weather_cubit.dart';
import 'package:my_weather/cubit/weather_cubit/weather_states.dart';
import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/views/no_data_found.dart';
import 'package:my_weather/views/searching_weather_view.dart';
import 'package:my_weather/views/weather_screen_view.dart';
import 'package:my_weather/widgets/customized_app_bar.dart';
import 'package:my_weather/widgets/forecast_weather.dart';
import 'package:my_weather/widgets/today_weather.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String cityName;
  TodayWeatherModel? todayWeatherModel;

  HomeScreen({
    required this.todayWeatherModel,
    required this.cityName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const SearchingWeatherView();
            } else if (state is WeatherLoading) {
              return const SearchingWeatherView();
            } else if (state is WeatherLoaded) {
              if (state.todayWeatherModel == null) {
                return const NoDataFoundView();
              } else {
                return WeatherScreenView(todayWeatherModel: todayWeatherModel!);
              }
            } else if (state is WeatherFailure) {
              return const Center(child: Text("Failed to load weather."));
            } else {
              return const Center(child: Text("unknown to load weather."));
            }
          },
        ));
  }
}
/*  if (state is WeatherInitial) {
              return const SearchingWeatherView();
            }
            if (state is WeatherLoaded) {
              if (state.todayWeatherModel == null) {
                return const NoDataFoundView();
              } else {
                return WeatherScreenView(todayWeatherModel: todayWeatherModel!);
              }
            } else {
              return const SearchingWeatherView();
            }*/






/*(todayWeatherModel == null)
          ? NoDataFoundView()
          : WeatherScreenView(todayWeatherModel: todayWeatherModel),*/





/*BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            todayWeatherModel = state.todayWeatherModel;
            if (todayWeatherModel == null) {
              return const NoDataFoundView();
            } else {
              return WeatherScreenView(
                  todayWeatherModel: (state.todayWeatherModel));
            }
          } else {
            return const SearchingWeatherView();
          }
        },
      ),*/