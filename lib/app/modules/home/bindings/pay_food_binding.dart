import 'package:bizne_fonda_app/app/data/repository/home/make_a_charge_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/pay_food_controller.dart';
import 'package:get/get.dart';

class PayFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => PayFoodController(repository: MakeAChargeRepositoryImpl()));
  }
}
