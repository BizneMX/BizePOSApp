import 'package:bizne_fonda_app/app/data/repository/home/menu_of_day_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/menu_of_day_controller.dart';
import 'package:get/get.dart';

class MenuOfDayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => MenuOfDayController(repository: MenuOfDayRepositoryImpl()));
  }
}
