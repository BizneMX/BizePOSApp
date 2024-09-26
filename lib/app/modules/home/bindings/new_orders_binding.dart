import 'package:bizne_fonda_app/app/data/repository/home/new_order_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/new_orders_controller.dart';
import 'package:get/get.dart';

class NewOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => NewOrdersController(repository: NewOrderRepositoryImpl()));
  }
}
