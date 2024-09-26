import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/home/home_repository.dart';
import 'package:bizne_fonda_app/app/models/profile/training.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TrainingController extends LayoutRouteController {
  final HomeRepository repository;

  TrainingController({required this.repository});

  var data = <Training>[].obs;
  var noData = false.obs;

  @override
  void onInit() {
    super.onInit();

    load();
  }

  void load() async {
    EasyLoading.show();
    final response = await repository.getTrainings();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    data.value = response.data!;
    noData.value = response.data!.isEmpty;
  }
}
