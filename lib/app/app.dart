import 'package:bizne_fonda_app/app/routes/app_pages.dart';
import 'package:bizne_fonda_app/app/services/translation_service.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

class BiznePosApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  BiznePosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppThemes().background,
        child: SafeArea(
            child: Container(
                color: AppThemes().background,
                child: Sizer(builder: (context, orientation, deviceType) {
                  return GetMaterialApp(
                    navigatorKey: _navigatorKey,
                    title: 'BiZne POS App',
                    theme: AppThemes().theme,
                    initialRoute: AppPages.initial,
                    getPages: AppPages.routes,
                    locale: Get.deviceLocale,
                    supportedLocales: const [
                      Locale('es', 'ES'),
                      Locale('en', 'US')
                    ],
                    fallbackLocale: const Locale('es', 'ES'),
                    translations: TranslationService(),
                    builder: EasyLoading.init(),
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                  );
                }))));
  }
}
