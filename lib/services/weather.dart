import '../services/location.dart';
import '../services/networking.dart';

const BASE_URL = 'http://tru-weather-api.herokuapp.com/weather';

class Weather {
  Future<Map> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude.toString() + ' , ' + location.longitude.toString());

    NetworkHelper networkHelper = NetworkHelper(
        '$BASE_URL?latitude=${location.latitude}&longitude=${location.longitude}');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
