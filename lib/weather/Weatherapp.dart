import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Stack(children: [Image.asset("assets/images/cloud-in-blue-sky.jpg")]),
    );
  }
}
