import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/error_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ErrorView extends GetView<ErrorController> {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15.h,
          width: 100.w,
        ),
        MyText(
          color: AppThemes().green,
          text: 'ups'.tr,
          type: FontType.bold,
          fontSize: 30.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 60.w,
          child: MyText(
            align: TextAlign.center,
            fontSize: 20.sp,
            text: controller.arguments.error,
            color: AppThemes().primary,
            type: FontType.semibold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
            width: 70.w,
            child: MyText(
                fontSize: 16.sp,
                type: FontType.semibold,
                align: TextAlign.center,
                color: AppThemes().primary,
                text: controller.arguments.description)),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: BizneElevatedButton(
            onPressed: () {
              controller.navigate(Routes.home);
            },
            title: 'finish'.tr,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
