import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/login_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumberArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'phone'.tr, fontSize: 14.sp),
      SizedBox(height: 1.h),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30.w,
              child: CountrySelector(
                onSelected: (value) => controller.prefixPhone = value,
              ),
            ),
            SizedBox(
                width: 45.w,
                child: BizneTextFormField(
                    onSubmited: () {
                      if (controller.preLogin.value) controller.checkPhone();
                    },
                    validator: controller.phoneNumberValidator,
                    textAlign: TextAlign.center,
                    controller: controller.phoneController,
                    hint: 'phone'.tr,
                    isNumber: true))
          ])
    ]);

    final passwordArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'password'.tr, fontSize: 14.sp),
      SizedBox(height: 5.sp),
      SizedBox(
        child: BizneTextFormField(
            onSubmited: () => controller.preLogin.value
                ? controller.checkPhone()
                : controller.login(),
            isPassword: true,
            validator: controller.passwordValidator,
            controller: controller.passwordController),
      ),
      SizedBox(
        height: 1.h,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        MyRichText(
            text: MyTextSpan(
                color: AppThemes().primary,
                text: 'forgotPassword'.tr,
                decoration: TextDecoration.underline,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.toNamed(Routes.recoverPassword)))
      ])
    ]);

    final buttonsArea =
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      BizneElevatedButton(
          onPressed: () => controller.preLogin.value
              ? controller.checkPhone()
              : controller.login(),
          title: 'continue'.tr),
      SizedBox(height: 3.h),
      const BizneSupportButton(),
    ]);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Form(
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
                  text: 'login'.tr,
                  fontSize: 18.sp,
                  color: AppThemes().primary,
                  type: FontType.bold,
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 80.w,
                  child: phoneNumberArea,
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 80.w,
                  child: Obx(() => controller.preLogin.value
                      ? const SizedBox()
                      : passwordArea),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 4.h),
                  child: buttonsArea,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
