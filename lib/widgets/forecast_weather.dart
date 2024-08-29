import 'package:flutter/material.dart';

class ForecastWeather extends StatefulWidget {
  const ForecastWeather({super.key});

  @override
  State<ForecastWeather> createState() => _ForecastWeatherState();
}

class _ForecastWeatherState extends State<ForecastWeather> {
  bool isToday = true;
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                isToday = true;
                setState(() {});
              },
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: (isToday) ? 22 : 20,
                  color: Colors.white,
                  fontWeight: (isToday) ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                isToday = false;
                setState(() {});
              },
              child: Text(
                'Tommorrow',
                style: TextStyle(
                  fontSize: (isToday) ? 20 : 22,
                  color: Colors.white,
                  fontWeight: (isToday) ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                // Navigat To All Days Forecast
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Next 7 Days',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.grey,
                      decorationColor: Colors.grey,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .115 * 1.7,
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                    child: GestureDetector(
                      onTap: () {
                        selected = index;
                        setState(() {});
                      },
                      child: Container(
                        height:
                            MediaQuery.sizeOf(context).height * .115 * 1.7 * .8,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (selected == index)
                              ? Colors.black
                              : const Color.fromARGB(216, 44, 44, 44),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Now',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              "assets/Icons/weather.png",
                              height: 50,
                              width: 50,
                            ),
                            const Text(
                              "26",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  (selected == index)
                      ? const Text(
                          'ــــــ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(''),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
