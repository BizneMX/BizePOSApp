import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../components/text_filed.dart';
import '../../../models/home/order.dart';
import '../controller/historial_controller.dart';
import '../widgets/historial_widget.dart';

class HistorialView extends GetView<HistorialController> {
  const HistorialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      BizneHeader(back: () => controller.popNavigate(), title: 'historial'.tr),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
          child: Column(children: [
            BizneSearchField(
                controller: controller.searchController,
                hint: 'searchByName'.tr,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.paginationController.getLoad(clear: true);
                  }
                },
                onSubmitted: () =>
                    controller.paginationController.getLoad(clear: true)),
            SizedBox(height: 1.h),
            SizedBox(
                height: 5.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BizneDatePicker(
                          onChange: (date) {
                            controller.initDate = date;
                            controller.paginationController
                                .getLoad(clear: true);
                          },
                          text: 'initDate'.tr),
                      BizneDatePicker(
                          onChange: (date) {
                            controller.endDate = date;
                            controller.paginationController
                                .getLoad(clear: true);
                          },
                          text: 'endDate'.tr)
                    ]))
          ])),
      Expanded(
          child: Obx(() => controller.paginationController.noData.value
              ? Center(
                  child: MyText(
                    text: 'noData'.tr,
                    fontSize: 12.sp,
                    type: FontType.semibold,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: ListView(
                    controller:
                        controller.paginationController.scrollController,
                    children: [
                      for (Order order in controller.paginationController.list)
                        HistorialWidget(order: order)
                    ],
                  ))))
    ]);
  }
}
