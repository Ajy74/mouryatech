import 'package:flutter/material.dart';
import 'package:mourytech/bloc/home/home_cubit.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:mourytech/view/home/widget/form/email_input_widget.dart';
import 'package:mourytech/view/home/widget/form/msg_input_widget.dart';
import 'package:mourytech/view/home/widget/form/name_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mourytech/view/home/widget/form/phone_input_widget.dart';
import 'package:mourytech/view/widget/custom_button_widget.dart';
import 'package:mourytech/view/widget/custom_snackbar.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          NameInputField(focusNode: context.read<HomeCubit>().nameFocus),
          SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.025,),

          EmailInputField(focusNode: context.read<HomeCubit>().emailFocus),
          SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.025,),

          PhoneInputField(focusNode: context.read<HomeCubit>().phoneFocus),
          SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.025,),

          MsgInputField(focusNode: context.read<HomeCubit>().msgFocus),
          SizedBox(height: DeviceSize.isLargeScreen ? DeviceSize.height*0.035 : DeviceSize.height*0.025,),

          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              top: DeviceSize.isLargeScreen ? DeviceSize.height*0.03 : DeviceSize.height*0.02,
              bottom: DeviceSize.isLargeScreen ? DeviceSize.height*0.03 : DeviceSize.height*0.03
            ),
            width: DeviceSize.width,
            height: DeviceSize.isLargeScreen ? DeviceSize.height*0.05 : DeviceSize.height*0.05,
            child: CustomButtonWidget(
              width: DeviceSize.isLargeScreen ? DeviceSize.width*0.1 : DeviceSize.width*0.3,
              title: "SEND", 
              textSize: DeviceSize.isLargeScreen ? DeviceSize.width*0.013 : DeviceSize.width*0.035,
              onPress: (){
                String name = context.read<HomeCubit>().nameController.text ;
                String email = context.read<HomeCubit>().emailController.text ;
                String msg = context.read<HomeCubit>().msgController.text ;

                if(name.isNotEmpty && email.isNotEmpty && msg.isNotEmpty){
                  context.read<HomeCubit>().sendMessage(context);
                }else{
                  customSnackBar(
                    context, 
                    "Please fill the form !", 
                    AppColor.bitterSweet, 
                    AppColor.lightPrimaryColor
                  );
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}