import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_style.dart';
import 'package:mybos_app/common/common_widget.dart';
import 'package:mybos_app/common/texts.dart';
import 'package:mybos_app/screen/dashboard/controller/dashboardcontroller.dart';
import 'package:mybos_app/screen/dashboard/ui/dashboard_view_model.dart';
import 'package:mybos_app/screen/drawer/ui/drawerscreen.dart';
import 'package:mybos_app/screen/homepage/ui/homepage.dart';
import 'package:mybos_app/screen/more/ui/morescreen.dart';

class DashboardPage extends StatefulWidget {
  int index;

  DashboardPage(this.index);

  int menuIndex = 0;

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  DashBoardPageViewModel? model;
  late double screenHeight, screenWidth;

  final DashboardController _dashBoardScreenController =
      Get.put(DashboardController(), tag: DashboardController().toString());
  bool floatExtended = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor(CommonColor
          .activeStatusBarColor), //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: HexColor(CommonColor.activeStatusBarColor),
        // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: HexColor(CommonColor.activeStatusBarColor),
        // Color for Android

        statusBarBrightness:
            Brightness.light // Dark == white status bar -- for IOS.
        ));
    model ?? (model = DashBoardPageViewModel(this));
    print("runtimeType -> " + runtimeType.toString());
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const DrawerScreen(),
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      // floatingActionButton: GetBuilder<DashboardController>(
      //   init: _dashBoardScreenController,
      //   builder: (_) {
      //     return SpeedDial(
      //       animatedIconTheme:
      //           const IconThemeData(size: 22.0, color: Colors.white),
      //       activeIcon: Icons.add,
      //       icon: Icons.add,
      //       childMargin: const EdgeInsets.only(left: 20),
      //       spaceBetweenChildren: 0.0,
      //       switchLabelPosition: true,
      //       visible: true,
      //       curve: Curves.bounceIn,
      //       overlayColor: Colors.grey.withOpacity(0.9),
      //       overlayOpacity: 0.5,
      //       backgroundColor: Colors.blue,
      //       onOpen: () {
      //         _dashBoardScreenController.isFloatingActionUpdate(true);
      //       },
      //       onClose: () {
      //         _dashBoardScreenController.isFloatingActionUpdate(false);
      //       },
      //       activeBackgroundColor: HexColor('#3B7AF1'),
      //       foregroundColor: Colors.black,
      //       elevation: 8.0,
      //       shape: const CircleBorder(),
      //       children: [
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.addAssets,
      //             onTaps: () {},
      //             menuLabel: Texts.addAssets),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.keySignIn,
      //             onTaps: () {},
      //             menuLabel: Texts.keySignIn),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.sendBroadcast,
      //             onTaps: () {},
      //             menuLabel: Texts.sendBroadcast),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.viewCalender,
      //             onTaps: () {},
      //             menuLabel: Texts.viewCalendar),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.contactToContact,
      //             onTaps: () {},
      //             menuLabel: Texts.contactViewContractor),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.contactToResident,
      //             onTaps: () {},
      //             menuLabel: Texts.contactViewResident),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.sendMessages,
      //             onTaps: () {},
      //             menuLabel: Texts.sendMessage),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.createInspections,
      //             onTaps: () {},
      //             menuLabel: Texts.inspections),
      //         CommonWidget().floatingActionMenu(
      //             imagePath: CommonImage.createNewCases,
      //             onTaps: () {},
      //             menuLabel: Texts.createNewCases),
      //       ],
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
          child: Text('Hellos'),
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierColor: Colors.black38,
              barrierLabel: 'Label',
              barrierDismissible: true,
              pageBuilder: (_, __, ___) => Center(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  alignment: Alignment.bottomCenter,
                  color: Colors.transparent,
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonWidget().floatingActionMenu(
                            imagePath: CommonImage.createInspections,
                            onTaps: () {},
                            menuLabel: Texts.inspections),
                        CommonWidget().floatingActionMenu(
                            imagePath: CommonImage.createNewCases,
                            onTaps: () {},
                            menuLabel: Texts.createNewCases),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: HexColor(CommonColor.appBackColor),
      bottomNavigationBar: bottomNavigationBar(changeIndex),
      body: SafeArea(
        top: false,
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(child: getPage!),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar(changeIndex) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Home Menu
          InkWell(
            onTap: () {
              changeIndex.call(1);
              setState(() {
                model!.menuIndex = 0;
              });
            },
            child: Container(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(5),
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      (model!.menuIndex == 0)
                          ? CommonImage.activeHome
                          : CommonImage.unActiveHome,
                      height: 24,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    Texts.home,
                    style: CommonStyle().buttonLableStyle(
                      textColor: (model!.menuIndex == 0)
                          ? CommonColor.bottomLabelAcColor
                          : CommonColor.bottomLableDeselectColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // cases Menu
          InkWell(
            onTap: () {
              changeIndex.call(2);
              setState(() {
                model!.menuIndex = 1;
              });
            },
            child: Container(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(5),
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      (model!.menuIndex == 1)
                          ? CommonImage.activeSetting
                          : CommonImage.unActiveSetting,
                      height: 24,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    Texts.cases,
                    style: CommonStyle().buttonLableStyle(
                      textColor: (model!.menuIndex == 1)
                          ? CommonColor.bottomLabelAcColor
                          : CommonColor.bottomLableDeselectColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Search Menu
          InkWell(
            onTap: () {
              changeIndex.call(3);
              setState(() {
                model!.menuIndex = 2;
              });
            },
            child: Container(
              width: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(5),
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      (model!.menuIndex == 2)
                          ? CommonImage.activeSearch
                          : CommonImage.unActiveSearch,
                      height: 24,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    Texts.inspections,
                    style: CommonStyle().buttonLableStyle(
                      textColor: (model!.menuIndex == 2)
                          ? CommonColor.bottomLabelAcColor
                          : CommonColor.bottomLableDeselectColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // More Menu
          InkWell(
            onTap: () {
              changeIndex.call(4);
              setState(() {
                model!.menuIndex = 3;
              });
            },
            child: Container(
              width: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(5),
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      (model!.menuIndex == 3)
                          ? CommonImage.activeMore
                          : CommonImage.unActiveMore,
                      height: 24,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    Texts.more,
                    style: CommonStyle().buttonLableStyle(
                      textColor: (model!.menuIndex == 3)
                          ? CommonColor.bottomLabelAcColor
                          : CommonColor.bottomLableDeselectColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
                // getTranslateVal(AppLocalKey.are_you_sure),
                'Are you sure?'),
            content: const Text(
                // getTranslateVal(AppLocalKey.exit_app),
                'Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                    // getTranslateVal(AppLocalKey.No),
                    'No'),
              ),
              FlatButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text(
                    // getTranslateVal(AppLocalKey.Yes),
                    'Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Widget? get getPage {
    if (model!.menuIndex == 0) {
      // return HomeScreen(changeIndex);
      return HomePage(changeIndex, scaffoldKey);
    } else if (model!.menuIndex == 1) {
      return HomePage(changeIndex, scaffoldKey);
      // return StoreDetailPage(changeIndex);
    } else if (model!.menuIndex == 2) {
      return HomePage(changeIndex, scaffoldKey);
      // return StoreDetailPage(changeIndex);
    } else if (model!.menuIndex == 3) {
      return MoreScreen(changeIndex);
      //return ProfilePage(changeIndex);
    } else if (model!.menuIndex == 4) {
      return HomePage(changeIndex, scaffoldKey);
    }
  }

  changeIndex(int index) {
    setState(() {
      model!.menuIndex = index;
    });
  }
}
