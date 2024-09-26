import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_staff_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddStaffView extends GetView<AddStaffController> {
  const AddStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'name'.tr, fontSize: 14.sp),
      SizedBox(height: 1.h),
      BizneTextFormField(
        onSubmited: () {},
        validator: controller.nameValidator,
        controller: controller.nameController,
        hint: 'name'.tr,
        textInputAction: TextInputAction.next,
      )
    ]);

    final lastNameArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'lastName'.tr, fontSize: 14.sp),
      SizedBox(height: 1.h),
      BizneTextFormField(
        onSubmited: () {},
        validator: controller.lastNameValidator,
        controller: controller.lastNameController,
        hint: 'lastName'.tr,
        textInputAction: TextInputAction.next,
      )
    ]);

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
                    onSubmited: () {},
                    validator: controller.phoneNumberValidator,
                    controller: controller.phoneController,
                    hint: 'phone'.tr,
                    textInputAction: TextInputAction.next,
                    isNumber: true))
          ])
    ]);

    final emailArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'email'.tr, fontSize: 14.sp),
      SizedBox(height: 1.h),
      BizneTextFormField(
        textInputAction: TextInputAction.next,
        onSubmited: () {},
        validator: controller.emailValidator,
        controller: controller.emailController,
        hint: 'email'.tr,
      )
    ]);

    final passwordArea =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      MyText(text: 'password'.tr, fontSize: 14.sp),
      SizedBox(height: 1.h),
      BizneTextFormField(
        isPassword: true,
        onSubmited: controller.save,
        validator: controller.passwordValidator,
        controller: controller.passwordController,
        hint: 'password'.tr,
      )
    ]);

    return SingleChildScrollView(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(children: [
          BizneHeader(
            back: () => controller.popNavigate(),
            title: 'addStaff'.tr,
          ),
          SizedBox(
            height: 1.5.h,
          ),
          SizedBox(
            width: 80.w,
            child: MyText(
              text: 'addStaffInfo'.tr,
              fontSize: 12.sp,
              type: FontType.semibold,
              color: AppThemes().secondary,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 80.w,
            child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    nameArea,
                    SizedBox(
                      height: 1.h,
                    ),
                    lastNameArea,
                    SizedBox(
                      height: 1.h,
                    ),
                    phoneNumberArea,
                    SizedBox(
                      height: 1.h,
                    ),
                    emailArea,
                    SizedBox(
                      height: 1.h,
                    ),
                    passwordArea
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
          ),
        ]),
      ),
    );
  }
}
