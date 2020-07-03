import 'package:clima/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    Map weatherData;

    try {
      if (args != null) {
        weatherData = args['weatherData'];
      }
    } catch (e) {
      print(e);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // location
              SizedBox(
                height: 100.0,
              ),
              Text(
                'London',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // date
              Text(
                'Wednesday - 29th May',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),

              // current temp
              Text(
                '13°',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 240.0,
                ),
              ),
              // status & min - max temp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Yes. It\'s Raining',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '11° - 17°',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              // wind speed and precipitation %
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wind: 16km/h',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    'Precipitation: 55%',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Summary',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Container(
                height: 1.4,
                width: double.infinity,
                color: kTextColor,
                margin: EdgeInsets.symmetric(vertical: 10.0),
              ),
              Text(
                'Humid throughout the day. Is\'s currenty 37.45 degrees out. There is a 0.0% chance of rain.',
                style: TextStyle(
                  fontSize: 17.0,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
