import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/globalController.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  @override
  void initState() {
    getLocationName(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getLocationName(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    setState(() {
      city = place.locality!;
    });
    //print(placeMark);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30, 50, 0, 0),
          child: Text(
            city,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(35, 0, 0, 0),
          child: Text(
            DateFormat.yMMMd().format(DateTime.now()),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
