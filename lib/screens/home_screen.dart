import 'package:flutter/material.dart';
import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/widgets/customized_app_bar.dart';
import 'package:my_weather/widgets/forecast_weather.dart';
import 'package:my_weather/widgets/small_weather_card.dart';
import 'package:my_weather/widgets/today_weather.dart';

class HomeScreen extends StatelessWidget {
  TodayWeatherModel todayWeatherModel;
  HomeScreen({
    required this.todayWeatherModel,
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
      child: HomeScreenView(todayWeatherModel: todayWeatherModel),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  HomeScreenView({
    super.key,
    required this.todayWeatherModel,
  });

  TodayWeatherModel? todayWeatherModel;

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
              child: TodayWeatherWidget(todayWeatherModel: todayWeatherModel!)),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          const SliverToBoxAdapter(child: ForecastWeatherWidget()),
        ],
      ),
    );
  }
}
