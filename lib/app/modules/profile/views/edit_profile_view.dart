import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/profile_avatar.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/edit_profile_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

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
              child: Obx(() => CountrySelector(
                    initial: controller.prefixPhone.value,
                    onSelected: (value) {
                      controller.prefixPhone.value = value;
                    },
                  )),
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
        onSubmited: controller.save,
        validator: controller.emailValidator,
        controller: controller.emailController,
        hint: 'email'.tr,
      )
    ]);

    return SingleChildScrollView(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(children: [
          BizneHeader(
            back: () => controller.popNavigate(),
            title: 'editProfile'.tr,
          ),
          SizedBox(
            height: 1.h,
          ),
          Stack(
            children: [
              Obx(() => ProfileAvatar(
                  imageUrl: controller.imgUrl.value.isEmpty
                      ? null
                      : controller.imgUrl.value,
                  placeholderImage: 'assets/images/default_profile.png',
                  size: 7.h)),
              Positioned(
                  right: 1.h,
                  bottom: 1.h,
                  child: FileSelector(
                    onChange: controller.updateProfilePhoto,
                    child: Container(
                      height: 3.h,
                      width: 3.h,
                      decoration: BoxDecoration(
                          color: AppThemes().primary,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.edit,
                        color: AppThemes().whiteInputs,
                        size: 2.h,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 4.h,
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
                    emailArea
                  ],
                )),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: BizneElevatedButton(
              onPressed: controller.save,
              title: 'save'.tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
            child: BizneElevatedButton(
              onPressed: () => controller.navigate(Routes.changePassword),
              secondary: true,
              title: 'changePassword'.tr,
            ),
          )
        ]),
      ),
    );
  }
}
