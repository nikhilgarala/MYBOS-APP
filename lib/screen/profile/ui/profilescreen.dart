import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_style.dart';
import 'package:mybos_app/common/common_widget.dart';
import 'package:mybos_app/common/texts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late double screenHeight, screenWidth;

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: HexColor(CommonColor.activeStatusBarColor), // Color for Android

        statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
    ));
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor(CommonColor.appBackColor),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text((screenHeight * 0.04).ceilToDouble().toString()),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CommonWidget().appBackButton(
                    buttonIcon: CommonImage.backIcon,
                    onTaps: () => Navigator.pop(context),
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: AppDetails.rubik_bold,
                      color: HexColor(
                        CommonColor.appColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (screenHeight * 0.04).ceilToDouble(),
              ),
              profileLabel(),
              SizedBox(
                height: (screenHeight * 0.03).ceilToDouble(),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 107,
                      width: 107,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Text(
                      'Mike Frank',
                      style: CommonStyle().drawerTitleStyle(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: (screenHeight * 0.04).ceilToDouble(),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 107,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Table(
                      border: TableBorder.symmetric(
                        inside: const BorderSide(width: 0, color: Colors.white),
                      ),
                      // defaultColumnWidth: const FixedColumnWidth(1),
                      children: [
                        labelItem(
                            values: 'mikefrank@gmail.com',
                            key: Texts.emailLabel),
                        labelSecondItem(
                            values: 'Kaylynnbator', key: Texts.userLabel),
                        labelItem(
                            values: '0413 326 941', key: Texts.mobileLabel),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              CommonWidget.commonDeselectButton(
                buttonHeight: 48,
                buttonWidth: double.infinity,
                onPress: () {},
                context: context,
                buttonText: 'Change password',
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow labelItem({required String key, required String values}) {
    return TableRow(
      children: [
        labelKey(keys: key),
        labelValue(values: values),
      ],
    );
  }

  TableRow labelSecondItem({required String key, required String values}) {
    return TableRow(children: [
      labelKey(keys: key),
      labelSecondValue(values: values),
    ]);
  }

  Text labelValue({required String values}) => Text(
        values.toString(),
        style: CommonStyle().labelValueStyle(),
      );

  Text labelSecondValue({required String values}) => Text(
        values.toString(),
        style: TextStyle(
          fontFamily: AppDetails.rubik_medium,
          fontSize: 14.0,
          color: HexColor("#222222"),
        ),
      );

  Text labelKey({required String keys}) => Text(
        keys.toString(),
        style: CommonStyle().labelStyle(),
      );

  Text profileLabel() {
    return Text(
      Texts.myProfile,
      style: CommonStyle().pageTitleStyle(),
    );
  }
}
