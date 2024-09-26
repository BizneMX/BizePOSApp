import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/footer.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (a) => controller.popNavigate(),
        child: Scaffold(
            body: Navigator(
              key: Get.nestedKey(1),
              initialRoute: Routes.home,
              onGenerateRoute: controller.onGenerateRoute,
            ),
            bottomNavigationBar: Obx(() => controller.showFooter.value
                ? Footer(
                    onChange: (value) async {
                      if (!value) {
                        bool ok = await Get.dialog<bool>(
                                CloseEstablishmentDialog(onOk: () {
                              Get.back(result: true);
                              controller.changeStatus(value);
                            })) ??
                            false;
                        return ok;
                      } else {
                        controller.changeStatus(value);
                        return true;
                      }
                    },
                    inService: controller.inService.value,
                  )
                : const SizedBox())));
  }
}
