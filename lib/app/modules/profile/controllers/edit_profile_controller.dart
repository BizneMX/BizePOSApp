import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
import 'package:bizne_fonda_app/app/data/core/profile/profile_repository.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:bizne_fonda_app/app/utils/file.dart';
import 'package:bizne_fonda_app/app/utils/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EditProfileController extends LayoutRouteController {
  final ProfileRepository repository;

  EditProfileController({required this.repository});

  final formKey = GlobalKey<FormState>();

  var prefixPhone = '+52'.obs;

  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  var imgUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();

    initValues();
  }

  void initValues() async {
    final user = UserService.service.user!;

    nameController.text = user.name;
    lastNameController.text = user.lastName;
    emailController.text = user.email;
    imgUrl.value = user.pic ?? '';

    var aux = getPrefixPhone(user.phone);
    prefixPhone.value = aux.$1;
    phoneController.text = aux.$2;
  }

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

  void updateProfilePhoto(MyFile file) async {
    final base64 = await getBase64FormateFile(file.file.path);

    EasyLoading.show();
    final response = await repository.uploadFile(base64);
    EasyLoading.dismiss();

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    imgUrl.value = response.data!.pic ?? '';
  }

  void save() async {
    if (!formKey.currentState!.validate()) return;

    EasyLoading.show();
    final response = await repository.editProfile(
        nameController.text,
        lastNameController.text,
        prefixPhone + phoneController.text,
        emailController.text);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    UserService.service.user!.email = response.data!.email;
    UserService.service.user!.phone = response.data!.phone;
    UserService.service.user!.name = response.data!.name;
    UserService.service.user!.lastName = response.data!.lastName;

    popNavigate();
  }
}
