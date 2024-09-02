import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallWeatherCard extends StatelessWidget {
  String title;
  String image;
  String time;

  SmallWeatherCard({
    required this.time,
    required this.image,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * .45,
      height: MediaQuery.sizeOf(context).height * .110,
      decoration: BoxDecoration(
        color: Color.fromARGB(216, 44, 44, 44),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 22, color: Color.fromARGB(255, 168, 166, 166)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                image,
                height: 50,
                width: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
