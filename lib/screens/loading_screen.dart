import 'package:flutter/material.dart';

import '../services/location.dart';
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String text = 'Position Here';
  double latitude, longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    setState(() {
      text =
          location.latitude.toString() + ' , ' + location.longitude.toString();
    });
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'http://tru-weather-api.herokuapp.com/weather?latitude=$latitude&longitude=$longitude');
    var weatherData = await networkHelper.getData();

    Navigator.pushNamed(context, '/location', arguments: {
      "weatherData": weatherData,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
