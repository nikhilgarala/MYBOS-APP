import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/common/common_color.dart';
import 'package:mybos_app/common/common_image.dart';
import 'package:mybos_app/common/common_style.dart';

class CommonWidget {
  static commonButton({
    required BuildContext context,
    required String buttonText,
    required void Function()? onPress,
    required double buttonHeight,
    required double buttonWidth,
  }) =>
      ButtonTheme(
        height: buttonHeight,
        minWidth: buttonWidth,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: HexColor(CommonColor.appColor),
          onPressed: onPress,
          child: Text(
            buttonText.toString(),
            style: CommonStyle().buttonTextStyle(),
          ),
        ),
      );

  floatingActionMenu(
          {required String menuLabel,
          required String imagePath,
          required void Function()? onTaps}) =>
      InkWell(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0,bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          height: 46,
          child: Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                  width: 16.0,
                  child: Image.asset(
                    imagePath.toString(),
                    height: 16.0,
                    width: 16.0,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Text(
                  menuLabel.toString(),
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                  style: CommonStyle().floatingActionButtonStyles(),
                ),
              ],
            ),
          ),
        ),
        onTap: onTaps,
      );

  // floatingActionMenu({required String menuLabel,
  //   required String imagePath,
  //   required void Function()? onTaps}) =>
  //     SpeedDialChild(
  //       backgroundColor: Colors.grey,
  //       labelWidget: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(8.0),
  //           color: Colors.white,
  //         ),
  //         alignment: Alignment.center,
  //         padding: const EdgeInsets.only(left: 16.0, right: 16.0),
  //         height: 46,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               height: 16.0,
  //               width: 16.0,
  //               child: Image.asset(
  //                 imagePath.toString(),
  //                 height: 16.0,
  //                 width: 16.0,
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //             const SizedBox(
  //               width: 16.0,
  //             ),
  //             Text(
  //               menuLabel.toString(),
  //               style: CommonStyle().floatingActionButtonStyles(),
  //             ),
  //           ],
  //         ),
  //       ),
  //       onTap: onTaps,
  //     );

  // Drawer Menu Item
  drawerMenu(
          {required void Function()? onTaps,
          required String menuLabel,
          required String menuIcon}) =>
      InkWell(
        onTap: onTaps,
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor(CommonColor.drawerIconBackColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                menuIcon,
                height: 16.0,
                width: 16.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(
            menuLabel.toString(),
            style: CommonStyle().drawerMenuStyle(),
          ),
        ),
      );

  // Drawer Logout Icons
  drawerLogoutMenu(
          {required void Function()? onTaps,
          required String menuLabel,
          required String menuIcon}) =>
      InkWell(
        onTap: onTaps,
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor(CommonColor.drawerUnSelectColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                menuIcon,
                height: 16.0,
                width: 16.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(
            menuLabel.toString(),
            style: CommonStyle().drawerMenuStyle(),
          ),
        ),
      );

  appBackButton(
          {required void Function()? onTaps, required String buttonIcon}) =>
      InkWell(
        onTap: onTaps,
        child: Image.asset(
          buttonIcon,
          height: 20.0,
          width: 20.0,
          fit: BoxFit.fill,
        ),
      );

  // Common DeSelect Button
  static commonDeselectButton({
    required BuildContext context,
    required String buttonText,
    required void Function()? onPress,
    required double buttonHeight,
    required double buttonWidth,
  }) =>
      ButtonTheme(
        height: buttonHeight,
        minWidth: buttonWidth,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: HexColor(CommonColor.deSelectButtonColor),
          onPressed: onPress,
          child: Text(
            buttonText.toString(),
            style: CommonStyle().deSelectButtonTextStyle(),
          ),
        ),
      );
}
