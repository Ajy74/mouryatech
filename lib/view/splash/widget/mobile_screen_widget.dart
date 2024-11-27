import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/configs/routes/route_name.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/widget/fade_in_out_widget.dart';


class MobileScreenWidget extends StatelessWidget {
  const MobileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceSize.width,
      height: DeviceSize.height,
      margin: EdgeInsets.only(
        left: DeviceSize.width*0.05, 
        right: DeviceSize.width*0.05, 
        top:DeviceSize.width*0.05 + MediaQuery.of(context).viewPadding.top ,
        // top: (Platform.isAndroid || Platform.isIOS) ? DeviceSize.width*0.05 + MediaQuery.of(context).viewPadding.top : DeviceSize.width*0.05 ,
        bottom: DeviceSize.width*0.05 
      ),
      // padding: EdgeInsets.symmetric(horizontal: DeviceSize.width*0.03, vertical: DeviceSize.width*0.03),
      decoration: BoxDecoration(
        // color: AppColor.darkSecondaryColor.withOpacity(.09),
        image: const DecorationImage(
          image: AssetImage("assets/images/back2.gif"),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.darkPrimaryColor.withOpacity(.85),
                borderRadius: BorderRadius.circular(15)
              ),
            )
          ),

          Column(
            children: [
              Expanded(
                child: Center(
                  child: FadeInOutWidget(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.vegasGold.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: DeviceSize.width*0.28,
                        backgroundColor: AppColor.darkColor1,
                        child: Padding(
                          padding: EdgeInsets.all(DeviceSize.width*0.01),
                          child: CircleAvatar(
                            radius: DeviceSize.width*0.28,
                            backgroundImage: const AssetImage("assets/images/ajay.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ) 
              ),
          
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: DeviceSize.width,
                       child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Ajay Mourya',
                              textStyle: TextStyle(
                                fontSize: DeviceSize.width*0.1,
                                fontWeight: FontWeight.bold,
                                color: AppColor.vegasGold
                              ),
                              speed: const Duration(milliseconds: 500),
                              cursor: "",
                              curve: Curves.bounceInOut,
                              textAlign: TextAlign.center 
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 500),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                          onFinished: () {
                            context.replaceNamed(RouteName.homeScreen);
                          },
                        ),
                    ),
                    
                    Expanded(
                      child: Container(
                        width: DeviceSize.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: DeviceSize.width*0.03,
                          vertical: DeviceSize.width*0.03
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   "Welcome to",
                            //   style: TextStyle(
                            //     fontSize: DeviceSize.width*0.09,
                            //     fontWeight: FontWeight.bold,
                            //     color: AppColor.cyan
                            //   ),
                            // ),
          
                            // Text(
                            //   "mouryatech",
                            //   style: TextStyle(
                            //     fontSize: DeviceSize.width*0.14,
                            //     fontWeight: FontWeight.bold,
                            //     color: AppColor.cyan
                            //   ),
                            // ),
          
                            FadeInOutWidget(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    'Welcome to',
                                    textStyle: TextStyle(
                                      fontSize: DeviceSize.width*0.09,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.cyan
                                    ),
                                    speed: const Duration(milliseconds: 2000),
                                    textAlign: TextAlign.center,
                                    colors: [
                                      AppColor.cyan,
                                      AppColor.lightColor7,
                                      AppColor.orangeYellowCrayola,
                                      AppColor.bitterSweet,
                                    ] 
                                  ),
                                ],
                                pause: const Duration(milliseconds: 500),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                                repeatForever: true,
                              ),
                            ),
          
                            FadeInOutWidget(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    'mouryatech',
                                    textStyle: TextStyle(
                                      fontSize: DeviceSize.width*0.14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.cyan
                                    ),
                                    speed: const Duration(milliseconds: 2000),
                                    textAlign: TextAlign.center,
                                    colors: [
                                      AppColor.cyan,
                                      AppColor.lightColor7,
                                      AppColor.orangeYellowCrayola,
                                      AppColor.bitterSweet,
                                    ] 
                                  ),
                                ],
                                pause: const Duration(milliseconds: 500),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                                repeatForever: true,
                              ),
                            ),
          
                          ],
                        ),
                      ),
                    )
          
                  ],
                ) 
              ),
            ],
          ),
        ],
      ),
    );
  }
}