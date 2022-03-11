import 'package:get/get.dart';

class DashboardController extends GetxController{
  bool isFloatingAction = false;
  isFloatingActionUpdate(bool value) {
    isFloatingAction = value;
    update();
  }
}