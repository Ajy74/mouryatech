
import 'package:flutter/material.dart';
import 'package:mourytech/configs/colors/colors.dart';

dynamic customSnackBar(BuildContext context,String text, Color backgroundColor, Color textColor){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: backgroundColor, 
      closeIconColor: AppColor.lightPrimaryColor,
      showCloseIcon: true,
      duration: const Duration(seconds: 3),
      
    ),
  );
}