import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/recover_password_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RecoverPasswordView extends GetView<RecoverPasswordController> {
  const RecoverPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'email'.tr, fontSize: 14.sp),
      SizedBox(height: 5.sp),
      BizneTextFormField(
          controller: controller.emailController,
          validator: controller.emailValidator,
          onSubmited: controller.recoverPassword)
    ]);

    final buttonsArea =
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      BizneElevatedButton(
          onPressed: controller.recoverPassword, title: 'recoverPassword'.tr),
      SizedBox(height: 3.h),
      const BizneSupportButton(),
    ]);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Image.asset(
                      'assets/icons/logo.png',
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    MyText(
                      text: 'recoverPassword'.tr,
                      fontSize: 18.sp,
                      color: AppThemes().primary,
                      type: FontType.bold,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: MyText(
                        color: AppThemes().primary,
                        text: 'recoverPasswordInstructions'.tr,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 80.w,
                      child: emailArea,
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, right: 5.w, bottom: 4.h),
                      child: buttonsArea,
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 1.h,
                  left: 1.h,
                  child: BizneBackButton(
                    onPressed: () => Get.back(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
