import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/my_staff_controller.dart';
import 'package:bizne_fonda_app/app/modules/profile/widgets/staff_item.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyStaffView extends GetView<MyStaffController> {
  const MyStaffView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        children: [
          BizneHeader(
              back: () => controller.popNavigate(), title: 'myStaff'.tr),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 80.w,
            child: MyText(
              text: 'myStaffInfo'.tr,
              fontSize: 12.sp,
              type: FontType.semibold,
              color: AppThemes().secondary,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Obx(() => Expanded(
              child: controller.noData.value
                  ? Center(
                      child: MyText(
                        text: 'noData'.tr,
                        fontSize: 12.sp,
                        type: FontType.semibold,
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (buildCOntext, item) {
                        return StaffItem(
                          item: controller.data[item],
                          action: () async {
                            await Get.dialog(BizneDialog(
                              text: controller.data[item].isBlock
                                  ? 'areYouSureUnBlock'.tr
                                  : 'areYouSureBlock'.tr,
                              okText: controller.data[item].isBlock
                                  ? 'yesUnBlock'.tr
                                  : 'yesBlock'.tr,
                              onOk: () {
                                Get.back();
                                controller.blockUnBlock(item);
                              },
                              onCancel: () => Get.back(),
                            ));
                          },
                        );
                      }))),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
            child: BizneElevatedButton(
              onPressed: () => controller.navigate(Routes.addStaff),
              title: '+ ${'addStaff'.tr}',
            ),
          )
        ],
      ),
    );
  }
}
