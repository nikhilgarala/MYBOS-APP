import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_style.dart';
import 'package:mybos_app/common/texts.dart';

class MoreScreen extends StatefulWidget {
  Function callback;

  MoreScreen(this.callback);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  late double screenHeight, screenWidth;

  List menuList = [
    Texts.cases,
    Texts.inspections,
    Texts.residents,
    Texts.contractors,
    Texts.library,
    Texts.calendar,
    Texts.broadcast,
    Texts.key,
    Texts.assets,
    Texts.messages
  ];

  List menuImageList = [
    CommonImage.casesIcon,
    CommonImage.inspectionIcon,
    CommonImage.residentsIcon,
    CommonImage.contractorIcon,
    CommonImage.libraryIcon,
    CommonImage.calenderIcon,
    CommonImage.broadcastIcon,
    CommonImage.keyIcon,
    CommonImage.casesIcons,
    CommonImage.messageIcons,
  ];

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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: (screenHeight * 0.09).ceilToDouble(),
          ),
          moreLabel(),
          SizedBox(
            height: (screenHeight * 0.05).ceilToDouble(),
          ),
          menuItems(),
        ],
      ),
    );
  }

  Expanded menuItems() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 106,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0),
        itemCount: menuList.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              height: 106,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      menuImageList[index].toString(),
                      height: 24,
                      fit: BoxFit.fill,
                      width: 24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                      menuList[index].toString(),
                      style: const TextStyle(
                        fontFamily: AppDetails.rubik_bold,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Text moreLabel() {
    return Text(
      Texts.moreOptions,
      style: CommonStyle().pageTitleStyle(),
    );
  }
}
