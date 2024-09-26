import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class Environment {
  static const baseUrl = 'https://services.bizne.com.mx/api/v13.2/';

  static const menuBaseUrl = 'http://menu.bizne.com.mx/';

  static const apiKey = "Bizne*2022!_";

  static const whatsappContact = '+525529475684';

  static const googleApiKey = 'AIzaSyDakuTjAOjZKh6mxiTJ04-d6O-byXP3N9E';

  static const appDefaultLanguage = 'es';

  static const appBundleId = 'mx.bizne.kitchen';

  static const spriteApiKey = 'pk_live_DkvamrO5o9lxFEY2Q6RVyV1l00Vjb5ZanJ';

  static const termsAndConditions =
      'https://newadmin.bizne.com.mx/#/documents/terms-fonda';

  static const privacyPolicy =
      'https://newadmin.bizne.com.mx/#/documents/privacy';

  static const isDebugMode = true;
}

var enviroments = Environment();

class Device {
  bool isMobile(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return (screenWidth < 500);
  }

  bool isTablet(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return (screenWidth >= 500);
  }

  bool isPortrait() => SizerUtil.orientation == Orientation.portrait;

  bool isLandscape() => SizerUtil.orientation == Orientation.landscape;
}
