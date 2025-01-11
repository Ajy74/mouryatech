import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/constant/app_constant.dart';
import 'package:mourytech/utils/device_size.dart';

class MyProjectSectionWidget extends StatelessWidget {
  const MyProjectSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: EdgeInsets.only(
      //   top: DeviceSize.isLargeScreen ? DeviceSize.height*0.04 : DeviceSize.height*0.03
      // ),

      child: Column(
        children: [
          myProjectTitleContainer(),

          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.vegasGold,
              borderRadius: BorderRadius.circular(10)
            ),
          ),


          Container(
            width: DeviceSize.width,
            margin: EdgeInsets.only(
              top: DeviceSize.isLargeScreen ? DeviceSize.height*0.05 : DeviceSize.height*0.04,
              left: DeviceSize.width*0.05,
              right: DeviceSize.width*0.05,
            ),
            padding: EdgeInsets.only(
              bottom: DeviceSize.height*0.05
            ),
            child: projectSection(),
          ),
        ],
      ),
    );
  }

  myProjectTitleContainer() {
    return Container(
      margin: EdgeInsets.only(
        top: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.03
      ),
      alignment: Alignment.center,
      child: Text(
        "My Projects",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.03 :DeviceSize.width*0.08,
          color: AppColor.lightPrimaryColor,
          shadows: [
            Shadow(
              color: AppColor.cyan.withOpacity(.9),
              offset: const Offset(0, 2),
              blurRadius: 5
            )
          ]
        ),
      ),
    );
  }
  
  projectSection() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : (DeviceSize.isTablet ? DeviceSize.width*0.03 : 0.0) ),
      child: Wrap(
        runSpacing: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.05,
        spacing: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.05,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: projects.map((item) => projectCard(item),).toList(),
      ),
    );
  }
  
  Widget projectCard(Map<String, dynamic> item) {
    return Container(
      width: getProjectCardWidth(),
      height: DeviceSize.isLargeScreen ? DeviceSize.height*0.35 : DeviceSize.height*0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.cyan.withOpacity(.015),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: 
              // Image.network(item["image"],
              //   width: double.infinity,
              //   height: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              Image.asset(item["image"],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5,),
                  
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: DeviceSize.isLargeScreen ? DeviceSize.width*0.01 : DeviceSize.width*0.02),
                    width: DeviceSize.width,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item["title"] ?? "",
                      style: GoogleFonts.paprika(
                        color: AppColor.lightPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.isLargeScreen ? DeviceSize.width * 0.01 : (DeviceSize.isTablet? DeviceSize.width*0.025 :DeviceSize.width*0.033),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  
                  const SizedBox(height: 5,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: DeviceSize.isLargeScreen ? DeviceSize.width*0.01 : DeviceSize.width*0.02),
                    width: DeviceSize.width,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item["type"] ?? "",
                      style: GoogleFonts.paprika(
                        color: AppColor.lightPrimaryColor.withOpacity(.5),
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceSize.isLargeScreen ? DeviceSize.width * 0.01 : (DeviceSize.isTablet? DeviceSize.width*0.025 :DeviceSize.width*0.03),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  double getProjectCardWidth() {
    if(DeviceSize.isMobileScreen || DeviceSize.isMobileLargeScreen){
      return DeviceSize.width ;
    }
    else if(DeviceSize.isTablet){
      return DeviceSize.width*0.4;
    }
    else{
      return DeviceSize.width/5;
    }
  }
  
}