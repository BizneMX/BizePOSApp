import 'dart:io';

import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/home/home_repository.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/routes/layout_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final HomeRepository repository;

  LayoutController({required this.repository});

  var stack = <(String, dynamic)>[(Routes.home, null)];
  var inService = false.obs;
  var showFooter = true.obs;

  void navigate(String route, {dynamic arguments}) async {
    final page =
        LayoutPages.pages.where((element) => element.route == route).first;

    if (route == Routes.home) stack.clear();

    stack.add((route, arguments));

    showFooter.value = page.showFooter;

    Get.offAllNamed(page.route, id: 1);
  }

  void popNavigate({
    int cant = 1,
  }) async {
    if (!LayoutPages.pages
        .where((element) => element.route == stack.last.$1)
        .first
        .canPop) return;

    if (stack.length == 1) {
      await Get.dialog(BizneDialog(
        text: 'exitApp'.tr,
        onOk: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop(); // Cierra la aplicación en Android
          } else if (Platform.isIOS) {
            exit(0); // Cierra la aplicación en iOS
          }
        },
        onCancel: () => Get.back(),
      ));

      return;
    }

    for (var i = 0; i < cant; i++) {
      _popNavigate(i == cant - 1);
    }

    final page = LayoutPages.pages
        .where((element) => element.route == stack.last.$1)
        .first;
    showFooter.value = page.showFooter;
  }

  void _popNavigate(bool navigate) async {
    stack.removeLast();

    if (navigate) Get.offAllNamed(stack.last.$1, id: 1);
  }

  void changeStatus(bool value) async {
    EasyLoading.show();
    final response = await repository.changeStatus(value);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    inService.value = value;
  }

  Route? onGenerateRoute(RouteSettings settings) {
    for (var i in LayoutPages.pages) {
      if (i.route == settings.name) {
        return GetPageRoute(
            transition: Transition.fadeIn,
            settings: settings,
            page: i.page,
            binding: i.bindings);
      }
    }

    return null;
  }
}

abstract class LayoutRouteController extends GetxController {
  final layoutController = Get.find<LayoutController>();

  void navigate(String route, {dynamic arguments}) {
    layoutController.navigate(route, arguments: arguments);
  }

  void popNavigate({int cant = 1}) => layoutController.popNavigate(cant: cant);

  dynamic getArguments() => layoutController.stack.last.$2;
}
