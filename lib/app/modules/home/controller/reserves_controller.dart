import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/home/reserves_repository.dart';
import 'package:bizne_fonda_app/app/models/home/reserve.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/utils/pagination_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ReservesController extends LayoutRouteController {
  ReservesRepository repository;

  ReservesController({required this.repository});

  late PaginationController<Reserve> paginationController;
  var firstSelected = true.obs;

  var total1 = 0.obs;
  var total2 = 0.obs;

  var menu1 = 0.obs;
  var menu2 = 0.obs;

  @override
  void onInit() {
    super.onInit();

    paginationController =
        PaginationController(loadData: (int size, int page) async {
      final responseNew =
          await repository.getReserves(1, page, firstSelected.value ? size : 1);
      final responseAccepted =
          await repository.getReserves(2, page, firstSelected.value ? 1 : size);

      if (!responseNew.success) {
        return responseNew.map((_) => null);
      }

      if (!responseAccepted.success) {
        await Get.dialog(BizneResponseErrorDialog(response: responseAccepted));
        return responseAccepted.map((_) => null);
      }

      total1.value = responseNew.data!.data.total;
      total2.value = responseAccepted.data!.data.total;

      final response = firstSelected.value ? responseNew : responseAccepted;

      menu1.value = response.data!.noMenu1;
      menu2.value = response.data!.noMenu2;

      return response.map((data) => data?.data);
    });

    Get.put(paginationController);
  }

  void accept(int id) async {
    EasyLoading.show();
    final response = await repository.acceptReserve(id);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    paginationController.getLoad(clear: true);
  }

  void reject(int id) async {
    EasyLoading.show();
    final response = await repository.rejectReserve(id);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    paginationController.getLoad(clear: true);
  }
}
