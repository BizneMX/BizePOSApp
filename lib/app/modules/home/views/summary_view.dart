import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/summary_controller.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/summary_table.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SummaryView extends GetView<SummaryController> {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final inCharge = UserService.service.user!.inCharge;

    return Obx(() => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            BizneHeader(
                back: () => controller.popNavigate(), title: 'summary'.tr),
            Container(
              height: 13.h,
              width: 60.w,
              padding: EdgeInsets.only(top: 0.5.h),
              decoration: BoxDecoration(
                  color: AppThemes().white,
                  border: Border.all(color: AppThemes().secondary, width: 1.5),
                  boxShadow: [AppThemes().boxShadow],
                  borderRadius: AppThemes().borderRadius),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: MyText(
                        text:
                            '\$${numberFormat(controller.summaryData.value.total.toDouble())}',
                        fontSize: 24.sp,
                        type: FontType.bold,
                        color: AppThemes().green,
                      )),
                  Expanded(
                      flex: 2,
                      child: MyText(
                        text:
                            '${controller.summaryData.value.foods} ${'foods'.tr}',
                        type: FontType.bold,
                        fontSize: 14.sp,
                        color: AppThemes().secondary,
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: AppThemes().grey.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Center(
                          child: MyText(
                            text: 'todayIncome'.tr,
                            type: FontType.bold,
                            fontSize: 14.sp,
                            color: AppThemes().primary,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SummaryTable(
                item: controller.summaryWeek.value,
                left: () => controller.move(-1),
                right: () => controller.move(1)),
            Expanded(
                child: Container(
              color: AppThemes().whiteInputs,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: 'weekBalance'.tr,
                          fontSize: 12.sp,
                          type: FontType.bold,
                        ),
                        MyText(
                            fontSize: 16.sp,
                            type: FontType.bold,
                            color: AppThemes().green,
                            text: inCharge
                                ? '\$${numberFormat(controller.summaryWeek.value.total)}'
                                : '-')
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 2.h,
                      left: 5.w,
                      right: 5.w,
                    ),
                    child: BizneElevatedButton(
                      onPressed: controller.sendEmail,
                      title: 'sendSummary'.tr,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 12.sp,
                        color: AppThemes().secondary,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      MyText(
                        fontSize: 10.sp,
                        type: FontType.semibold,
                        text: 'onlyBeAbleToSend'.tr,
                        color: AppThemes().secondary,
                      )
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
