// ignore_for_file: unused_field

import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxBool _isLoading = true.obs;
  RxDouble _lat = 0.0.obs;
  RxDouble _lon = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble latitude() => _lat;
  RxDouble longitude() => _lon;

  getLoacation() async{
    
  }
}
