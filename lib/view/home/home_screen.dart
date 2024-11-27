import 'package:flutter/material.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/widget/responsive_widget.dart';

import 'widget/home_large_screen_widget.dart';
import 'widget/home_mobile_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
       return const HomeMobileScreenWidget();
    }
    if(DeviceSize.isMobileLargeScreen){
       return const HomeMobileScreenWidget();
    }
    if(DeviceSize.isTablet){
       return const HomeMobileScreenWidget();
    }
    if(DeviceSize.isLargeScreen){
       return const HomeLargeScreenWidget();
    }

    return const SizedBox();
  }
}