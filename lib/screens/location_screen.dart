import 'package:clima/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    Map weatherData = {};

    try {
      if (args != null) {
        weatherData = args['weatherData'];
      }
    } catch (e) {
      print(e);
    }

    String location = weatherData['text'];
    String fullLocation = weatherData['placeName'];
    int currentTemp = weatherData['currently']['temperature'].round();
    String summary = weatherData['forecast'];
    String smallSummary = weatherData['currently']['summary'];
    String tempLow =
        weatherData['daily']['data'][0]['temperatureLow'].round().toString();
    String tempHigh =
        weatherData['daily']['data'][0]['temperatureHigh'].round().toString();
    String precipProbability =
        (weatherData['currently']['precipProbability'] * 100).toString();
    String windSpeed = weatherData['currently']['windSpeed'].toStringAsFixed(1);

    if (fullLocation != null) {
      List temp = fullLocation.split(',');
      temp.removeAt(0);
      fullLocation = temp.join().trim();
    }

    DateTime date = new DateTime.fromMillisecondsSinceEpoch(
        weatherData['currently']['time'] * 1000);

    String formattedDate = new DateFormat('EEEE - MMMM d').format(date);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // location
              Text(
                location,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
              Text(
                fullLocation,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // date
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              // current temp
              Row(
                textBaseline: TextBaseline.ideographic,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentTemp.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 170.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    '°',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 110.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              // status & min - max temp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    smallSummary,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '$tempLow° - $tempHigh°',
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
                    'Wind: ${windSpeed}km/h',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    'Precipitation: $precipProbability%',
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
                summary,
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
