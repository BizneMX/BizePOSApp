import 'package:bizne_fonda_app/app/modules/layout/controllers/web_view_controller.dart';
import 'package:get/get.dart';

class BizneWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BizneWebViewController());
  }
}
