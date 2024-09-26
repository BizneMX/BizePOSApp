import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/home/reserve.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/reserves_controller.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/orders_bar.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/reserves_widget.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReservesView extends GetWidget<ReservesController> {
  const ReservesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<Reserve>> buildView(List<Reserve> list) {
      var value = <(String, String), List<Reserve>>{};

      for (var reserve in list) {
        if (value[(reserve.date, reserve.hour)] == null) {
          value[(reserve.date, reserve.hour)] = List.empty(growable: true);
        }

        value[(reserve.date, reserve.hour)]!.add(reserve);
      }

      return value.values.toList();
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BizneHeader(back: () => controller.popNavigate(), title: 'reserves'.tr),
        SizedBox(
          height: 1.h,
        ),
        Obx(() => OrdersBar(
            firstSelected: controller.firstSelected.value,
            textOne: '${'forAccepting'.tr} (${controller.total1.value})',
            textTwo: '${'accepted'.tr} (${controller.total2.value})',
            onChange: () {
              controller.firstSelected.value = !controller.firstSelected.value;
              controller.paginationController.getLoad(clear: true);
            })),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
          child: Obx(() => Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 1.w),
                        child: ReserveBar(
                          cant: controller.menu1.value,
                          number: 1,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: ReserveBar(
                          cant: controller.menu2.value,
                          number: 2,
                        ),
                      ))
                ],
              )),
        ),
        Expanded(
            child: Obx(() => controller.paginationController.noData.value
                ? Center(
                    child: MyText(
                      text: 'noData'.tr,
                      fontSize: 12.sp,
                      type: FontType.semibold,
                    ),
                  )
                : ListView(children: [
                    for (var reserves
                        in buildView(controller.paginationController.list))
                      ReservesWidget(
                        reserves: reserves,
                        accept: controller.firstSelected.value
                            ? controller.accept
                            : null,
                        reject: controller.firstSelected.value
                            ? controller.reject
                            : null,
                      )
                  ])))
      ],
    );
  }
}
