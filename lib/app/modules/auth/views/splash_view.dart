import 'package:bizne_fonda_app/app/modules/auth/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Image.asset(
              'assets/icons/logo.png',
              height: 25.h,
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              'assets/images/splash_banner1.png',
              width: 80.w,
            ),
            SizedBox(
              height: 4.h,
            ),
            Image.asset(
              'assets/images/splash_banner2.png',
              width: 75.w,
            ),
            SizedBox(
              height: 2.h,
            ),
            Image.asset('assets/images/splash_image.png')
          ],
        ));
  }
}
