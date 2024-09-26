import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/models/home/order.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/new_orders_controller.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/order_widget.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/formatters.dart';
import '../../layout/widgets/bizne_header.dart';
import '../widgets/orders_bar.dart';

class NewOrderView extends GetView<NewOrdersController> {
  const NewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Stack(children: [
        BizneHeader(back: () => controller.popNavigate(), title: 'orders'.tr),
        Positioned(
            right: 5.w,
            top: 1.h,
            child: BizneElevatedButton(
              onPressed: () => controller.navigate(Routes.historial),
              title: 'historial'.tr,
              textSize: 14.sp,
              widthFactor: 0.3,
            ))
      ]),
      MyText(
        text: formatDateTime(controller.todayDate),
        fontSize: 14.sp,
        type: FontType.regular,
        color: AppThemes().primary,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
        child: BizneSearchField(
          controller: controller.searchController,
          hint: 'searchByName'.tr,
          onSubmitted: () {
            controller.paginationController.getLoad(clear: true);
          },
          onChanged: (value) {
            if (value.isEmpty) {
              controller.paginationController.getLoad(clear: true);
            }
          },
        ),
      ),
      Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Obx(() => OrdersBar(
                firstSelected: controller.firstSelected.value,
                textOne: '${'newOrders'.tr} (${controller.total1.value})',
                textTwo: '${'delivered'.tr} (${controller.total2.value})',
                onChange: () {
                  controller.firstSelected.value =
                      !controller.firstSelected.value;

                  controller.paginationController.getLoad(clear: true);
                },
              ))),
      Expanded(
          child: Obx(() => controller.paginationController.noData.value
              ? Center(
                  child: MyText(
                    text: 'noData'.tr,
                    fontSize: 12.sp,
                    type: FontType.semibold,
                  ),
                )
              : ListView(
                  controller: controller.paginationController.scrollController,
                  children: [
                      for (Order order in controller.paginationController.list)
                        Column(
                          children: [
                            OrderWidget(
                              key: Key(order.id.toString()),
                              order: order,
                              acceptOrder: controller.acceptOrder,
                              showDeliveryBtn: controller.firstSelected.value,
                            ),
                            Divider(
                                color: AppThemes().grey,
                                height: 1,
                                thickness: 0.3)
                          ],
                        )
                    ])))
    ]);
  }
}
