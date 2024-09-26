import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/auth/comple_profile_repository.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_schedule_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  final CompleteProfileRepository repository;
  final String phone;

  CompleteProfileController({required this.phone, required this.repository});

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var step = 0.obs;

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }
    if (value.length < 8) {
      return 'passwordLength'.tr;
    }

    return null;
  }

  String? confirmValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'requiredField'.tr;
    }
    if (value.length < 8) {
      return 'passwordLength'.tr;
    }

    if (value != passwordController.text) {
      return 'passwordsDoNotMatch'.tr;
    }

    return null;
  }

  void next() async {
    if (!formKey.currentState!.validate()) return;

    EasyLoading.show();
    final response = await repository.setPassword(
        phone, passwordController.text, confirmController.text);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    UserService.service.login(response.data!.$2);
    step.value++;
  }

  void finish() async {
    if (!Get.find<AddScheduleController>().validate()) return;

    EasyLoading.show();
    final response = await repository
        .setSchedule(Get.find<AddScheduleController>().schedules);
    EasyLoading.dismiss(animation: true);
    print('aaa');

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    Get.offAllNamed(Routes.layout);
  }
}
