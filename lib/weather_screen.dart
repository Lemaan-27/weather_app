import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/addition_info_item.dart';
import 'package:weather_app/hourly_weather_forecast.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Refresh');
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Card
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Text(
                            '300K',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Icon(Icons.cloud, size: 64),
                          SizedBox(height: 8),
                          Text('Rain', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Weather forecast
            const Text(
              'Weather Forecast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForeCastItem(
                    time: '09:00',
                    icon: Icons.cloud,
                    temp: '301.17',
                  ),
                  HourlyForeCastItem(
                    time: '12:00',
                    icon: Icons.sunny,
                    temp: '301.54',
                  ),
                  HourlyForeCastItem(
                    time: '15:00',
                    icon: Icons.cloud,
                    temp: '301.11',
                  ),
                  HourlyForeCastItem(
                    time: '18:00',
                    icon: Icons.sunny,
                    temp: '300.79',
                  ),
                  HourlyForeCastItem(
                    time: '21:00',
                    icon: Icons.cloud,
                    temp: '300.45',
                  ),
                ],
              ),
            ),
            // const Placeholder(fallbackHeight: 100),
            const SizedBox(height: 12),
            const Text(
              'Additional Infomation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  lable: 'Humidity',
                  value: '94',
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  lable: 'Wind Speed',
                  value: '7.67',
                ),
                AdditionalInfoItem(
                  icon: Icons.speed,
                  lable: 'Pressure',
                  value: '1006',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
