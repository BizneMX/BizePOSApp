import 'package:bizne_fonda_app/app/app.dart';
import 'package:bizne_fonda_app/app/services/camera_service.dart';
import 'package:bizne_fonda_app/app/services/connectivity_service.dart';
import 'package:bizne_fonda_app/app/services/firebase_service.dart';
import 'package:bizne_fonda_app/app/services/translation_service.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  await Firebase.initializeApp();

  // Translation
  await TranslationService().loadTranslations();

  // User
  await Get.putAsync(() => UserService().init());

  // Connectivity
  await Get.putAsync(() => ConnectivityService().init());

  // Camera
  await Get.putAsync(() => CameraService().init());

  await Get.putAsync(() => NotificationHandler().init());

  await Get.putAsync(() => PushNotifications().init());

  // // location
  // await Get.putAsync(() => LocationProvide().init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();
  configLoading();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(BiznePosApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false;
}
