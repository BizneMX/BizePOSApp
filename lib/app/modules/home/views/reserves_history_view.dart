import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
// import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/reserves_history_controller.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/reserves_widget.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReservesHistoryView extends GetView<ReservesHistoryController> {
  const ReservesHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      BizneHeader(back: () => controller.popNavigate(), title: 'historial'.tr),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
          child: Column(children: [
            // BizneSearchField(
            //     controller: controller.searchController,
            //     hint: 'searchByName'.tr,
            //     ),
            SizedBox(height: 1.h),
            SizedBox(
                height: 5.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BizneDatePicker(
                          onChange: (date) {
                            controller.initDate = date;
                            // controller.getHistorial();
                          },
                          text: 'initDate'.tr),
                      BizneDatePicker(
                          onChange: (date) {
                            controller.endDate = date;
                            // controller.getHistorial();
                          },
                          text: 'endDate'.tr)
                    ]))
          ])),
      Expanded(
          child: controller.noData.value
              ? Center(
                  child: MyText(
                    text: 'noData'.tr,
                    fontSize: 12.sp,
                    type: FontType.semibold,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Obx(() => ListView(children: [
                        for (var reserves in controller.reserves.values)
                          ReservesWidget(reserves: reserves)
                      ]))))
    ]);
  }
}
