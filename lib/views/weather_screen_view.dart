import 'package:flutter/material.dart';
import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/widgets/customized_app_bar.dart';
import 'package:my_weather/widgets/forecast_weather.dart';
import 'package:my_weather/widgets/today_weather.dart';

class WeatherScreenView extends StatelessWidget {
  WeatherScreenView({
    super.key,
    required this.todayWeatherModel,
  });

  TodayWeatherModel todayWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const CustomizedAppBar(),
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: TodayWeatherWidget(todayWeatherModel: todayWeatherModel)),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          const SliverToBoxAdapter(child: ForecastWeatherWidget()),
        ],
      ),
    );
  }
}
