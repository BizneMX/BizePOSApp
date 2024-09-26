import 'package:bizne_fonda_app/app/modules/home/controller/reserves_history_controller.dart';
import 'package:get/get.dart';

class ReservesHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservesHistoryController());
  }
}
