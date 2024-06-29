import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/utils/constsnts.dart';
import 'package:weather_app/utils/helper_function.dart';

get hederCard async {
 await  _hederCard();
}

 _hederCard() {
  return  Consumer<WeatherProvider>(
    builder: (context, provider, child) {
    return Card(
      color: Colors.blueAccent,
      child: Column(
        children: [
          Text(
            '${provider.currentWeather!.sys!.country}${provider.currentWeather!.name}',
            style:  TextStyle(
                fontSize: 80
            ),
          ),

          Text(
            '${provider.currentWeather!.main!.temp!.toStringAsFixed(0)}$degree$celsius',
            style:  TextStyle(
                fontSize: 80
            ),
          ),
        ],
      ),
    );
    },

  );
}