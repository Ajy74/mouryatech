import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/bloc/theme/theme_cubit.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';

class LogoSectionWidget extends StatelessWidget {
  const LogoSectionWidget({super.key, required this.showShadow});

  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    double logoTextSize = DeviceSize.isLargeScreen?DeviceSize.width*0.025:DeviceSize.width*0.08;
    double bodyMarginHorizontal = DeviceSize.isLargeScreen?DeviceSize.width*0.025:DeviceSize.width*0.05;
    double bodyMarginVertical = DeviceSize.isLargeScreen?DeviceSize.width*0.015:MediaQuery.of(context).padding.top;
    // double bodyMarginVertical = DeviceSize.isLargeScreen?DeviceSize.width*0.015:DeviceSize.width*0.05;
    double modeIconSize = DeviceSize.isLargeScreen?DeviceSize.width*0.017:DeviceSize.width*0.06;

    return Container(
      padding: EdgeInsets.only(
        left: bodyMarginHorizontal,
        right: bodyMarginHorizontal,
        top: bodyMarginVertical,
        bottom: DeviceSize.isLargeScreen?bodyMarginVertical:bodyMarginVertical/3,
      ),
      decoration: BoxDecoration(
        color: AppColor.getPrimaryColor(context),
        boxShadow: [
          BoxShadow(
            color: showShadow ? AppColor.getSecondaryColor(context).withOpacity(.7) : Colors.transparent,
            blurRadius: 7,
            spreadRadius: 1,
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            selectionColor: AppColor.lightPrimaryColor,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "mourya",
                  style: GoogleFonts.dancingScript(
                    color: AppColor.cyan,
                    fontSize: logoTextSize,
                  )
                ),
                TextSpan(
                  text: "tech",
                  style: GoogleFonts.dancingScript(
                    color: AppColor.vegasGold,
                    fontSize: logoTextSize,
                  )
                )
              ]
            )
          ),

          const Spacer(),

          IconButton(
            onPressed: (){
              context.read<ThemeCubit>().toggleTheme();
            }, 
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark ? Icons.light_mode_outlined :Icons.dark_mode_outlined, 
              color: Theme.of(context).brightness == Brightness.dark ?AppColor.lightSecondaryColor:AppColor.darkSecondaryColor,
              size: modeIconSize,
            )
          )
        ],
      ),
    );
  }
}