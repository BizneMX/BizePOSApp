import 'package:bizne_fonda_app/app/modules/home/controller/success_payment_controller.dart';
import 'package:get/get.dart';

class SuccessPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessPaymentController());
  }
}
