import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';

class CommonStyle {
  buttonTextStyle() => const TextStyle(
        fontFamily: AppDetails.rubik_bold,
        fontSize: 16.0,
        color: Colors.white,
      );

  deSelectButtonTextStyle() => const TextStyle(
    fontFamily: AppDetails.rubik_bold,
    fontSize: 16.0,
    color: Colors.black,
  );


  forgotPasswordStyle() => const TextStyle(
        fontSize: 16.0,
        fontFamily: AppDetails.rubik_regular,
      );

  buttonLableStyle({required String textColor}) => TextStyle(
        fontFamily: AppDetails.rubik_bold,
        fontSize: 9,
        color: HexColor(textColor),
      );

  titleLabelStyle() => const TextStyle(
        fontFamily: AppDetails.rubik_bold,
        color: Colors.white,
        fontSize: 20,
      );

  subtitleLabelStyle() => TextStyle(
        fontFamily: AppDetails.rubik_medium,
        fontSize: 14.0,
        color: HexColor(CommonColor.subTitleColor),
      );

  floatingActionButtonStyles() => const TextStyle(
        fontFamily: AppDetails.rubik_bold,
        fontSize: 14.0,
        color: Colors.black,
      );

  pageTitleStyle() => const TextStyle(
        fontSize: 36,
        fontFamily: AppDetails.rubik_bold,
        color: Colors.black,
      );

  drawerTitleStyle() => const TextStyle(
        fontFamily: AppDetails.rubik_bold,
        fontSize: 24.0,
        color: Colors.black,
      );

  drawerSubTitleStyle() => TextStyle(
      fontSize: 14,
      fontFamily: AppDetails.rubik_medium,
      color: HexColor(CommonColor.hintColor));

  drawerMenuStyle() => const TextStyle(
        fontFamily: AppDetails.rubik_bold,
        fontSize: 18.0,
        color: Colors.black,
      );

  labelStyle() => TextStyle(
        fontFamily: AppDetails.rubik_bold,
        fontSize: 12.0,
        color: HexColor(CommonColor.hintColor),
      );

  labelValueStyle() => TextStyle(
    fontFamily: AppDetails.rubik_medium,
    fontSize: 14.0,
    color: HexColor(CommonColor.appColor),
  );
}
