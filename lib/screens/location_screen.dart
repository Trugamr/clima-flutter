import 'package:clima/constants.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.data});
  final data;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String location;
  String fullLocation;
  int currentTemp;
  String summary;
  String smallSummary;
  String tempLow;
  String tempHigh;
  String precipProbability;
  String windSpeed;
  DateTime date;
  String formattedDate;

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      updateUI(widget.data);
    } else {
      print('No data receieved');
    }
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      location = weatherData['text'];
      fullLocation = weatherData['placeName'];
      currentTemp = weatherData['currently']['temperature'].round();
      summary = weatherData['forecast'];
      smallSummary = weatherData['currently']['summary'];
      tempLow =
          weatherData['daily']['data'][0]['temperatureLow'].round().toString();
      tempHigh =
          weatherData['daily']['data'][0]['temperatureHigh'].round().toString();
      precipProbability =
          (weatherData['currently']['precipProbability'] * 100).toString();
      windSpeed = weatherData['currently']['windSpeed'].toStringAsFixed(1);

      if (fullLocation != null) {
        List temp = fullLocation.split(',');
        temp.removeAt(0);
        fullLocation = temp.join(',').trim();
      }

      date = new DateTime.fromMillisecondsSinceEpoch(
          weatherData['currently']['time'] * 1000);
      formattedDate = new DateFormat('EEEE - MMMM d').format(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                var weatherData = await Weather().getLocationWeather();

                updateUI(weatherData);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.refresh,
                  color: kTextColor,
                  size: 32.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CityScreen(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.search,
                  color: kTextColor,
                  size: 32.0,
                ),
              ),
            )
          ],
        ),
      ),
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
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
