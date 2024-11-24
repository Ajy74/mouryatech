import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mourytech/bloc/theme/theme_cubit.dart';
import 'package:mourytech/configs/colors/colors.dart';
import 'package:mourytech/configs/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(),),
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
  );
}