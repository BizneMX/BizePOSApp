import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/components/profile_avatar.dart';
import 'package:bizne_fonda_app/app/enviroment.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/web_view_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BizneHeader(
          back: () => controller.popNavigate(),
          title: 'profile'.tr,
          rightWidget: IconButton(
            icon: Image.asset(
              'assets/icons/logout.png',
              height: 3.h,
            ),
            onPressed: () async {
              await Get.dialog(BizneDialog(
                text: 'logoutApp'.tr,
                onOk: () {
                  Get.back();
                  controller.logout();
                },
                onCancel: () => Get.back(),
              ));
            },
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        ProfileAvatar(
            imageUrl: UserService.service.user?.pic,
            placeholderImage: 'assets/images/default_profile.png',
            size: 8.h),
        SizedBox(
          height: 6.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.2.h),
          child: BizneElevatedButton(
            heightFactor: 0.045,
            onPressed: () => controller.navigate(Routes.editProfile),
            title: 'editProfile'.tr,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.2.h),
          child: BizneElevatedButton(
            heightFactor: 0.045,
            onPressed: () => controller.navigate(Routes.schedules),
            title: 'mySchedule'.tr,
          ),
        ),
        if (UserService.service.user!.inCharge)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.2.h),
            child: BizneElevatedButton(
              heightFactor: 0.045,
              onPressed: () => controller.navigate(Routes.myStaff),
              title: 'myStaff'.tr,
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.2.h),
          child: BizneElevatedButton(
            heightFactor: 0.045,
            onPressed: () => Get.toNamed(Routes.banner, arguments: false),
            title: 'appTutorial'.tr,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.2.h),
          child: BizneElevatedButton(
            heightFactor: 0.045,
            onPressed: () => controller.navigate(Routes.qrCode),
            title: 'qrCode'.tr,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.2.h),
          child: BizneElevatedButton(
            heightFactor: 0.045,
            onPressed: () => controller.navigate(Routes.training),
            title: 'training'.tr,
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 15.w),
          child: BizneTextButton(
            onPressed: () => controller.navigate(Routes.webView,
                arguments: WebViewArguments(
                    title: 'termsAndConditions'.tr,
                    url: Environment.termsAndConditions)),
            title: 'termsAndConditions'.tr,
            textSize: 14.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 15.w),
          child: BizneTextButton(
            onPressed: () => controller.navigate(Routes.webView,
                arguments: WebViewArguments(
                    title: 'privacyAdvice'.tr, url: Environment.privacyPolicy)),
            title: 'privacyAdvice'.tr,
            textSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 3.h,
        )
      ],
    );
  }
}
