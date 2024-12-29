import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/view/widget/custom_snackbar.dart';
import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController msgController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode msgFocus = FocusNode();

  void updateScrolling(bool isAtTop){
    emit(ScrollUpdateState(scroll: isAtTop));
  }

  void sendMessage(BuildContext cntxt) async {
    String name = nameController.text, email=emailController.text, message=msgController.text , phone=phoneController.text;

    try {
      String formUrl = "https://docs.google.com/forms/d/e/1FAIpQLSd07yyl_2fZMfa_P3C-Z-WvhyBWNpa929YslvDGpQut5ncwaQ/formResponse?&submit=Submit?usp=pp_url&entry.2005620554=$name&entry.1045781291=$email&entry.1166974658=$phone&entry.839337160=$message";
      
      nameController.clear();
      emailController.clear();
      msgController.clear();

      final response = await http.get(Uri.parse(formUrl));

    if (response.statusCode == 200) {
      customSnackBar(
        // ignore: use_build_context_synchronously
        cntxt, 
        "Thank you for contacting me 🙏, i'll get back to you soon", 
        Colors.green, 
        AppColor.lightPrimaryColor
      );
    } else {
      // ignore: avoid_print
      print("Failed to submit form: ${response.statusCode}");

      customSnackBar(
        // ignore: use_build_context_synchronously
        cntxt, 
        "Please try again !", 
        AppColor.bitterSweet, 
        AppColor.lightPrimaryColor
      );
    }

    } on http.ClientException {
      customSnackBar(
        // ignore: use_build_context_synchronously
        cntxt, 
        "Thank you for contacting me 🙏, i'll get back to you soon", 
        Colors.green, 
        AppColor.lightPrimaryColor
      );
    }catch (e) {
      // ignore: avoid_print
        print("Error in submitting form >> \n${e.toString()}");

        customSnackBar(
          // ignore: use_build_context_synchronously
          cntxt, 
          "Something went wrong !", 
          AppColor.bitterSweet, 
          AppColor.lightPrimaryColor
        );
    }
  }


  // void sendMail(BuildContext cntxt) async {
  //   String name = nameController.text, email=emailController.text, message=msgController.text ;

  //   try {
  //     final Uri emailLaunchUri = Uri(
  //       scheme: 'mailto',
  //       path: 'mouryaajay7463@gmail.com',
  //       query: 'subject=Contact from $name&body=Name: $name\nEmail: $email\nMessage:\n$message',
  //     );

  //     if (await canLaunchUrl(emailLaunchUri)) {
  //       nameController.clear();
  //       emailController.clear();
  //       msgController.clear();
      
  //       await launchUrl(emailLaunchUri);
  //     } else {
  //       // ignore: avoid_print
  //       print("Could not launch email client");

  //       customSnackBar(
  //         // ignore: use_build_context_synchronously
  //         cntxt, 
  //         "Please try again !", 
  //         AppColor.bitterSweet, 
  //         AppColor.lightPrimaryColor
  //       );
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //       print("Error in launching email client");

  //       customSnackBar(
  //         // ignore: use_build_context_synchronously
  //         cntxt, 
  //         "Something went wrong !", 
  //         AppColor.bitterSweet, 
  //         AppColor.lightPrimaryColor
  //       );
  //   }
  // }
  
}
