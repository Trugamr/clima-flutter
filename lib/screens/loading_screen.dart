import 'package:clima/constants.dart';
import 'package:flutter/material.dart';

import "./location_screen.dart";

import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationData() async {
    Map weatherData = await Weather().getLocationWeather();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LocationScreen(data: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 6.0,
            valueColor: AlwaysStoppedAnimation(kTextColor),
          ),
        ),
      ),
    );
  }
}
