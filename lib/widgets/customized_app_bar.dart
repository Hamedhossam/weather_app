import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 168, 168, 168))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Text(
            '  Searh For Another City 🌎',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
