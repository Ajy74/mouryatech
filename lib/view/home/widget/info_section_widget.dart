import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/components/custom_button.dart';
import 'package:mourytech/utils/constant/app_constant.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/widget/floating_up_down_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSectionWidget extends StatelessWidget {
  const InfoSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double minHeight = DeviceSize.isLargeScreen? DeviceSize.height-(DeviceSize.height/2.5) :DeviceSize.height-(kToolbarHeight + DeviceSize.width*0.04);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: DeviceSize.isTablet ? DeviceSize.height + (DeviceSize.height/5) : minHeight
      ),
      child: Container(
        width: DeviceSize.width,
        // height: minHeight,
        margin: EdgeInsets.symmetric(
          horizontal: DeviceSize.width*0.025
        ),
        child: DeviceSize.isLargeScreen ? largeScreenContent() : mobileScreenContent(),
      ),
    );
  }
  
  largeScreenContent() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceSize.width*0.02
            ),
            child: firstSection()
          ),
        ),

        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: DeviceSize.width*0.01
            ),
            child: secondSection()
          ),
        )
      ],
    );
  }
  
  mobileScreenContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceSize.width*0.01
            ),
            child: secondSection()
          ),
        ),

        SizedBox(height: kIsWeb ? DeviceSize.height*0.02 :0,),

        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: DeviceSize.width*0.05
            ),
            child: firstSection()
          ),
        ),
      ],
    );
  }
  
  firstSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: DeviceSize.isLargeScreen? CrossAxisAlignment.start: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Text(
            "Hello, I'm",
            style: GoogleFonts.paprika(
              fontSize: DeviceSize.isLargeScreen? DeviceSize.width*0.015 : DeviceSize.width*0.05,
              fontWeight: FontWeight.bold,
              color: AppColor.vegasGold
            ),
          ),
        ),

        SizedBox(height: DeviceSize.isLargeScreen? DeviceSize.width*0.01 : DeviceSize.width*0.02,),
        Text(
          "Ajay Mourya",
          style: GoogleFonts.paprika(
            fontSize: DeviceSize.isLargeScreen? DeviceSize.width*0.025 :DeviceSize.width*0.075,
            fontWeight: FontWeight.bold,
            color: AppColor.lightPrimaryColor
          ),
        ),

        SizedBox(height: DeviceSize.isLargeScreen? DeviceSize.width*0.012 : DeviceSize.width*0.03,),
        SizedBox(
          child: RichText(
            textAlign: DeviceSize.isLargeScreen ? TextAlign.start : TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "A ",
                  style: GoogleFonts.paprika(
                    fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.015 : DeviceSize.width*0.04,
                    fontWeight: FontWeight.bold,
                    color: AppColor.lightPrimaryColor
                  ),
                ),
                TextSpan(
                  text: "Mobile Application Developer ",
                  style: GoogleFonts.paprika(
                    fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.015 : DeviceSize.width*0.04,
                    fontWeight: FontWeight.bold,
                    color: AppColor.cyan
                  ),
                ),
                TextSpan(
                  text: "From ",
                  style: GoogleFonts.paprika(
                    fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.015 : DeviceSize.width*0.04,
                    fontWeight: FontWeight.bold,
                    color: AppColor.lightPrimaryColor
                  ),
                ),
                TextSpan(
                  text: "Mumbai",
                  style: GoogleFonts.paprika(
                    fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.015 : DeviceSize.width*0.04,
                    fontWeight: FontWeight.bold,
                    color: AppColor.lightColor7
                  ),
                ),
              ]
            ),
          ),
        ),

        SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.04,),
        SizedBox(
          child: Text(
            "Passionate about building impactful mobile experiences that blend creativity and functionality. With expertise in Flutter and backend development, I strive to create seamless, user-friendly applications. In addition to my technical skills, I enjoy exploring the latest trends in technology and continuously learning to stay ahead in this ever-evolving field.",
            style: GoogleFonts.paprika(
              fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.011 : DeviceSize.width*0.032,
              color: AppColor.lightPrimaryColor,
              height: 1.5
            ),
            textAlign: DeviceSize.isLargeScreen ? TextAlign.start :TextAlign.center,
          ),
        ),

        SizedBox(height: DeviceSize.isLargeScreen ?DeviceSize.width*0.03:DeviceSize.width*0.07,),
        SizedBox(
          child: Row(
            mainAxisAlignment: DeviceSize.isLargeScreen ? MainAxisAlignment.start :MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                title: "Download CV", 
                height: DeviceSize.isLargeScreen ? DeviceSize.height*0.07 :DeviceSize.height*0.055,
                width: DeviceSize.isLargeScreen ? DeviceSize.width*0.12 :DeviceSize.width*0.32,
                radius: DeviceSize.isLargeScreen ? (DeviceSize.height*0.07)/2 :(DeviceSize.height*0.055)/2,
                textSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.012 :DeviceSize.width*0.034,
                onPress: () async{
                  if( await canLaunchUrl(Uri.parse(resumeDownloadUrl)) ){
                    await launchUrl(Uri.parse(resumeDownloadUrl));
                  }else{
                    log("Something went wrong in launching resume url");
                  }
                }
              ),

              SizedBox(width: DeviceSize.isLargeScreen ? DeviceSize.width*0.03 :DeviceSize.width*0.025,),
              IconButton(
                visualDensity: DeviceSize.isLargeScreen ? VisualDensity.standard :VisualDensity.compact,
                onPressed: (){}, 
                icon: FaIcon(
                  FontAwesomeIcons.linkedinIn, 
                  color: AppColor.lightSecondaryColor,
                  size: DeviceSize.isLargeScreen ? DeviceSize.width*0.012 : DeviceSize.width*0.04,
                )
              ),

              IconButton(
                visualDensity: DeviceSize.isLargeScreen ? VisualDensity.standard :VisualDensity.compact,
                onPressed: (){}, 
                icon: FaIcon(
                  FontAwesomeIcons.githubAlt, 
                  color: AppColor.lightSecondaryColor,
                  size: DeviceSize.isLargeScreen ? DeviceSize.width*0.012 : DeviceSize.width*0.04,
                )
              ),

              IconButton(
                visualDensity: DeviceSize.isLargeScreen ? VisualDensity.standard :VisualDensity.compact,
                onPressed: (){}, 
                icon: FaIcon(
                  FontAwesomeIcons.instagram, 
                  color: AppColor.lightSecondaryColor,
                  size: DeviceSize.isLargeScreen ? DeviceSize.width*0.012 : DeviceSize.width*0.04,
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  secondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.width*0.03 : 0,),

        SizedBox(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15
                ),
                child: Hero(
                  tag: "ajay",
                  child: CircleAvatar(
                    radius: DeviceSize.isLargeScreen ? DeviceSize.width*0.08 : DeviceSize.isTablet ? DeviceSize.width*0.22 :DeviceSize.width*0.26,
                    backgroundImage: const AssetImage("assets/images/ajay.jpg"),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                child: FloatingUpDownWidget(
                  offset: 15.0, 
                  duration: const Duration(seconds: 3),
                  child: Image(
                    image: const AssetImage("assets/icons/flutter.png"),
                    height: DeviceSize.isLargeScreen  ? 40 : DeviceSize.isTablet ? 50 :30,
                  )
                )
              ),

              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(
                  child: FloatingUpDownWidget(
                    offset: 15.0, 
                    duration: const Duration(seconds: 3),
                    child: Image(
                      image: const AssetImage("assets/icons/nodejs.png"),
                      height: DeviceSize.isLargeScreen  ? 40 : DeviceSize.isTablet ? 50 :30,
                    )
                  ),
                )
              ),

              Positioned(
                top: 25,
                right: 0,
                child: FloatingUpDownWidget(
                  offset: 15.0, 
                  duration: const Duration(seconds: 3),
                  child: Image(
                    image: const AssetImage("assets/icons/kotlin.png"),
                    height: DeviceSize.isLargeScreen  ? 40 : DeviceSize.isTablet ? 50 :30,
                  )
                )
              ),
            ],
          ),
        ),

        SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.width*0.03 :DeviceSize.width*0.07,),

        SizedBox(
          width: DeviceSize.width,
          child: AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(
                "Flutter Developer",
                textStyle: GoogleFonts.paprika(
                  fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColor.vegasGold
                ),
                textAlign: TextAlign.center
              ),
              RotateAnimatedText(
                "Backend Developer",
                textStyle: GoogleFonts.paprika(
                  fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColor.cyan
                ),
                textAlign: TextAlign.center
              ),
              RotateAnimatedText(
                "Mobile Application Developer",
                textStyle: GoogleFonts.paprika(
                  fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColor.orangeYellowCrayola,
                ),
                textAlign: TextAlign.center
              ),
              RotateAnimatedText(
                "Node.js Developer",
                textStyle: GoogleFonts.paprika(
                  fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColor.cyan
                ),
              ),
              RotateAnimatedText(
                "Android Developer",
                textStyle: GoogleFonts.paprika(
                  fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.055,
                  fontWeight: FontWeight.bold,
                  color: AppColor.lightPrimaryColor
                ),
                textAlign: TextAlign.center
              ),
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
      ],
    );
  }

}