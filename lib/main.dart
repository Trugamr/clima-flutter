import 'package:flutter/material.dart';

import './screens/loading_screen.dart';

import 'constants.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: kTextColor),
        ),
      ),
      home: LoadingScreen(),
    ),
  );
}
