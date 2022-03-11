import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_routing.dart';
import 'package:mybos_app/common/common_textformfield.dart';
import 'package:mybos_app/common/common_widget.dart';
import 'package:mybos_app/common/texts.dart';
import 'package:mybos_app/screen/login/controller/logincontroller.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double screenHeight, screenWidth;
  LoginController loginController =
      Get.put(LoginController(), tag: LoginController().toString());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: HexColor(CommonColor.appBackColor), // Color for Android

        statusBarBrightness:
        Brightness.dark // Dark == white status bar -- for IOS.
    ));
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor(CommonColor.appBackColor),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Text((screenHeight * 0.18).ceilToDouble().toString()),
            SizedBox(
              height: (screenHeight * 0.2).ceilToDouble(),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Image.asset(
                  CommonImage.appLogo,
                  height: 27.85,
                  width: 136.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: (screenHeight * 0.18).ceilToDouble(),
            ),
            Form(
              child: Container(
                margin: const EdgeInsets.only(left: 21.0, right: 19.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      width: screenWidth,
                      child: CommonTextField(
                        textInputType: TextInputType.text,
                        hintText: Texts.userName.toString(),
                        controller: loginController.userNameController,
                        validator: (String? value) {},
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    SizedBox(
                      height: 48,
                      width: screenWidth,
                      child: CommonTextField(
                        textInputType: TextInputType.visiblePassword,
                        hintText: Texts.password.toString(),
                        controller: loginController.passwordController,
                        validator: (String? value) {},
                        isObscureText: true,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    CommonWidget.commonButton(
                      context: context,
                      buttonText: Texts.login,
                      onPress: () => gotoDashboardScreen(context),
                      buttonHeight: 45,
                      buttonWidth: screenWidth,
                    ),
                    const SizedBox(
                      height: 27.0,
                    ),
                    Text(
                      Texts.forgotPassword,
                      style: TextStyle(
                        fontFamily: AppDetails.rubik_regular,
                        color: HexColor(CommonColor.hintColor),
                        fontSize: 16.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
