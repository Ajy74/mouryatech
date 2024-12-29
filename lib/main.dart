// import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/bloc/home/home_cubit.dart';
import 'package:mourytech/bloc/theme/theme_cubit.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/configs/routes/routes.dart';
import 'package:mourytech/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  // if( !(Platform.isAndroid || Platform.isIOS) ){
  //   usePathUrlStrategy();
  // }

  usePathUrlStrategy();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'mourya-tech',
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: themeMode,
            routerConfig: AppRoutes.router,
          );
        },
      ),
    );
  }
}

TextTheme getTextThemes() {
  return GoogleFonts.leagueSpartanTextTheme(
    const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400)
    )
  );
}


ThemeData lightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.lightPrimaryColor,
      brightness: Brightness.light
    ),
    useMaterial3: true,
    textTheme: getTextThemes(),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        // if (states.contains(WidgetState.dragged)) {
        //   return AppColor.cyan;
        // }
        return AppColor.lightPrimaryColor;
      }),
      interactive: true,
      trackVisibility: WidgetStateProperty.all(false),
      trackColor: WidgetStateProperty.all(AppColor.lightPrimaryColor.withOpacity(0.1)), 
      trackBorderColor: WidgetStateProperty.all(AppColor.lightPrimaryColor.withOpacity(0.1)),
      thickness: WidgetStateProperty.all(4), 
      radius: const Radius.circular(12),
    )
  );
}

ThemeData darkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.darkPrimaryColor, 
      brightness: Brightness.dark
    ),
    useMaterial3: true,
    textTheme: getTextThemes(),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        // if (states.contains(WidgetState.dragged)) {
        //   return AppColor.cyan;
        // }
        return AppColor.darkPrimaryColor;
      }),
      interactive: true,
      trackVisibility: WidgetStateProperty.all(false),
      trackColor: WidgetStateProperty.all(AppColor.darkPrimaryColor.withOpacity(0.1)), 
      trackBorderColor: WidgetStateProperty.all(AppColor.darkPrimaryColor.withOpacity(0.1)),
      thickness: WidgetStateProperty.all(4), 
      radius: const Radius.circular(12),
    )
  );
}