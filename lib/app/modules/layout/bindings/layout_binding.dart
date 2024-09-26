import 'package:bizne_fonda_app/app/data/repository/home/home_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:get/get.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController(repository: HomeRepositoryImpl()));
  }
}
