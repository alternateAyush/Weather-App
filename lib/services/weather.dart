import 'package:weatherapk2/utilities/constants.dart';
import 'networking.dart';
import 'location.dart';

class WeatherModel {
  Future<dynamic> getCityData(String cityName) async {
    Networking cityWeather =
        Networking('$kOWMurl?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await cityWeather.getData();
    return weatherData;
  }

  Future<dynamic> getLocateData() async {
    GeoLocation MyLocation = GeoLocation();
    await MyLocation.getCurrLocation();
    Networking Weather = Networking(
        '$kOWMurl?lat=${MyLocation.latitude}&lon=${MyLocation.longitude}&appid=$kApiKey&units=metric');
    var weatherData = await Weather.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
