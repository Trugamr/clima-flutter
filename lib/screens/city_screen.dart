import 'package:flutter/material.dart';
import 'package:clima/constants.dart';

class CityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () async {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.arrow_back,
                  color: kTextColor,
                  size: 32.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Theme(
              data: ThemeData().copyWith(),
              child: TextField(
                onChanged: (val) => print(val),
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 18.0,
                ),
                cursorRadius: Radius.zero,
                cursorColor: kTextColor,
                decoration: InputDecoration(
                  hintText: 'Enter City Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  icon: Icon(
                    Icons.location_city,
                    color: kTextColor,
                    size: 40.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Container(
              width: double.infinity,
              height: 45.0,
              child: RaisedButton(
                onPressed: () {},
                color: kTextColor,
                child: Text('GET WEATHER'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
