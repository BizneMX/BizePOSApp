import 'package:bizne_fonda_app/app/data/repository/home/historial_repository_impl.dart';
import 'package:get/get.dart';
import '../controller/historial_controller.dart';

class HistorialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => HistorialController(repository: HistorialRepositoryImpl()));
  }
}
