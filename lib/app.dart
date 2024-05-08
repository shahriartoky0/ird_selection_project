import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_selection_project/controller/section_query_controller.dart';
import 'package:ird_selection_project/ui/style/colors.dart';

import 'controller/books_query_controller.dart';
import 'controller/chapter_query_controller.dart';
import 'controller/hadith_query_controller.dart';
import 'data/database_helper/dbhelper.dart';
import 'ui/screens/initial_page_screen.dart';

class HadisApp extends StatelessWidget {
  const HadisApp({super.key});

  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      home: InitialPageScreen(),
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
                fontWeight: FontWeight.w500,
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
      initialBinding: ControllerBinders(),
    );
  }
}

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(DbHelperController());
    Get.put((BooksQueryController()));
    Get.put((ChapterQueryController()));
    Get.put((HadithQueryController()));
    Get.put((SectionQueryController()));
  }
}
