import 'package:bizne_fonda_app/app/data/repository/home/home_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/training_controller.dart';
import 'package:get/get.dart';

class TrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrainingController(repository: HomeRepositoryImpl()));
  }
}
