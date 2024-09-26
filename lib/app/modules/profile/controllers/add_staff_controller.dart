import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/profile/staff_repository.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AddStaffController extends LayoutRouteController {
  final StaffRepository repository;

  AddStaffController({required this.repository});

  final formKey = GlobalKey<FormState>();

  var prefixPhone = '+52';

  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }

    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }

    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }

    if (value.split(' ').length != 2) {
      return 'mustIncludeLastName'.tr;
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }

    if (!value.isEmail) {
      return 'invalidEmail'.tr;
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }
    if (value.length < 8) {
      return 'passwordLength'.tr;
    }

    return null;
  }

  void save() async {
    if (!formKey.currentState!.validate()) return;

    EasyLoading.show();
    final response = await repository.addStaff(
        nameController.text,
        lastNameController.text,
        prefixPhone + phoneController.text,
        emailController.text,
        passwordController.text);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    popNavigate();
  }
}
