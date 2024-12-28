import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/view/widget/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController msgController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode msgFocus = FocusNode();

  void updateScrolling(bool isAtTop){
    emit(ScrollUpdateState(scroll: isAtTop));
  }

  void sendMail(BuildContext cntxt) async {
    String name = nameController.text, email=emailController.text, message=msgController.text ;

    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'mouryaajay7463@gmail.com',
        query: 'subject=Contact from $name&body=Name: $name\nEmail: $email\nMessage:\n$message',
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        nameController.clear();
        emailController.clear();
        msgController.clear();
      
        await launchUrl(emailLaunchUri);
      } else {
        // ignore: avoid_print
        print("Could not launch email client");

        customSnackBar(
          // ignore: use_build_context_synchronously
          cntxt, 
          "Please try again !", 
          AppColor.bitterSweet, 
          AppColor.lightPrimaryColor
        );
      }
    } catch (e) {
      // ignore: avoid_print
        print("Error in launching email client");

        customSnackBar(
          // ignore: use_build_context_synchronously
          cntxt, 
          "Something went wrong !", 
          AppColor.bitterSweet, 
          AppColor.lightPrimaryColor
        );
    }
  }
  
}
