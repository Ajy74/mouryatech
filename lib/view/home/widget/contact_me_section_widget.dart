import 'package:flutter/material.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/home/widget/form/contact_form_widget.dart';

class ContactMeSectionWidget extends StatelessWidget {
  const ContactMeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cyan.withOpacity(.02),
      child: Column(
        children: [
          titleContainer(),

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
              left: DeviceSize.isLargeScreen ? DeviceSize.width*0.15 :DeviceSize.width*0.05,
              right: DeviceSize.isLargeScreen ? DeviceSize.width*0.15 :DeviceSize.width*0.05,
              bottom: DeviceSize.isLargeScreen ? DeviceSize.height*0.05 :DeviceSize.height*0.06,
            ),
            padding: EdgeInsets.only(
              bottom: DeviceSize.height*0.05
            ),
            child: const ContactFormWidget(),
          ),
        ],
      ),
    );
  }

  titleContainer() {
    return Container(
      margin: EdgeInsets.only(
        top: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.03
      ),
      alignment: Alignment.center,
      child: Text(
        "Contact Me",
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
  
}