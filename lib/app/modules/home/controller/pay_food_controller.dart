import 'package:bizne_fonda_app/app/data/core/home/make_a_charge_repository.dart';
import 'package:bizne_fonda_app/app/models/home/scan_qr.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/error_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PayFoodController extends LayoutRouteController {
  final MakeAChargeRepository repository;

  PayFoodController({required this.repository});

  late ScanQr arguments;

  @override
  void onInit() {
    super.onInit();

    arguments = getArguments();
  }

  void payFood() async {
    EasyLoading.show();
    final response =
        await repository.makeACharge(arguments.userId, arguments.total);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      navigate(Routes.error,
          arguments: ErrorArguments(
              description: response.message ?? 'unexpectedError'.tr,
              error: 'notPossibleToCharge'.tr));
      return;
    }

    navigate(Routes.successPayment, arguments: arguments.total);
  }
}
