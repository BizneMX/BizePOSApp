import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/auth/login_repository.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository repository;

  LoginController({required this.repository});

  var prefixPhone = '+52';

  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  var preLogin = true.obs;

  @override
  void onInit() {
    super.onInit();

    phoneController.addListener(autoCheckPhone);
  }

  @override
  void onClose() {
    super.onClose();

    phoneController.removeListener(autoCheckPhone);
  }

  void autoCheckPhone() {
    if (phoneController.text.length == 10) checkPhone();
  }

  void checkPhone() async {
    if (!formKey.currentState!.validate()) return;

    final phone = '$prefixPhone${phoneController.text}';

    EasyLoading.show();
    final response = await repository.checkPhone(phone);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    preLogin.value = false;
    if (response.data!) {
      Get.offAllNamed(Routes.completeProfile, arguments: phone);
    }
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

  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }

    return null;
  }

  void login() async {
    if (!formKey.currentState!.validate()) return;

    final phone = '$prefixPhone${phoneController.text}';

    EasyLoading.show();
    final response = await repository.login(phone, passwordController.text);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    UserService.service.login(response.data!.$2);

    Get.offAllNamed(Routes.layout);
  }
}
