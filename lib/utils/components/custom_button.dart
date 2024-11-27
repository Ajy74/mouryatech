import 'package:flutter/material.dart';
import 'package:mourytech/configs/colors/colors.dart';


class CustomButton extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;
  final double height ;
  final double width ;
  final double radius ;
  final double textSize ;
  final Color buttonColor;
  final Color textColor;
  const CustomButton({super.key ,
    required this.title,
    this.loading = false ,
    required this.onPress ,
    this.height = 40,
    this.radius = 10,
    this.width = 200,
    this.textSize = 15,
    this.buttonColor = AppColor.lightColor7,
    this.textColor = AppColor.lightPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? (){} :onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius)
        ),
        child: Center(
            child:loading ? const CircularProgressIndicator(color: Colors.white,) :
            Text(
              title ,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1
              ),
              overflow: TextOverflow.ellipsis,
            )
        ),
      ),
    );
  }
}
