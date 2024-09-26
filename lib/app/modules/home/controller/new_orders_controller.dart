import 'package:bizne_fonda_app/app/data/core/home/new_order_repository.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/utils/pagination_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../components/dialog.dart';
import '../../../models/home/order.dart';

class NewOrdersController extends LayoutRouteController {
  final NewOrderRepository repository;

  late DateTime todayDate;
  final searchController = TextEditingController();

  late PaginationController<Order> paginationController;

  var total1 = 0.obs;
  var total2 = 0.obs;

  NewOrdersController({required this.repository});

  var firstSelected = true.obs;

  @override
  void onInit() {
    todayDate = DateTime.now();
    super.onInit();

    paginationController =
        PaginationController(loadData: (int size, int page) async {
      final response1 = await repository.getNewOrders(
          searchController.value.text,
          page,
          firstSelected.value ? size : 1,
          null);
      final response2 = await repository.getDeliveredOrders(
          searchController.value.text,
          page,
          !firstSelected.value ? size : 1,
          null);

      if (!response1.success) return response1;
      if (!response2.success) return response2;

      total1.value = response1.data!.total;
      total2.value = response2.data!.total;

      return firstSelected.value ? response1 : response2;
    });

    Get.put(paginationController, tag: 'newOrders');
  }

  void acceptOrder(Order order) async {
    EasyLoading.show();
    final response = await repository.acceptOrder(order.id);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    await paginationController.getLoad(clear: true);
  }

  @override
  void onClose() {
    super.onClose();

    paginationController.onClose();
  }

  @override
  void dispose() {
    super.dispose();

    paginationController.dispose();
  }
}
