import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';

class AboutMeSectionWidget extends StatelessWidget {
  const AboutMeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // double minHeight = DeviceSize.isLargeScreen? DeviceSize.height-(DeviceSize.height/2.5) :DeviceSize.height-(kToolbarHeight + DeviceSize.width*0.04);

    return Container(
      // height: minHeight,
      margin: EdgeInsets.only(
        top: DeviceSize.height*0.04
      ),
      color: AppColor.cyan.withOpacity(.02),
      child: DeviceSize.isLargeScreen ? largeScreenContent() : mobileScreenContent(),
    );
  }
  
  largeScreenContent() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.035
          ),
          alignment: Alignment.center,
          child: Text(
            "About Me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: DeviceSize.width*0.03,
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
        ),

        Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            color: AppColor.vegasGold,
            borderRadius: BorderRadius.circular(10)
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(
            vertical: DeviceSize.height*0.06,
            horizontal: DeviceSize.width*0.045 //0.035
          ),
          child: Text(
            "I was born on December 21, 2002, in the bustling city of Mumbai. However, my early education took me to the serene landscapes of Bihar, where I completed my studies up to the 12th grade. Seeking new horizons, I pursued my graduation in Bhubaneswar, Odisha, immersing myself in a vibrant academic and cultural environment.\n\nCurrently, I am back in Mumbai, where my journey has come full circle, working in the city that has always inspired me. My experiences across different states have shaped me into a dynamic individual with a passion for technology and innovation.",
            style: GoogleFonts.paprika(
              fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.011 : DeviceSize.width*0.032,
              color: AppColor.lightPrimaryColor,
              height: 1.5
            ),
            textAlign: DeviceSize.isLargeScreen ? TextAlign.start :TextAlign.center,
          ),
        ),


        Container(
          // height: DeviceSize.height/1.5,
          width: DeviceSize.width,
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.03,
            left: DeviceSize.width*0.045,
            right: DeviceSize.width*0.045,
          ),
          padding: EdgeInsets.only(
            bottom: DeviceSize.height*0.05
          ),
          child: educationExperienceSection(),
        ),

      ],
    );
  }
  
  mobileScreenContent() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.035
          ),
          alignment: Alignment.center,
          child: Text(
            "About Me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: DeviceSize.width*0.03,
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
        ),

      ],
    );
  }
  
  educationExperienceSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconWithTitleContainer(icon: Icons.menu_book_rounded, title: "Education"),
                verticalLine(size: DeviceSize.height*0.03),
                pathContent(
                  title: "Gita Autonomous College, Bhubaneshwar",
                  dates: "2020 — 2024",
                  description: "Btech in Computer Science & Information Technology"
                ),
                pathContent(
                  title: "Ramdoot Intenational School, Uttar Pradesh",
                  dates: "2019 — 2020",
                  description: "Completed 12th with Science Stream"
                ),
                pathContent(
                  title: "Raj English School, Uttar Pradesh",
                  dates: "2017 — 2018",
                  description: "Completed 10th",
                  showPath: false
                ),
              ],
            ),
          ) 
        ),

        SizedBox(width: DeviceSize.width*0.02,),

        Expanded(
          flex: 1,
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconWithTitleContainer(icon: Icons.work, title: "Experience"),
                verticalLine(size: DeviceSize.height*0.03),
                pathContent(
                  title: "Infozzle Software Solutions Pvt. Ltd.",
                  dates: "July, 2024 — Present",
                  description: "FLutter Developer"
                ),
                pathContent(
                  title: "Syflex Techno Solution Pvt. Ltd.",
                  dates: "September, 2023 — March, 2024",
                  description: "FLutter Developer Trainee"
                ),
                pathContent(
                  title: "Oasis Infobyte",
                  dates: "May, 2023 — Jun, 2023",
                  description: "Android Developer ( Summer Intern )",
                ),
                pathContent(
                  title: "Gauravgo Technologies",
                  dates: "September, 2021 — November, 2022",
                  description: "Android Developer ( Part time )",
                  showPath: false
                ),
              ],
            ),
          ) 
        ),

      ],
    );
  }
  
  iconWithTitleContainer({required IconData icon, required String title}){
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: DeviceSize.width*0.04,
            height: DeviceSize.width*0.04,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.darkPrimaryColor,
              borderRadius: BorderRadius.circular((DeviceSize.width*0.04)/3),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.darkSecondaryColor,
                  offset: Offset(-1, -1)
                )
              ]
            ),
            child: Icon(
              icon, 
              color: AppColor.vegasGold,
              size: (DeviceSize.width*0.04)/2,
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              left: DeviceSize.width*0.02
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: DeviceSize.width*0.02,
                color: AppColor.vegasGold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  verticalLine({required double size }) {
    return SizedBox(
      height: size,
      width: DeviceSize.width*0.04,
      child: Center(
        child: Container(
          width: 1,
          color: AppColor.darkSecondaryColor,
        )
      ),
    );
  }

  pathContent({required String title, required String dates, required String description, bool showPath = true}){
    return IntrinsicHeight( 
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
              Container(
                margin: EdgeInsets.only(right: DeviceSize.width * 0.02),
                width: DeviceSize.width * 0.04,
                child: Center(
                  child: Container(
                    width: showPath ? 1 :0,
                    color: AppColor.darkSecondaryColor,
                  ),
                ),
              ),
          
              Expanded( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        title,
                        style: GoogleFonts.paprika(
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceSize.width*0.011,
                          color: AppColor.lightPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: DeviceSize.height * 0.02),
                    SizedBox(
                      child: Text(
                        dates,
                        style: GoogleFonts.paprika(
                          fontSize: DeviceSize.width * 0.01,
                          color: AppColor.cyan,
                        ),
                      ),
                    ),
                    SizedBox(height: DeviceSize.height * 0.012),
                    SizedBox(
                      child: Text(
                        description,
                        style: GoogleFonts.paprika(
                          fontSize: DeviceSize.width * 0.01,
                          color: AppColor.lightSecondaryColor.withOpacity(.8),
                        ),
                      ),
                    ),
                    SizedBox(height: DeviceSize.height * 0.04),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            top: 3,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(
                right: DeviceSize.width*0.02
              ),
              width: DeviceSize.width*0.04,
              child: Center(
                child: Container(
                  width: DeviceSize.height*0.015,
                  height: DeviceSize.height*0.015,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.vegasGold,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.vegasGold.withOpacity(.3),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ]
                  ),
                )
              ),
            )
          ),
        ],
      ),
    );
  }

}