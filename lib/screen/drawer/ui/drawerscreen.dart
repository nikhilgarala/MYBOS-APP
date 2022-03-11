import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_routing.dart';
import 'package:mybos_app/common/common_style.dart';
import 'package:mybos_app/common/common_widget.dart';
import 'package:mybos_app/common/texts.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  late double screenHeight, screenWidth;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: HexColor(CommonColor.activeStatusBarColor), // Color for Android
        statusBarBrightness:
        Brightness.light // Dark == white status bar -- for IOS.
    ),);

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Drawer(

        child: Column(
          children: <Widget>[
            Container(
              height: (screenHeight * 0.26).ceilToDouble(),
              width: screenWidth,
              color: HexColor(CommonColor.appBackColor),
            ),
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  'Arch',
                  style: CommonStyle().drawerTitleStyle(),
                ),
                subtitle: Text(
                  'Sydney NSW 2000',
                  style: CommonStyle().drawerSubTitleStyle(),
                ),
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Divider(
                      height: 1,
                      color: HexColor('#EBEBEB'),
                    ),
                  ),
                  CommonWidget().drawerMenu(
                    menuIcon: CommonImage.drawerHomeIcon,
                    menuLabel: Texts.home,
                    onTaps: () {},
                  ),
                  CommonWidget().drawerMenu(
                    menuIcon: CommonImage.drawerProfileIcon,
                    menuLabel: Texts.profile,
                    onTaps: () {
                      Navigator.pop(context);
                      gotoProfileScreen(context);
                    },
                  ),
                  CommonWidget().drawerMenu(
                    menuIcon: CommonImage.drawerKnowledgeIcon,
                    menuLabel: Texts.knowledgeBase,
                    onTaps: () {},
                  ),
                  CommonWidget().drawerMenu(
                    menuIcon: CommonImage.drawerEmailIcon,
                    menuLabel: Texts.emailSupport,
                    onTaps: () {},
                  ),
                  CommonWidget().drawerMenu(
                    menuIcon: CommonImage.drawerFeedbackIcon,
                    menuLabel: Texts.sendFeedback,
                    onTaps: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: Divider(
                      height: 1,
                      color: HexColor('#EBEBEB'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            CommonWidget().drawerLogoutMenu(
                onTaps: () => gotoLoginScreen(context),
                menuLabel: Texts.logout,
                menuIcon: CommonImage.drawerLogoutIcon),
          ],
        ),
      ),
    );
  }
}
