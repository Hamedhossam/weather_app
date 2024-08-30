import 'package:flutter/material.dart';
import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/widgets/small_weather_card.dart';

class TodayWeatherWidget extends StatelessWidget {
  TodayWeatherModel todayWeatherModel;
  TodayWeatherWidget({
    required this.todayWeatherModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.64,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            todayWeatherModel.country!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                todayWeatherModel.town!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '- ${todayWeatherModel.city}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * .92,
                height: MediaQuery.sizeOf(context).height * .25,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 39, 39, 39),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${todayWeatherModel.temperature!.toInt().ceil()}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 90,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todayWeatherModel.condition!.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                todayWeatherModel.date!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/Icons/sun.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/Icons/windy.png',
                                height: 50,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Image.asset(
                'assets/Icons/weather.png',
                height: 140,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallWeatherCard(
                time: todayWeatherModel.sunriseTime!,
                image: 'assets/Icons/sunRise.png',
                title: 'Sun Rise',
              ),
              SmallWeatherCard(
                time: todayWeatherModel.moonRiseTime!,
                image: 'assets/Icons/moonSet.png',
                title: 'Moon Rise',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallWeatherCard(
                time: '${todayWeatherModel.humidity.toString()} %',
                image: 'assets/Icons/humadity.png',
                title: 'Humidity',
              ),
              SmallWeatherCard(
                time: '${todayWeatherModel.windSpeed.toString()}km/h',
                image: 'assets/Icons/windy.png',
                title: 'Wind',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
