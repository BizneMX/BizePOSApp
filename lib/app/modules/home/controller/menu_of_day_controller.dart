import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/utils/file.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../components/dialog.dart';
import '../../../components/selector.dart';
import '../../../data/core/home/menu_of_day_repository.dart';
import '../../../models/home/menu.dart';

class MenuOfDayController extends LayoutRouteController {
  final MenuOfDayRepository repository;

  MenuOfDayController({required this.repository});

  RxList<Menu> menus = <Menu>[].obs;
  var menuOfDay =
      Menu(id: -1, name: '', pic: '', menuOfDay: true, last: false).obs;

  @override
  void onInit() {
    super.onInit();
    getMenus();
  }

  void getMenus() async {
    EasyLoading.show();
    final response = await repository.getMenus();
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    menus.value = response.data!;
  }

  void saveMenus() {}

  void setMenu(int id, MyFile file) async {
    EasyLoading.show();
    final base64 = await getBase64FormateFile(file.file.path);
    final response = await repository.setMenu(id, base64);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    menus.value = menus
        .map((e) => e.id != id
            ? e
            : Menu(
                id: e.id,
                name: e.name,
                pic: response.data!,
                last: e.last,
                menuOfDay: e.menuOfDay))
        .toList();
  }

  void deleteMenu(int id) async {
    EasyLoading.show();
    final response = await repository.deleteMenu(id);
    EasyLoading.dismiss(animation: true);

    if (!response.success) {
      await Get.dialog(BizneResponseErrorDialog(response: response));
      return;
    }

    menus.value = menus
        .map((e) => e.id != id
            ? e
            : Menu(
                id: e.id,
                name: e.name,
                pic: '',
                last: e.last,
                menuOfDay: e.menuOfDay))
        .toList();
  }
}
