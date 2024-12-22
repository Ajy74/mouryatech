import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/constant/app_constant.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/widget/waterfall_animation_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMeSectionWidget extends StatefulWidget {
  const AboutMeSectionWidget({super.key});

  @override
  State<AboutMeSectionWidget> createState() => _AboutMeSectionWidgetState();
}

class _AboutMeSectionWidgetState extends State<AboutMeSectionWidget> {

  late GlobalKey<WaterfallAnimationWidgetState> educationKey;
  late GlobalKey<WaterfallAnimationWidgetState> experienceKey;


  @override
  void initState() {
    super.initState();
    educationKey = GlobalKey<WaterfallAnimationWidgetState>();
    experienceKey = GlobalKey<WaterfallAnimationWidgetState>();
  }

  @override
  Widget build(BuildContext context) {
    // double minHeight = DeviceSize.isLargeScreen? DeviceSize.height-(DeviceSize.height/2.5) :DeviceSize.height-(kToolbarHeight + DeviceSize.width*0.04);

    return Container(
      margin: EdgeInsets.only(
        top: DeviceSize.isLargeScreen ? DeviceSize.height*0.04 : DeviceSize.height*0.03
      ),
      color: AppColor.cyan.withOpacity(.02),
      child: DeviceSize.isLargeScreen ? largeScreenContent() : mobileScreenContent(),
    );
  }

  largeScreenContent() {
    return Column(
      children: [
        aboutMeTitleContainer(),

        Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
            color: AppColor.vegasGold,
            borderRadius: BorderRadius.circular(10)
          ),
        ),

        introductionContainer(),

        Container(
          width: DeviceSize.width,
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.03,
            left: DeviceSize.width*0.045,
            right: DeviceSize.width*0.045,
          ),
          padding: EdgeInsets.only(
            bottom: DeviceSize.height*0.05
          ),
          child: educationExperienceSectionLarge(),
        ),

        Container(
          width: DeviceSize.width,
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.03,
            left: DeviceSize.width*0.045,
            right: DeviceSize.width*0.045,
          ),
          padding: EdgeInsets.only(
            bottom: DeviceSize.height*0.05
          ),
          child: skillSection(),
        ),
      ],
    );
  }

  mobileScreenContent() {
    return Column(
      children: [
        aboutMeTitleContainer(),

        Container(
          height: 3,
          width: 50,
          decoration: BoxDecoration(
            color: AppColor.vegasGold,
            borderRadius: BorderRadius.circular(10)
          ),
        ),

        introductionContainer(),

        Container(
          width: DeviceSize.width,
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.03,
            left: DeviceSize.width*0.05,
            right: DeviceSize.width*0.05,
          ),
          padding: EdgeInsets.only(
            bottom: DeviceSize.height*0.05
          ),
          child: educationExperienceSectionMobile(),
        ),

        Container(
          width: DeviceSize.width,
          margin: EdgeInsets.only(
            top: DeviceSize.height*0.01,
            left: DeviceSize.width*0.05,
            right: DeviceSize.width*0.05,
          ),
          padding: EdgeInsets.only(
            bottom: DeviceSize.height*0.05
          ),
          child: skillSection(),
        ),
      ],
    );
  }

  educationExperienceSectionLarge() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: educationStepper() 
        ),

        SizedBox(width: DeviceSize.width*0.02,),

        Expanded(
          flex: 1,
          child: experienceStepper(), 
        ),
      ],
    );
  }

  educationExperienceSectionMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        educationStepper(),
        SizedBox(height: DeviceSize.height*0.03,),
        experienceStepper()
      ],
    );
  }

  iconWithTitleContainer({required IconData icon, required String title}){
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: DeviceSize.isLargeScreen ? DeviceSize.width*0.04 : DeviceSize.width*0.1,
            height: DeviceSize.isLargeScreen ? DeviceSize.width*0.04 : DeviceSize.width*0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.darkPrimaryColor,
              borderRadius: BorderRadius.circular(DeviceSize.isLargeScreen ? (DeviceSize.width*0.04)/3 : (DeviceSize.width*0.1)/3),
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
              size: DeviceSize.isLargeScreen ? (DeviceSize.width*0.04)/2 : (DeviceSize.width*0.1)/2,
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              left: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.03
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.05,
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
      width: DeviceSize.isLargeScreen ? DeviceSize.width*0.04 : DeviceSize.width*0.1,
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
                margin: EdgeInsets.only(right: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.03),
                width: DeviceSize.isLargeScreen ? DeviceSize.width*0.04 : DeviceSize.width*0.1,
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
                          fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.011 : DeviceSize.width*0.032,
                          color: AppColor.lightPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: DeviceSize.height * 0.02),
                    SizedBox(
                      child: Text(
                        dates,
                        style: GoogleFonts.paprika(
                          fontSize: DeviceSize.isLargeScreen ? DeviceSize.width * 0.01 : DeviceSize.width*0.03,
                          color: AppColor.cyan,
                        ),
                      ),
                    ),
                    SizedBox(height: DeviceSize.height * 0.012),
                    SizedBox(
                      child: Text(
                        description,
                        style: GoogleFonts.paprika(
                          fontSize: DeviceSize.isLargeScreen ? DeviceSize.width * 0.01 : DeviceSize.width*0.03,
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
                right: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.03
              ),
              width: DeviceSize.isLargeScreen ? DeviceSize.width*0.04 : DeviceSize.width*0.1,
              child: Center(
                child: Container(
                  width: DeviceSize.isLargeScreen ? DeviceSize.height*0.015 : DeviceSize.height*0.01,
                  height: DeviceSize.isLargeScreen ? DeviceSize.height*0.015 : DeviceSize.height*0.01,
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

  aboutMeTitleContainer() {
    return Container(
      margin: EdgeInsets.only(
        top: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.03
      ),
      alignment: Alignment.center,
      child: Text(
        "About Me",
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

  introductionContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: DeviceSize.isLargeScreen ? DeviceSize.height*0.06 : DeviceSize.height*0.04,
        horizontal: DeviceSize.isLargeScreen ? DeviceSize.width*0.045 : DeviceSize.width*0.05 ,
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
    );
  }
  
  educationStepper() {
    return SizedBox(
      child: VisibilityDetector(
        key: const Key('educationSection'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.3) {
            educationKey.currentState?.playAnimation();
          } else if (info.visibleFraction == 0.0) {
            educationKey.currentState?.resetAnimation();
          }
        },
        child: WaterfallAnimationWidget(
          key: educationKey,
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 100),
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
      ),
    );
  }
  
  experienceStepper() {
    return SizedBox(
      child: VisibilityDetector(
        key: const Key('experienceSection'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.3) {
            experienceKey.currentState?.playAnimation();
          } else if (info.visibleFraction == 0.0){
            experienceKey.currentState?.resetAnimation();
          }
        },
        child: WaterfallAnimationWidget(
          key: experienceKey,
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 100),
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
      ),
    );
  }

  skillSection(){
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconWithTitleContainer(icon: Icons.lightbulb, title: "Skills"),

          SizedBox(height: DeviceSize.height*0.03),

          Container(
            margin: EdgeInsets.only(left: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.03),
            child: Wrap(
              runSpacing: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.05,
              spacing: DeviceSize.isLargeScreen ? DeviceSize.width*0.02 : DeviceSize.width*0.05,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: skills.map((item) => skillCard(item),).toList(),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget skillCard(Map<String, dynamic> item) {
    return Container(
      width: DeviceSize.isLargeScreen ? DeviceSize.width*0.14 : DeviceSize.width*0.4,
      height: DeviceSize.isLargeScreen ? DeviceSize.height*0.23 : DeviceSize.height*0.15,
      decoration: BoxDecoration(
        color: AppColor.darkPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.cyan.withOpacity(.2),
             offset: const Offset(1, 1),
             blurRadius: 1,
             spreadRadius: .5
          )
        ]
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColor.vegasGold,
                  value: item["score"]/100,
                  backgroundColor: AppColor.cyan.withOpacity(.1),
                  strokeCap: StrokeCap.round,
                ),

                Text(
                  "${item["score"]}%", // Display percentage
                  style: TextStyle(
                    color: AppColor.vegasGold,
                    fontWeight: FontWeight.bold,
                    fontSize: DeviceSize.isLargeScreen ? DeviceSize.width * 0.01 : DeviceSize.width*0.025,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              width: DeviceSize.width,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: DeviceSize.isLargeScreen ? DeviceSize.width*0.01 : DeviceSize.width*0.02),
              margin: EdgeInsets.only(bottom: DeviceSize.isLargeScreen ? DeviceSize.width*0.01 : DeviceSize.width*0.01),
              child: Text(
                item["title"],
                style: GoogleFonts.paprika(
                  color: AppColor.lightPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.01 : (DeviceSize.isTablet? DeviceSize.width*0.025 :DeviceSize.width*0.03),
                  height: 1.2
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

}