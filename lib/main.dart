import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/cubit/weather_cubit/weather_cubit.dart';
import 'package:my_weather/screens/search_weather_screen.dart';
import 'package:my_weather/screens/welcome_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        routes: {
          "start": (context) => const WelcomeScreen(),
          // "home": (context) => HomeScreen(),
          "search": (context) => const SearchWeatherScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
      ),
    );
  }
}
