import 'package:flutter/material.dart';

// class DeviceSize {
//   static final DeviceSize _instance = DeviceSize._internal();
//   static late bool isMobileScreen;
//   static late bool isMobileLargeScreen;
//   static late bool isTablet;
//   static late bool isLargeScreen;
//   static late double width;
//   static late double height;
  

//   DeviceSize._internal();

//   factory DeviceSize(BuildContext context) {
//     // if (_instance._isFirstRun) {
//     //   final double width = MediaQuery.of(context).size.width;
//     //   final double height = MediaQuery.of(context).size.height;
//     //   isLargeScreen = width > 550;
//     //   isAbleToLandscape = height > 850;
//     //   _instance._isFirstRun = false;
//     // }

//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     isMobileScreen = width <= 500;
//     isMobileLargeScreen = width > 500 && width <= 700;
//     isTablet = width > 700 && width <= 1024;
//     isLargeScreen = width > 1024;
    
//     return _instance;
//   }

//   // bool _isFirstRun = true;
// }



class DeviceSize{
  static final DeviceSize _instance = DeviceSize._internal();

  //~ Device properties
  static late bool isMobileScreen;
  static late bool isMobileLargeScreen;
  static late bool isTablet;
  static late bool isLargeScreen;
  static late double width;
  static late double height;

  //~ ValueNotifier to track size changes
  final ValueNotifier<bool> sizeChangedNotifier = ValueNotifier<bool>(false);

  DeviceSize._internal();

  factory DeviceSize(BuildContext context) {
    _instance._updateSize(context); 
    return _instance;
  }

  void _updateSize(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;

    isMobileScreen = width <= 500;
    isMobileLargeScreen = width > 500 && width <= 700;
    isTablet = width > 700 && width <= 1024;
    isLargeScreen = width > 1024;

    //~ Notify listeners about size change
    sizeChangedNotifier.value = !sizeChangedNotifier.value; 
  }
}
