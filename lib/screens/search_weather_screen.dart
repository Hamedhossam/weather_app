import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather/models/today_weather_model.dart';
import 'package:my_weather/screens/home_screen.dart';
import 'package:my_weather/services/weather_service.dart';

class SearchWeatherScreen extends StatelessWidget {
  const SearchWeatherScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LottieBuilder.asset(
              "assets/lottie/planet.json",
              height: 300,
            ),
            const SearchingTextField(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class SearchingTextField extends StatefulWidget {
  const SearchingTextField({
    super.key,
  });

  @override
  State<SearchingTextField> createState() => _SearchingTextFieldState();
}

class _SearchingTextFieldState extends State<SearchingTextField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  String cityName = 'tanta';
  TodayWeatherModel? todayWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter City Name';
                }
                return null; // Return null if the input is valid
              },
              style: const TextStyle(color: Colors.white, fontSize: 22),
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.search, color: Colors.white, size: 25),
                hintText: "Search For Cities Over All World",
                hintStyle: const TextStyle(color: Colors.white, fontSize: 22),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 39, 73, 131), width: 5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 195, 11, 11), width: 2.0),
                ),
                contentPadding: const EdgeInsets.all(15.0),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  cityName = _controller.text;

                  todayWeatherModel = await WeatherService()
                      .getTodayWeather(cityName: cityName);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(
                            todayWeatherModel: todayWeatherModel!);
                      },
                    ),
                  );
                  //
                } else {
                  ////
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Valid input:error'),
                    ),
                  );
                }
              },
              label: const Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 10, 25, 39),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
