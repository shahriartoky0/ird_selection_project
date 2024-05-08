import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_selection_project/ui/screens/splash_screen.dart';
import 'package:ird_selection_project/ui/style/colors.dart';

import 'ui/screens/initial_page_screen.dart';

class HadisApp extends StatelessWidget {
  const HadisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: AppBarTheme(
              color: greenColor, iconTheme: IconThemeData(color: Colors.white)),
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: bodyBackGroundColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: 'kalpurush'),
            displaySmall: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.75,
                fontSize: 19,
                color: Colors.black,
                fontFamily: 'kalpurush'),
            labelMedium: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.75,
                fontSize: 19,
                color: greyTextColor,
                fontFamily: 'kalpurush'),
            labelSmall: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.75,
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'kalpurush'),
          )),
    );
  }
}
