import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import '../castm_widget.dart';
import '../utils/constsnts.dart';
import '../utils/helper_function.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {

  @override
  void didChangeDependencies() {
    Provider.of<WeatherProvider>(context, listen: false).getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('WeatherHome'),
      ),
      body:
      Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          return provider.hasDataLoaded
              ?Column(
                children: [
            Card(
            color: Colors.blueAccent,
            child: Column(
              children: [
                Text(
                  '${provider.currentWeather!.sys!.country}${provider.currentWeather!.name}',
                  style:  const TextStyle(
                      fontSize: 80
                  ),
                ),
                Text(getFormatDateTime(provider.currentWeather!.dt!)),

                Text(
                  '${provider.currentWeather!.main!.temp!.toStringAsFixed(0)}$degree$celsius',
                  style:  const TextStyle(
                      fontSize: 80
                  ),
                ),
              ],
            ),
          ),
                ],
              )
              :  const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
