import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';

class SuccessPaymentController extends LayoutRouteController {
  late double total;

  @override
  void onInit() {
    super.onInit();

    total = getArguments();
  }
}
