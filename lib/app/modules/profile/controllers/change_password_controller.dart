import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/profile/profile_repository.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ChangePasswordController extends LayoutRouteController {
  final ProfileRepository repository;

  ChangePasswordController({required this.repository});

  final formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? currentPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }
    if (value.length < 8) {
      return 'passwordLength'.tr;
    }

    return null;
  }

  String? newPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }
    if (value.length < 8) {
      return 'passwordLength'.tr;
    }

    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }
    if (value.length < 8) {
      return 'passwordLength'.tr;
    }

    if (value != newPasswordController.text) {
      return 'passwordsDoNotMatch'.tr;
    }

    return null;
  }

  void save() async {
    if (!formKey.currentState!.validate()) return;

    EasyLoading.show();
    final response = await repository.changePassword(
        currentPasswordController.text,
        newPasswordController.text,
        confirmPasswordController.text);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    popNavigate();
  }
}
