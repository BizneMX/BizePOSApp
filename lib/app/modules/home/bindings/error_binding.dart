import 'package:bizne_fonda_app/app/modules/home/controller/error_controller.dart';
import 'package:get/get.dart';

class ErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ErrorController());
  }
}
