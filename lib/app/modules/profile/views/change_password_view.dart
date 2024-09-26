import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/change_password_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            BizneHeader(
                back: () => controller.popNavigate(),
                title: 'changePassword'.tr),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 70.w,
              child: MyText(
                color: AppThemes().secondary,
                fontSize: 12.sp,
                type: FontType.semibold,
                text: 'changePasswordInfo'.tr,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              width: 80.w,
              child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(text: 'currentPassword'.tr, fontSize: 14.sp),
                      SizedBox(height: 1.h),
                      BizneTextFormField(
                        controller: controller.currentPasswordController,
                        validator: controller.currentPasswordValidator,
                        onSubmited: () {},
                        textInputAction: TextInputAction.next,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      MyText(text: 'newPassword'.tr, fontSize: 14.sp),
                      SizedBox(height: 1.h),
                      BizneTextFormField(
                        controller: controller.newPasswordController,
                        validator: controller.newPasswordValidator,
                        onSubmited: () {},
                        textInputAction: TextInputAction.next,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      MyText(text: 'confirmPassword'.tr, fontSize: 14.sp),
                      SizedBox(height: 1.h),
                      BizneTextFormField(
                        controller: controller.confirmPasswordController,
                        validator: controller.confirmPasswordValidator,
                        onSubmited: controller.save,
                        isPassword: true,
                      ),
                    ],
                  )),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              child: BizneElevatedButton(
                onPressed: controller.save,
                title: 'save'.tr,
              ),
            )
          ],
        ),
      ),
    );
  }
}
