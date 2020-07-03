import 'package:flutter/material.dart';

import './screens/loading_screen.dart';
import './screens/city_screen.dart';
import './screens/location_screen.dart';

import 'constants.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      initialRoute: '/location',
      routes: {
        '/loading': (context) => LoadingScreen(),
        '/city': (context) => CityScreen(),
        '/location': (context) => LocationScreen(),
      },
    ),
  );
}
