import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mourytech/bloc/home/home_cubit.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/home/widget/about_me_section_widget.dart';
import 'package:mourytech/view/home/widget/info_section_widget.dart';
import 'package:mourytech/view/home/widget/logo_section_widget.dart';
import 'package:mourytech/view/home/widget/my_project_section_widget.dart';

class HomeLargeScreenWidget extends StatefulWidget {
  const HomeLargeScreenWidget({super.key});

  @override
  State<HomeLargeScreenWidget> createState() => _HomeLargeScreenWidgetState();
}

class _HomeLargeScreenWidgetState extends State<HomeLargeScreenWidget> {

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _infoSectionKey = GlobalKey();
  final GlobalKey _aboutMeSectionKey = GlobalKey();
  final GlobalKey _myProjectSectionKey = GlobalKey();
  final GlobalKey _hireMeSectionKey = GlobalKey();
  
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    context.read<HomeCubit>().updateScrolling(_scrollController.offset <= 0);
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(height: DeviceSize.width*0.04 + MediaQuery.of(context).padding.top + kToolbarHeight,),
              InfoSectionWidget(key: _infoSectionKey),
              AboutMeSectionWidget(key: _aboutMeSectionKey),
              MyProjectSectionWidget(key: _myProjectSectionKey),
              Container(key: _hireMeSectionKey, height: 300, color: Colors.red),
            ],
          ),
        ),

        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: BlocBuilder<HomeCubit,HomeState>(
            buildWhen: (previous, current) => current is HomeInitialState || current is ScrollUpdateState,
            builder: (context, state) {
              if (state is ScrollUpdateState) {
                return LogoSectionWidget(
                  showShadow: !state.scroll,
                  menuCallbacks: {
                    "Home": () => _scrollToSection(_infoSectionKey),
                    "About Me": () => _scrollToSection(_aboutMeSectionKey),
                    "Projects": () => _scrollToSection(_myProjectSectionKey),
                    "Hire Me": () => _scrollToSection(_hireMeSectionKey),
                  },
                );
              }
              return LogoSectionWidget(
                showShadow: false,
                menuCallbacks: {
                  "Home": () => _scrollToSection(_infoSectionKey),
                  "About Me": () => _scrollToSection(_aboutMeSectionKey),
                  "Projects": () => _scrollToSection(_myProjectSectionKey),
                  "Hire Me": () => _scrollToSection(_hireMeSectionKey),
                },
              );
            }, 
          ),
        ),
      ],
    );
  }

  // infoSection() {
  //   return Container(
  //     width: DeviceSize.width,
  //     height: DeviceSize.height-(DeviceSize.height/2.2),
  //     margin: EdgeInsets.symmetric(
  //       horizontal: DeviceSize.width*0.025
  //     ),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           flex: 3,
  //           child: Container(
  //             padding: EdgeInsets.symmetric(
  //               horizontal: DeviceSize.width*0.02
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(
  //                   child: Text(
  //                     "Hello, I'm",
  //                     style: GoogleFonts.paprika(
  //                       fontSize: DeviceSize.width*0.015,
  //                       fontWeight: FontWeight.bold,
  //                       color: AppColor.vegasGold
  //                     ),
  //                   ),
  //                 ),

  //                 SizedBox(height: DeviceSize.width*0.01,),
  //                 Text(
  //                   "Ajay Mourya",
  //                   style: GoogleFonts.paprika(
  //                     fontSize: DeviceSize.width*0.025,
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColor.lightPrimaryColor
  //                   ),
  //                 ),

  //                 SizedBox(height: DeviceSize.width*0.012,),
  //                 SizedBox(
  //                   child: RichText(
  //                     text: TextSpan(
  //                       children: [
  //                         TextSpan(
  //                           text: "A ",
  //                           style: GoogleFonts.paprika(
  //                             fontSize: DeviceSize.width*0.015,
  //                             fontWeight: FontWeight.bold,
  //                             color: AppColor.lightPrimaryColor
  //                           ),
  //                         ),
  //                         TextSpan(
  //                           text: "Mobile Application Developer ",
  //                           style: GoogleFonts.paprika(
  //                             fontSize: DeviceSize.width*0.015,
  //                             fontWeight: FontWeight.bold,
  //                             color: AppColor.cyan
  //                           ),
  //                         ),
  //                         TextSpan(
  //                           text: "From ",
  //                           style: GoogleFonts.paprika(
  //                             fontSize: DeviceSize.width*0.015,
  //                             fontWeight: FontWeight.bold,
  //                             color: AppColor.lightPrimaryColor
  //                           ),
  //                         ),
  //                         TextSpan(
  //                           text: "Mumbai",
  //                           style: GoogleFonts.paprika(
  //                             fontSize: DeviceSize.width*0.015,
  //                             fontWeight: FontWeight.bold,
  //                             color: AppColor.lightColor7
  //                           ),
  //                         ),
  //                       ]
  //                     ),
  //                   ),
  //                 ),

  //                 SizedBox(height: DeviceSize.width*0.02,),
  //                 SizedBox(
  //                   child: Text(
  //                     "Passionate about building impactful mobile experiences that blend creativity and functionality. With expertise in Flutter and backend development, I strive to create seamless, user-friendly applications. In addition to my technical skills, I enjoy exploring the latest trends in technology and continuously learning to stay ahead in this ever-evolving field.",
  //                     style: GoogleFonts.paprika(
  //                       fontSize: DeviceSize.width*0.011,
  //                       color: AppColor.lightPrimaryColor
  //                     ),
  //                   ),
  //                 ),

  //                 SizedBox(height: DeviceSize.width*0.03,),
  //                 SizedBox(
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       CustomButton(
  //                         title: "Download CV", 
  //                         height: DeviceSize.height*0.07,
  //                         width: DeviceSize.width*0.12,
  //                         radius: (DeviceSize.height*0.07)/2,
  //                         textSize: DeviceSize.width*0.012,
  //                         onPress: (){}
  //                       ),

  //                       SizedBox(width: DeviceSize.width*0.03,),
  //                       IconButton(
  //                         onPressed: (){}, 
  //                         icon: FaIcon(
  //                           FontAwesomeIcons.linkedinIn, 
  //                           color: AppColor.lightSecondaryColor,
  //                           size: DeviceSize.width*0.012,
  //                         )
  //                       ),

  //                       IconButton(
  //                         onPressed: (){}, 
  //                         icon: FaIcon(
  //                           FontAwesomeIcons.githubAlt, 
  //                           color: AppColor.lightSecondaryColor,
  //                           size: DeviceSize.width*0.012,
  //                         )
  //                       ),

  //                       IconButton(
  //                         onPressed: (){}, 
  //                         icon: FaIcon(
  //                           FontAwesomeIcons.instagram, 
  //                           color: AppColor.lightSecondaryColor,
  //                           size: DeviceSize.width*0.012,
  //                         )
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),

  //         Expanded(
  //           flex: 2,
  //           child: Container(
  //             alignment: Alignment.center,
  //             padding: EdgeInsets.symmetric(
  //               horizontal: DeviceSize.width*0.01
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Hero(
  //                   tag: "ajay",
  //                   child: CircleAvatar(
  //                     radius: DeviceSize.width*0.08,
  //                     backgroundImage: const AssetImage("assets/images/ajay.jpg"),
  //                   ),
  //                 ),

  //                 SizedBox(height: DeviceSize.width*0.03,),

  //                 SizedBox(
  //                   width: DeviceSize.width,
  //                   child: AnimatedTextKit(
  //                     animatedTexts: [
  //                       RotateAnimatedText(
  //                         "Flutter Developer",
  //                         textStyle: GoogleFonts.paprika(
  //                           fontSize: DeviceSize.width*0.02,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColor.vegasGold
  //                         ),
  //                       ),
  //                       RotateAnimatedText(
  //                         "Backend Developer",
  //                         textStyle: GoogleFonts.paprika(
  //                           fontSize: DeviceSize.width*0.02,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColor.cyan
  //                         ),
  //                       ),
  //                       RotateAnimatedText(
  //                         "Mobile Application Developer",
  //                         textStyle: GoogleFonts.paprika(
  //                           fontSize: DeviceSize.width*0.02,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColor.orangeYellowCrayola
  //                         ),
  //                       ),
  //                       RotateAnimatedText(
  //                         "Node.js Developer",
  //                         textStyle: GoogleFonts.paprika(
  //                           fontSize: DeviceSize.width*0.02,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColor.cyan
  //                         ),
  //                       ),
  //                       RotateAnimatedText(
  //                         "Android Developer",
  //                         textStyle: GoogleFonts.paprika(
  //                           fontSize: DeviceSize.width*0.02,
  //                           fontWeight: FontWeight.bold,
  //                           color: AppColor.lightPrimaryColor
  //                         ),
  //                       ),
  //                     ],
  //                     repeatForever: true,
  //                     pause: const Duration(milliseconds: 500),
  //                     displayFullTextOnTap: true,
  //                     stopPauseOnTap: true,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}