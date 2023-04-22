import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/globalController.dart';
import 'package:weather_app/widgets/headerWidget.dart';

import '../widgets/currentWeatherWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const HeaderWidget(),
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
