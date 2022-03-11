import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mybos_app/screen/dashboard/ui/dashboard.dart';
import 'package:mybos_app/screen/login/ui/loginscreen.dart';
import 'package:mybos_app/screen/profile/ui/profilescreen.dart';

gotoDashboardScreen(BuildContext context) {
  Get.to(DashboardPage(0));
}

gotoProfileScreen(BuildContext context){
  Get.to( const ProfileScreen());
}


gotoLoginScreen(BuildContext context){
  Get.offAll(LoginScreen());
}
