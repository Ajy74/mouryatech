import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mourytech/bloc/home/home_cubit.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/home/widget/about_me_section_widget.dart';
import 'package:mourytech/view/home/widget/contact_me_section_widget.dart';
import 'package:mourytech/view/home/widget/info_section_widget.dart';
import 'package:mourytech/view/home/widget/logo_section_widget.dart';
import 'package:mourytech/view/home/widget/my_project_section_widget.dart';

class HomeMobileScreenWidget extends StatefulWidget {
  const HomeMobileScreenWidget({super.key});

  @override
  State<HomeMobileScreenWidget> createState() => _HomeMobileScreenWidgetState();
}

class _HomeMobileScreenWidgetState extends State<HomeMobileScreenWidget> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _infoSectionKey = GlobalKey();
  final GlobalKey _aboutMeSectionKey = GlobalKey();
  final GlobalKey _myProjectSectionKey = GlobalKey();
  final GlobalKey _contactMeSectionKey = GlobalKey();

  int _currentIndex = 0;

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

  // void _onScroll() {
  //   context.read<HomeCubit>().updateScrolling(_scrollController.offset <= 0);
  // }

  void _onScroll() {
    context.read<HomeCubit>().updateScrolling(_scrollController.offset <= 0);

    final scrollOffset = _scrollController.offset;

    // Get the context of each section
    final infoSectionContext = _infoSectionKey.currentContext;
    final aboutMeSectionContext = _aboutMeSectionKey.currentContext;
    final myProjectSectionContext = _myProjectSectionKey.currentContext;
    final contactMeSectionContext = _contactMeSectionKey.currentContext;

    if (infoSectionContext != null) {
      final infoBox = infoSectionContext.findRenderObject() as RenderBox;
      final infoOffset = infoBox.localToGlobal(Offset.zero).dy;

      if (scrollOffset >= infoOffset && scrollOffset < infoOffset + infoBox.size.height) {
        _updateCurrentIndex(0);
      }
    }

    if (aboutMeSectionContext != null) {
      final aboutMeBox = aboutMeSectionContext.findRenderObject() as RenderBox;
      final aboutMeOffset = aboutMeBox.localToGlobal(Offset.zero).dy;

      if (scrollOffset >= aboutMeOffset && scrollOffset < aboutMeOffset + aboutMeBox.size.height) {
        _updateCurrentIndex(1);
      }
    }

    if (myProjectSectionContext != null) {
      final projectBox = myProjectSectionContext.findRenderObject() as RenderBox;
      final projectOffset = projectBox.localToGlobal(Offset.zero).dy;

      if (scrollOffset >= projectOffset && scrollOffset < projectOffset + projectBox.size.height) {
        _updateCurrentIndex(2);
      }
    }

    if (contactMeSectionContext != null) {
      final contactBox = contactMeSectionContext.findRenderObject() as RenderBox;
      final contactOffset = contactBox.localToGlobal(Offset.zero).dy;

      if (scrollOffset >= contactOffset) {
        _updateCurrentIndex(3);
      }
    }
  }

  void _updateCurrentIndex(int newIndex) {
    if (_currentIndex != newIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
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

  void _onBottomNavigationTap(int index) {
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        // _scrollToSection(_infoSectionKey);
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut, 
        );
        break;
      case 1:
        _scrollToSection(_aboutMeSectionKey);
        break;
      case 2:
        _scrollToSection(_myProjectSectionKey);
        break;
      case 3:
        _scrollToSection(_contactMeSectionKey);
        break;
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
              SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight,),
          
              if(DeviceSize.isTablet)
              SizedBox(height: DeviceSize.height*0.05,),
          
              InfoSectionWidget(key: _infoSectionKey),
              AboutMeSectionWidget(key: _aboutMeSectionKey),
              MyProjectSectionWidget(key: _myProjectSectionKey),
              ContactMeSectionWidget(key: _contactMeSectionKey,)
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
                  menuCallbacks: const {},
                  selectedTitle: '',
                );
              }
              return const LogoSectionWidget(showShadow: false, menuCallbacks: {}, selectedTitle: '',);
            }, 
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: DeviceSize.width*0.03,vertical: DeviceSize.width*0.03),
            decoration: BoxDecoration(
              color: AppColor.darkPrimaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColor.cyan.withOpacity(0.04),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: _onBottomNavigationTap,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColor.orangeYellowCrayola,
                unselectedItemColor: AppColor.lightPrimaryColor.withOpacity(.5),
                showUnselectedLabels: true,
                backgroundColor: AppColor.darkColor1.withOpacity(.05),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.now_widgets_outlined),
                    label: "Info",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_3_rounded),
                    label: "About Me",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.workspaces_filled),
                    label: "Projects",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail),
                    label: "Contact Me",
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}








// infoSection() {
//   return Container(
//     width: DeviceSize.width,
//     height: DeviceSize.height-(kToolbarHeight + DeviceSize.width*0.04),
//     margin: EdgeInsets.symmetric(
//       horizontal: DeviceSize.width*0.025
//     ),  
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 2,
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: DeviceSize.width*0.01
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Hero(
//                   tag: "ajay",
//                   child: CircleAvatar(
//                     radius: DeviceSize.width*0.26,
//                     backgroundImage: const AssetImage("assets/images/ajay.jpg"),
//                   ),
//                 ),

//                 SizedBox(height: DeviceSize.width*0.06,),

//                 SizedBox(
//                   width: DeviceSize.width,
//                   child: AnimatedTextKit(
//                     animatedTexts: [
//                       RotateAnimatedText(
//                         "Flutter Developer",
//                         textStyle: GoogleFonts.paprika(
//                           fontSize: DeviceSize.width*0.055,
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.vegasGold
//                         ),
//                       ),
//                       RotateAnimatedText(
//                         "Backend Developer",
//                         textStyle: GoogleFonts.paprika(
//                           fontSize: DeviceSize.width*0.055,
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.cyan
//                         ),
//                       ),
//                       RotateAnimatedText(
//                         "Mobile Application Developer",
//                         textStyle: GoogleFonts.paprika(
//                           fontSize: DeviceSize.width*0.055,
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.orangeYellowCrayola
//                         ),
//                       ),
//                       RotateAnimatedText(
//                         "Node.js Developer",
//                         textStyle: GoogleFonts.paprika(
//                           fontSize: DeviceSize.width*0.055,
//                           fontWeight: FontWeight.bold,
//                           color: AppColor.cyan
//                         ),
//                       ),
//                       RotateAnimatedText(
//                         "Android Developer",
//                         textStyle: GoogleFonts.paprika(
//                           fontSize: DeviceSize.width*0.055,
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


//         Expanded(
//           flex: 3,
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: DeviceSize.width*0.05
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   child: Text(
//                     "Hello, I'm",
//                     style: GoogleFonts.paprika(
//                       fontSize: DeviceSize.width*0.05,
//                       fontWeight: FontWeight.bold,
//                       color: AppColor.vegasGold
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: DeviceSize.width*0.02,),
//                 Text(
//                   "Ajay Mourya",
//                   style: GoogleFonts.paprika(
//                     fontSize: DeviceSize.width*0.075,
//                     fontWeight: FontWeight.bold,
//                     color: AppColor.lightPrimaryColor
//                   ),
//                 ),

//                 SizedBox(height: DeviceSize.width*0.03,),
//                 SizedBox(
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "A ",
//                           style: GoogleFonts.paprika(
//                             fontSize: DeviceSize.width*0.04,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.lightPrimaryColor
//                           ),
//                         ),
//                         TextSpan(
//                           text: "Mobile Application Developer ",
//                           style: GoogleFonts.paprika(
//                             fontSize: DeviceSize.width*0.04,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.cyan
//                           ),
//                         ),
//                         TextSpan(
//                           text: "From ",
//                           style: GoogleFonts.paprika(
//                             fontSize: DeviceSize.width*0.04,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.lightPrimaryColor
//                           ),
//                         ),
//                         TextSpan(
//                           text: "Mumbai",
//                           style: GoogleFonts.paprika(
//                             fontSize: DeviceSize.width*0.04,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.lightColor7
//                           ),
//                         ),
//                       ]
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: DeviceSize.width*0.04,),
//                 SizedBox(
//                   child: Text(
//                     "Passionate about building impactful mobile experiences that blend creativity and functionality. With expertise in Flutter and backend development, I strive to create seamless, user-friendly applications. In addition to my technical skills, I enjoy exploring the latest trends in technology and continuously learning to stay ahead in this ever-evolving field.",
//                     style: GoogleFonts.paprika(
//                       fontSize: DeviceSize.width*0.032,
//                       color: AppColor.lightPrimaryColor,
//                       height: 1.5
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),

//                 SizedBox(height: DeviceSize.width*0.07,),
//                 SizedBox(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomButton(
//                         title: "Download CV", 
//                         height: DeviceSize.height*0.055,
//                         width: DeviceSize.width*0.32,
//                         radius: (DeviceSize.height*0.055)/2,
//                         textSize: DeviceSize.width*0.034,
//                         onPress: (){}
//                       ),

//                       SizedBox(width: DeviceSize.width*0.025,),
//                       IconButton(
//                         visualDensity: VisualDensity.compact,
//                         onPressed: (){}, 
//                         icon: FaIcon(
//                           FontAwesomeIcons.linkedinIn, 
//                           color: AppColor.lightSecondaryColor,
//                           size: DeviceSize.width*0.04,
//                         )
//                       ),

//                       IconButton(
//                         visualDensity: VisualDensity.compact,
//                         onPressed: (){}, 
//                         icon: FaIcon(
//                           FontAwesomeIcons.githubAlt, 
//                           color: AppColor.lightSecondaryColor,
//                           size: DeviceSize.width*0.04,
//                         )
//                       ),

//                       IconButton(
//                         visualDensity: VisualDensity.compact,
//                         onPressed: (){}, 
//                         icon: FaIcon(
//                           FontAwesomeIcons.instagram, 
//                           color: AppColor.lightSecondaryColor,
//                           size: DeviceSize.width*0.04,
//                         )
//                       ),
//                     ],
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