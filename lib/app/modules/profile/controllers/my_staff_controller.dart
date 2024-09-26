import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/profile/staff_repository.dart';
import 'package:bizne_fonda_app/app/models/profile/staff.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyStaffController extends LayoutRouteController {
  final StaffRepository repository;

  MyStaffController({required this.repository});

  final data = <Staff>[].obs;
  var noData = false.obs;

  @override
  void onInit() {
    super.onInit();

    load();
  }

  void load() async {
    EasyLoading.show();
    final response = await repository.getStaff();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    data.value = response.data!;
    noData.value = response.data!.isEmpty;
  }

  void blockUnBlock(int ind) async {
    EasyLoading.show();
    final response =
        await repository.blockUnBlock(!data[ind].isBlock, data[ind].id);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    data.value = data.asMap().entries.map((e) {
      if (e.key == ind) {
        e.value.isBlock = !e.value.isBlock;
      }
      return e.value;
    }).toList();
  }
}
