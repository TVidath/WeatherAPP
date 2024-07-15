import 'package:clima/location.dart';
import 'networking.dart';

const APIKEY ='8aab889e81ae729f560c3dd1c917c83f';

class WeatherModel {
  
  Future<dynamic> getcityweather(String cityname) async{
    var url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$APIKEY&units=metric';
    Networkhelper networkhelper = Networkhelper(url);

    var weatherdata =await networkhelper.getData();
    return weatherdata;
}


  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    Networkhelper networkhelper = Networkhelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$APIKEY&units=metric');

    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}