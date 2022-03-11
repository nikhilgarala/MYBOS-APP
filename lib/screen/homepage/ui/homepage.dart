import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_style.dart';
import 'package:mybos_app/common/texts.dart';
import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  Function callback;
  GlobalKey<ScaffoldState> keys;

  HomePage(this.callback, this.keys);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = [];
  int perPageItem = 9;
  int pageCount = 2;
  int selectedIndex = 0;
  late int lastPageItemLength;
  late PageController pageController;

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

  void _updatePosition(double position) {
    setState(() => currentPosition = _validPosition(position));
  }

  final _totalDots = 2;
  double currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );
    for (int i = 1; i <= 10; i++) {
      list.add('$i');
    }
    var num = (list.length / perPageItem);
    pageCount = num.isInt ? num.toInt() : num.toInt() + 1;

    var reminder = list.length.remainder(perPageItem);
    lastPageItemLength = reminder == 0 ? perPageItem : reminder;

    super.initState();
  }

  late double screenHeight, screenWidth;
  double currentPageIndex = 0.0;


  @override
  Widget build(BuildContext context) {
    final decorator = DotsDecorator(
      activeColor: HexColor(CommonColor.appColor),
      size: const Size.square(6.0),
      activeSize: const Size.square(8.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // b
      extendBody: true,
      backgroundColor: HexColor(CommonColor.appBackColor),
      body: Container(
        margin: const EdgeInsets.only(bottom: 00),
        child: Column(
          children: [
            // Text((screenHeight * 0.069).ceilToDouble().toString()),
            Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    CommonImage.homeBackImage,
                    height: (screenHeight * 0.35).ceilToDouble(),
                    width: screenWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0.0,
                  left: 0.0,
                  child: Column(
                    children: <Widget>[
                      // AppBar
                      myAppBar(),
                      SizedBox(
                        height: (screenHeight * 0.065).ceilToDouble(),
                      ),
                      // weather and temperature show
                      weatherTemperature(),
                    ],
                  ),
                ),
              ],
            ),

            // menuItems(),

            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  menuItems(),
                  Positioned(
                    right: 0.0,
                    left: 0.0,
                    bottom : (Platform.isIOS) ?  30 : 80,
                    child: menuItemDotIndicator(decorator),
                  )
                ],
              ),
            ),
            // Display the grid of Menu items
            // menuItems(),
          
            // menuItemDotIndicator(decorator),
          ],
        ),
      ),
    );
  }

  Widget menuItemDotIndicator(DotsDecorator decorator) {
    return _buildRow(
      [
        DotsIndicator(
          dotsCount: _totalDots,
          position: currentPageIndex,
          axis: Axis.horizontal,
          decorator: decorator,
          onTap: (pos) {
            debugPrint('2-2-2-2-2-2-2 Inside the Position ${pos.toString()}');
            setState(() => currentPosition = pos);
          },
        )
      ],
    );
  }

  Flexible menuItems() {
    return Flexible(
      flex: 2,
      child: PageView.builder(
        controller: pageController,
        itemCount: pageCount,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        itemBuilder: (_, pageIndex) {
          return GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            primary: false,
            childAspectRatio: 1.1,
            shrinkWrap: true,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
            children: List.generate(
              (pageCount - 1) != pageIndex ? perPageItem : lastPageItemLength,
              (index) {
                ((pageCount - 1) != pageIndex)
                    ? currentPageIndex = 0.0
                    : currentPageIndex = 1.0;
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                    ),
                    height: 106,
                    margin: const EdgeInsets.all(5),
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
        },
      ),
    );
  }

  Padding weatherTemperature() {
    return Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 21.0),
      child: Container(
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  CommonImage.watherIcon,
                  height: (screenHeight * 0.096).ceilToDouble(),
                  width: (screenHeight * 0.12).ceilToDouble(),
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Sunny',
                  style: TextStyle(
                    fontFamily: AppDetails.rubik_bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'SUNDAY, JULY 22',
                  style: TextStyle(
                    fontFamily: AppDetails.rubik_medium,
                    fontSize: 9,
                    color: HexColor(CommonColor.subTitleColor),
                  ),
                )
              ],
            ),
            // temperature
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  '34°',
                  style: TextStyle(
                    fontFamily: AppDetails.rubik_bold,
                    fontSize: 56,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Feels like 18°',
                  style: TextStyle(
                    fontFamily: AppDetails.rubik_medium,
                    fontSize: 11,
                    color: HexColor(CommonColor.subTitleColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding myAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 21.0, right: 21.0, top: 30),
      child: Container(
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () => widget.keys.currentState!.openDrawer(),
              child: Image.asset(
                CommonImage.drawerMenuIcon,
                height: 20.0,
                width: 20.0,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Arch',
                  style: CommonStyle().titleLabelStyle(),
                ),
                Text(
                  'Sydney NSW 2000',
                  style: CommonStyle().subtitleLabelStyle(),
                ),
              ],
            ),
            Image.asset(
              CommonImage.notificationIcon,
              height: 20.0,
              width: 20.0,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}
