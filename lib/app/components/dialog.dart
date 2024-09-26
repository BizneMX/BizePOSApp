import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BizneDialog extends StatelessWidget {
  final String text;
  final String? okText;
  final Function() onOk;
  final Function()? onCancel;

  const BizneDialog(
      {super.key,
      required this.text,
      required this.onOk,
      this.onCancel,
      this.okText});

  @override
  Widget build(BuildContext context) {
    final okTextLabel = okText ?? 'understood'.tr;
    final cancelButton = onCancel != null
        ? [
            SizedBox(height: 2.h),
            BizneElevatedButton(
                secondary: true,
                heightFactor: 0.04,
                onPressed: onCancel,
                title: 'cancel'.tr)
          ]
        : [];
    return Center(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            decoration: BoxDecoration(
                color: AppThemes().background,
                borderRadius: AppThemes().borderRadius),
            width: 80.w,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              MyText(
                  text: text,
                  align: TextAlign.center,
                  color: AppThemes().primary,
                  type: FontType.bold,
                  fontSize: 16.sp),
              SizedBox(height: 3.h),
              BizneElevatedButton(
                  heightFactor: 0.04, onPressed: onOk, title: okTextLabel),
              ...cancelButton
            ])));
  }
}

class NoConnectionDialog extends StatelessWidget {
  const NoConnectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          bottom: 10.h,
          child: SizedBox(
              width: 100.w,
              child: Row(children: [
                const Expanded(child: SizedBox()),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    decoration: BoxDecoration(
                        color: AppThemes().white,
                        borderRadius: AppThemes().borderRadius),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyText(text: 'noConnection'.tr, type: FontType.bold),
                          SizedBox(width: 3.w),
                          Icon(Icons.no_sim, color: AppThemes().grey)
                        ])),
                const Expanded(child: SizedBox())
              ])))
    ]);
  }
}

class BizneResponseErrorDialog extends StatelessWidget {
  final ResponseRepository response;
  const BizneResponseErrorDialog({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    if (response.invalidToken) {
      return BizneDialog(
          text: 'expiredToken'.tr,
          onOk: () async {
            Get.back();
            UserService.service.logout();
            Get.offNamed(Routes.login);
          });
    }

    return BizneDialog(
        text: response.message ?? 'unexpectedError'.tr, onOk: () => Get.back());
  }
}

class ScheduleInfoDialog extends StatelessWidget {
  const ScheduleInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            decoration: BoxDecoration(
                color: AppThemes().background,
                borderRadius: AppThemes().borderRadius),
            width: 80.w,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: MyText(
                      align: TextAlign.center,
                      color: AppThemes().primary,
                      text: 'infoScheduleDialog'.tr,
                      fontSize: 14.sp,
                      type: FontType.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  MyText(
                    text: 'infoScheduleDialogField1'.tr,
                    fontSize: 12.sp,
                    color: AppThemes().secondary,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: MyText(
                      align: TextAlign.center,
                      text: 'infoScheduleDialogField2'.tr,
                      fontSize: 12.sp,
                      color: AppThemes().secondary,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyText(
                    text: 'infoScheduleDialogField3'.tr,
                    fontSize: 12.sp,
                    color: AppThemes().secondary,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: MyText(
                      align: TextAlign.center,
                      text: 'infoScheduleDialogField4'.tr,
                      fontSize: 12.sp,
                      color: AppThemes().secondary,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyText(
                    text: 'infoScheduleDialogField5'.tr,
                    fontSize: 12.sp,
                    color: AppThemes().secondary,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: MyText(
                      align: TextAlign.center,
                      text: 'infoScheduleDialogField6'.tr,
                      fontSize: 12.sp,
                      color: AppThemes().secondary,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyText(
                    text: 'infoScheduleDialogField7'.tr,
                    fontSize: 12.sp,
                    color: AppThemes().secondary,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyText(
                    text: 'infoScheduleDialogField8'.tr,
                    fontSize: 12.sp,
                    color: AppThemes().secondary,
                  )
                ])));
  }
}

class CloseEstablishmentDialog extends StatelessWidget {
  final Function() onOk;
  const CloseEstablishmentDialog({super.key, required this.onOk});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            decoration: BoxDecoration(
                color: AppThemes().background,
                borderRadius: AppThemes().borderRadius),
            width: 80.w,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: MyText(
                      color: AppThemes().primary,
                      align: TextAlign.center,
                      text: 'areYouSureYouWantClose'.tr,
                      fontSize: 16.sp,
                      type: FontType.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  MyText(
                    text: 'youWillNotReceive'.tr,
                    fontSize: 14.sp,
                    align: TextAlign.center,
                    type: FontType.semibold,
                    color: AppThemes().secondary,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  BizneElevatedButton(
                      heightFactor: 0.04,
                      onPressed: onOk,
                      title: 'yesIWantCloseIt'.tr),
                  SizedBox(
                    height: 2.h,
                  ),
                  BizneElevatedButton(
                      secondary: true,
                      heightFactor: 0.04,
                      onPressed: () => Get.back(),
                      title: 'cancel'.tr),
                ])));
  }
}
