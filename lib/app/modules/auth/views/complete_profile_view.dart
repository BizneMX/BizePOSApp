import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/complete_profile_controller.dart';
import 'package:bizne_fonda_app/app/modules/profile/widgets/add_schedule.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CompleteProfileView extends GetView<CompleteProfileController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonsArea =
        Obx(() => Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              BizneElevatedButton(
                  onPressed: controller.step.value == 0
                      ? controller.next
                      : controller.finish,
                  title: controller.step.value == 0 ? 'next'.tr : 'finish'.tr),
              SizedBox(height: 3.h),
              const BizneSupportButton(),
            ]));

    final step0 = SizedBox(
      width: 80.w,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            MyText(
              text: 'password'.tr,
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 1.h,
            ),
            BizneTextFormField(
              isPassword: true,
              controller: controller.passwordController,
              validator: controller.passwordValidator,
              onSubmited: () {},
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 2.h,
            ),
            MyText(
              text: 'confirmPassword'.tr,
              fontSize: 14.sp,
            ),
            SizedBox(
              height: 1.h,
            ),
            BizneTextFormField(
              isPassword: true,
              controller: controller.confirmController,
              validator: controller.confirmValidator,
              onSubmited: controller.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            MyText(
              text: 'passwordLength1'.tr,
              fontSize: 13.sp,
            ),
            SizedBox(
              height: 2.h,
            ),
            MyText(
              text: 'doNotUseUserNameOrPhone'.tr,
              fontSize: 13.sp,
            ),
            SizedBox(
              height: 2.h,
            ),
            MyText(
              text: 'weRecommend'.tr,
              fontSize: 13.sp,
            )
          ],
        ),
      ),
    );

    final step1 = SizedBox(
      width: 80.w,
      child: Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: const AddSchedule(),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Obx(
          () => Column(
            children: [
              BizneHeader(
                back: controller.step.value == 0
                    ? () => Get.back()
                    : () => controller.step.value--,
                title: 'completeProfile'.tr,
                rightWidget: controller.step.value == 0
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () async {
                          await Get.dialog(const ScheduleInfoDialog());
                        },
                        icon:
                            Image.asset('assets/icons/info.png', height: 3.h)),
              ),
              SizedBox(
                height: 3.h,
              ),
              MyText(
                fontSize: 14.sp,
                type: FontType.semibold,
                color: AppThemes().primary,
                text: controller.step.value == 0
                    ? 'completeProfileStep1'.tr
                    : 'completeProfileStep2'.tr,
              ),
              controller.step.value == 0 ? step0 : step1,
              const Expanded(child: const SizedBox()),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  bottom: 4.h,
                ),
                child: buttonsArea,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
