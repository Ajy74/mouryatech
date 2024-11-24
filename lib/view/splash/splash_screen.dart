import 'package:flutter/material.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/splash/widget/large_screen_widget.dart';
import 'package:mourytech/view/splash/widget/mobile_screen_widget.dart';
import 'package:mourytech/view/widget/responsive_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DeviceSize(context);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      child: Scaffold(
        backgroundColor: AppColor.getPrimaryColor(context),
        body: getContent(),
      ),
    );
  }
  
  Widget getContent() {
    if(DeviceSize.isMobileScreen){
       return const MobileScreenWidget();
    }
    if(DeviceSize.isMobileLargeScreen){
       return const MobileScreenWidget();
    }
    if(DeviceSize.isTablet){
       return const MobileScreenWidget();
    }
    if(DeviceSize.isLargeScreen){
       return const LargeScreenWidget();
    }

    return const SizedBox();
  }
}