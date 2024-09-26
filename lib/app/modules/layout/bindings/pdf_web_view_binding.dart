import 'package:bizne_fonda_app/app/modules/layout/controllers/pdf_web_view_controller.dart';
import 'package:get/get.dart';

class BiznePDFWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BiznePDFWebViewController());
  }
}
