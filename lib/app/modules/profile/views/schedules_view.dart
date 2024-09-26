import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/modules/profile/widgets/add_schedule.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/schedules_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SchedulesView extends GetView<SchedulesController> {
  const SchedulesView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.load();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BizneHeader(
          back: () => controller.popNavigate(),
          title: 'schedules'.tr,
          rightWidget: IconButton(
              onPressed: () async {
                await Get.dialog(const ScheduleInfoDialog());
              },
              icon: Image.asset('assets/icons/info.png', height: 3.h)),
        ),
        SizedBox(
          width: 80.w,
          child: Padding(
            padding: EdgeInsets.only(top: 3.h),
            child: const AddSchedule(),
          ),
        ),
        const Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            bottom: 4.h,
          ),
          child: BizneElevatedButton(
            onPressed: controller.save,
            title: 'save'.tr,
          ),
        )
      ],
    );
  }
}
