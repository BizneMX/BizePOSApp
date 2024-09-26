import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/data/core/home/summary_repository.dart';
import 'package:bizne_fonda_app/app/models/home/summary_data.dart';
import 'package:bizne_fonda_app/app/models/home/summary_week.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SummaryController extends LayoutRouteController {
  final SummaryRepository repository;

  SummaryController({required this.repository});

  var summaryData = SummaryData(total: 0, foods: 0).obs;
  var summaryWeek = SummaryWeek(days: [], id: 0, week: '', total: 0).obs;

  @override
  void onInit() {
    super.onInit();

    load();
  }

  void load() async {
    EasyLoading.show();
    final responseData = await repository.getSummaryData();
    final responseWeek = await repository.currentWeek();
    EasyLoading.dismiss(animation: true);

    if (!responseData.success) {
      await Get.dialog(BizneResponseErrorDialog(response: responseData));
      return;
    }

    if (!responseWeek.success) {
      await Get.dialog(BizneResponseErrorDialog(response: responseWeek));
      return;
    }

    summaryData.value = responseData.data!;
    summaryWeek.value = responseWeek.data!;
  }

  void move(int move) async {
    EasyLoading.show();
    final response = await repository.getWeek(summaryWeek.value.id, move);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    summaryWeek.value = response.data!;
  }

  void sendEmail() async {
    EasyLoading.show();
    final response = await repository.sendEmail();
    EasyLoading.dismiss(animation: true);

    await Get.dialog(BizneResponseErrorDialog(response: response));
  }
}
