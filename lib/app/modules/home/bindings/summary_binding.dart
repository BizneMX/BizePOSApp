import 'package:bizne_fonda_app/app/data/repository/home/summary_repository_impl.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/summary_controller.dart';
import 'package:get/get.dart';

class SummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SummaryController(repository: SummaryRepositoryImpl()));
  }
}
