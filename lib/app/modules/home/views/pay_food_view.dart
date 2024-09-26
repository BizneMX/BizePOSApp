import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/pay_food_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PayFoodView extends GetView<PayFoodController> {
  const PayFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 15.h,
        ),
        MyText(
          text: 'willBeDiscounted'.tr,
          type: FontType.bold,
          fontSize: 24.sp,
          color: AppThemes().primary,
        ),
        MyText(
          text: '${controller.arguments.total} BZ coins',
          type: FontType.bold,
          fontSize: 24.sp,
          color: AppThemes().green,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          width: 90.w,
          child: Column(
            children: [
              MyText(
                text: 'fromUserAccount'.tr,
                align: TextAlign.center,
                type: FontType.bold,
                fontSize: 24.sp,
                color: AppThemes().primary,
              ),
              MyText(
                text: controller.arguments.userName,
                type: FontType.bold,
                align: TextAlign.center,
                fontSize: 24.sp,
                color: AppThemes().green,
              )
            ],
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        MyText(
          color: AppThemes().primary,
          text: '${'bzCoinsAvailable'.tr} ${controller.arguments.bzCoins}',
          type: FontType.semibold,
          fontSize: 18.sp,
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: BizneElevatedButton(
            onPressed: controller.payFood,
            title: 'pay'.tr,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
          child: BizneElevatedButton(
            secondary: true,
            onPressed: () => controller.navigate(Routes.home),
            title: 'cancel'.tr,
          ),
        )
      ],
    );
  }
}
