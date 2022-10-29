import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loc_reminder_app/utils/appconstants.dart';

import '../controller/initial_controller.dart';
import '../routes/routes.dart';

class SplashScreen extends GetWidget<InitialController> {
  const SplashScreen({Key? key}) : super(key: key);

  goToNextScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      bool? isFirstTime = controller.getPreferences().getBool(AppConstants.isFirstTime);
      if (isFirstTime != null && isFirstTime == false) {
        Get.offNamed(Routes.login);
      } else {
        Get.offNamed(Routes.getStarted);
      }
    } else {
      Get.offNamed(Routes.main);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      goToNextScreen();
    });

    return EasySplashScreen(
      logo: const Image(image: AssetImage("assets/images/splashscreen_image.png")),
      durationInSeconds: 5,
      logoSize: Get.mediaQuery.size.width * 0.4,
      title: Text(
        "Loc Reminder",
        style: TextStyle(
          fontSize: Get.mediaQuery.size.width * 0.05,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      showLoader: false,
      backgroundColor: const Color.fromARGB(255, 20, 0, 35),
    );
  }
}