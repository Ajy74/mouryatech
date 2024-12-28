import 'package:flutter/material.dart';
import 'package:mourytech/bloc/home/home_cubit.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/utils/device_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameInputField extends StatelessWidget {
  final FocusNode focusNode;
  const NameInputField({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    final double size = DeviceSize.width ;

    return TextFormField(
      controller: context.read<HomeCubit>().nameController,
      focusNode: focusNode,
      cursorColor: AppColor.lightPrimaryColor,
      cursorWidth: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(DeviceSize.isLargeScreen ? size*0.01 : size*0.02)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.lightPrimaryColor),
          borderRadius: BorderRadius.all(Radius.circular(DeviceSize.isLargeScreen ? size*0.01 : size*0.02)),
        ),
        contentPadding: DeviceSize.isLargeScreen ? null : const EdgeInsets.fromLTRB(12, 6, 12, 6),
        hintText: "Enter your name",
        hintStyle: TextStyle(
            color: AppColor.lightSecondaryColor,
            fontWeight: FontWeight.w400,
            fontSize: DeviceSize.isLargeScreen ? 20 : null
        ),
      ),
      style: TextStyle(
          color: AppColor.lightPrimaryColor,
          fontSize: DeviceSize.isLargeScreen ? 20 : null
      ),
      keyboardType: TextInputType.text,
      minLines: 1,
      maxLines: 1,
      onChanged: (value) {
        
      },
      validator: (value) {
        // if (value!.isEmpty) {
        //   return '';
        // }
        return null;
      },
      textInputAction: TextInputAction.next,
    );
  }
}