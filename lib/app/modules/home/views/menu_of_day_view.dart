// import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/menu_of_day_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/my_text.dart';
import '../../../themes/app_themes.dart';
import '../../layout/widgets/bizne_header.dart';
import '../widgets/menu_widget.dart';

class MenuOfDayView extends GetView<MenuOfDayController> {
  const MenuOfDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      BizneHeader(
          back: () => controller.popNavigate(), title: 'Actualiza tu menú'),
      Expanded(
          child: Obx(() => Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              width: 80.w,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.menus.firstWhereOrNull((e) => e.menuOfDay) !=
                        null)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                text: '1. ${'whatEat'.tr}',
                                fontSize: 14.sp,
                                type: FontType.bold,
                                color: AppThemes().primary),
                            Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: MenuWidget(
                                    setMenu: controller.setMenu,
                                    deleteMenu: controller.deleteMenu,
                                    menu: controller.menus
                                        .firstWhere((e) => e.menuOfDay))),
                            SizedBox(
                              height: 4.h,
                            ),
                          ]),
                    if (controller.menus
                        .where((e) => !e.menuOfDay && !e.last)
                        .isNotEmpty)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                text: '2. ${'shareMenu'.tr}',
                                fontSize: 14.sp,
                                type: FontType.bold,
                                color: AppThemes().primary),
                            ...controller.menus
                                .where((e) => !e.menuOfDay && !e.last)
                                .map((item) => Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: MenuWidget(
                                      menu: item,
                                      setMenu: controller.setMenu,
                                      deleteMenu: controller.deleteMenu,
                                    ))),
                            SizedBox(
                              height: 4.h,
                            ),
                          ]),
                    if (controller.menus.firstWhereOrNull((e) => e.last) !=
                        null)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                text: '3. ${'whatEatTomorrow'.tr}',
                                fontSize: 14.sp,
                                type: FontType.bold,
                                color: AppThemes().primary),
                            Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: MenuWidget(
                                    setMenu: controller.setMenu,
                                    deleteMenu: controller.deleteMenu,
                                    menu: controller.menus
                                        .firstWhere((e) => e.last)))
                          ]),

                    SizedBox(height: 5.h),
                    MyText(
                      text: 'menuOfDayInfo'.tr,
                      color: AppThemes().secondary,
                      fontSize: 12.sp,
                      type: FontType.semibold,
                    )

                    // Padding(
                    //     padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                    //     child: BizneElevatedButton(
                    //         onPressed: () => controller.saveMenus(),
                    //         title: 'save'.tr))
                  ]))))
    ]);
  }
}
