import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/configs/routes/route_name.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/widget/fade_in_out_widget.dart';

class LargeScreenWidget extends StatefulWidget {
  const LargeScreenWidget({super.key});

  @override
  State<LargeScreenWidget> createState() => _LargeScreenWidgetState();
}

class _LargeScreenWidgetState extends State<LargeScreenWidget> {

  double avatarShadowValue = 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceSize.width,
      height: DeviceSize.height,
      margin: EdgeInsets.symmetric(horizontal: DeviceSize.width*0.03, vertical: DeviceSize.width*0.03),
      // padding: EdgeInsets.symmetric(horizontal: DeviceSize.width*0.02, vertical: DeviceSize.width*0.02),
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
          
          Row(
            children: [
          
              Expanded(
                child: Center(
                  child: FadeInOutWidget(
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () => {},
                      onHover: (value) {
                        if(value){
                          setState(() {
                            avatarShadowValue = 0.5;
                          });
                        }
                        else{
                          setState(() {
                            avatarShadowValue = 0.3;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.vegasGold.withOpacity(avatarShadowValue),
                              blurRadius: 20,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: DeviceSize.width*0.1,
                          backgroundColor: AppColor.darkColor1,
                          child: Padding(
                            padding: EdgeInsets.all(DeviceSize.width*0.004),
                            child: CircleAvatar(
                              radius: DeviceSize.width*0.1,
                              backgroundImage: const AssetImage("assets/images/ajay.jpg"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ) 
              ),
          
              Expanded(
                child: Container(
                  width: DeviceSize.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: DeviceSize.width*0.05,
                    vertical: DeviceSize.width*0.05
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: DeviceSize.width,
                          child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Ajay Mourya',
                                  textStyle: TextStyle(
                                    fontSize: DeviceSize.width*0.04,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.vegasGold
                                  ),
                                  speed: const Duration(milliseconds: 500),
                                  cursor: "",
                                  curve: Curves.bounceInOut,
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
          
                        SizedBox(height: DeviceSize.width*0.025,),
          
                        FadeInOutWidget(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'Welcome to',
                                textStyle: TextStyle(
                                  fontSize: DeviceSize.width*0.03,
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
                                  fontSize: DeviceSize.width*0.04,
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
                ) 
              ),
            ],
          ),
        ],
      ),
    );
  }
}