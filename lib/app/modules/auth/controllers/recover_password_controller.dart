import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController {
  final LoginRepository repository;

  RecoverPasswordController({required this.repository});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'requiredField'.tr;
    if (!value.isEmail) return 'invalidEmail'.tr;

    return null;
  }

  void recoverPassword() async {
    if (!formKey.currentState!.validate()) return;

    EasyLoading.show();
    final response = await repository.recoverPassword(emailController.text);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    Get.back();
  }
}
