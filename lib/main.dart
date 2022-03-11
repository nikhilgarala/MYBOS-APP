import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/screen/dashboard/ui/dashboard.dart';
import 'package:mybos_app/screen/login/ui/loginscreen.dart';
import 'package:mybos_app/screen/profile/ui/profilescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: HexColor(CommonColor.activeStatusBarColor), // Color for Android

        statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: HexColor(CommonColor.activeStatusBarColor), // Color for Android

        statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppDetails.appName,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backwardsCompatibility: false, // 1b
          color: Colors.black,

          systemOverlayStyle: SystemUiOverlayStyle.light, // 2
        ),
      ),
      home:  LoginScreen(),
    );
  }
}
