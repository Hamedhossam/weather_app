import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather/widgets/customized_app_bar.dart';

class SearchingWeatherView extends StatelessWidget {
  const SearchingWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const CustomizedAppBar(),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.80,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: MediaQuery.sizeOf(context).width * .92,
              height: MediaQuery.sizeOf(context).height * .55,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 39, 39),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Column(children: [
                  LottieBuilder.asset("assets/lottie/search.json"),
                  const Text(
                    "Searching....",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 60),
          ]),
        ),
      ),
    );
  }
}
