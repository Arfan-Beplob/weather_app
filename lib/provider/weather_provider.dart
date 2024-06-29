import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/model/forecast_weather.dart';
import 'package:weather_app/utils/constsnts.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier{
CurrentWeather? currentWeather;
ForecastWeather? forecastWeather;
String unit = metric;
double latitude = 23.80,longtitude = 90.425;
final String baseUrl= 'https://api.openweathermap.org/data/2.5/';

bool get hasDataLoaded => currentWeather !=null && forecastWeather !=null;

Future<void> getData ()async {
  await _getCurrentData();
  await _getForecastData();
}

Future<void> _getCurrentData() async {
  try {
    final endUrl = 'weather?lat=$latitude&lon=$longtitude&appid=$weatherApiKey&units=$unit';
    final url = Uri.parse('$baseUrl$endUrl');
    final  response = await http.get(url);
    final json = jsonDecode(response.body) as Map <String,dynamic> ;

    if (response.statusCode == 200){
      currentWeather =CurrentWeather.fromJson(json);
      notifyListeners();
    }else{
      print(json['massege']);
    }
  }catch(error){
    print(error.toString());
  }
}
Future<void> _getForecastData() async {
  final endUrl = 'forecast?lat=$latitude&lon=$longtitude&appid=$weatherApiKey&units=$unit';
  final url = Uri.parse('$baseUrl$endUrl');
  try {
    final  response = await http.get(url);
    final json = jsonDecode(response.body) as Map <String,dynamic> ;

    if (response.statusCode == 200){
      forecastWeather =ForecastWeather.fromJson(json);
      notifyListeners();
    }else{
      print(json['massage']);
    }
  }catch(error){
    print(error.toString());
  }
}

}