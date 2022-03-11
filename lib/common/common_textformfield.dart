import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mybos_app/AppDetails.dart';
import 'package:mybos_app/common/common_color.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType textInputType;
  final bool isObscureText;
  final bool readOnly;
  final int maxLength;
  final TextInputAction textInputAction;
  final String hintText;

  CommonTextField({
    required this.controller,
    required this.validator,
    required this.textInputType,
    required this.textInputAction,
    this.maxLength = 10247,
    required this.hintText,
    this.isObscureText = false,
    this.readOnly = false,
    Null Function()? onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      obscureText: isObscureText,
      controller: controller,
      style: const TextStyle(
          color: Colors.black, fontFamily: AppDetails.rubik_regular),
      maxLength: maxLength,
      // cursorColor: AppColors.textGrey,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16.0,top: 15.0,bottom: 14.0),
        filled: true,
        fillColor: HexColor("#FFFFFF"),
        hintStyle: TextStyle(
          fontFamily: AppDetails.rubik_regular,
          fontSize: 16.0,
          color: HexColor(CommonColor.hintColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        hintText: hintText,
        counterText: "",
      ),
      validator: validator,
      keyboardType: textInputType,
    );
  }
}
