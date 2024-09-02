import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather/screens/search_weather_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              LottieBuilder.asset("assets/lottie/weather.json"),
              const Positioned(
                top: 330,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Welcome To WeatherApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                textAlign: TextAlign.center,
                'You Can Search For The Weather Of Your Town Eaily , And Get Praing Times 🕋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              //Edited
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchWeatherScreen();
                }));
              },
              child: Container(
                margin: const EdgeInsets.all(25.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 168, 168, 168))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        size: 30,
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Searh For Your City 🌎',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
/*onTap: () {
                Navigator.pushNamed(context, "search");
              },*/