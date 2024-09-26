import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/profile/profile_repository.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class QrCodeController extends LayoutRouteController {
  final ProfileRepository repository;

  QrCodeController({required this.repository});

  var data = ''.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  void load() async {
    EasyLoading.show();
    final response = await repository.getQr();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    data.value = response.data!;
  }
}
