import 'package:bizne_fonda_app/app/data/repository/home/reserves_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/reserves_controller.dart';
import 'package:get/get.dart';

class ReservesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReservesController(repository: ReservesRepositoryImpl()));
  }
}
