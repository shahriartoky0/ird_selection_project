import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_selection_project/data/utilities/path.dart';
import 'package:ird_selection_project/ui/screens/initial_page_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:3 ))
        .then((value) => Get.offAll(InitialPageScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
              Path.introLogo,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}
