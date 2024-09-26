import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/components/selector.dart';
import 'package:bizne_fonda_app/app/components/text_filed.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/add_schedule_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddSchedule extends GetWidget<AddScheduleController> {
  const AddSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'addSchedulesInfo'.tr,
              fontSize: 12.sp,
              color: AppThemes().primary,
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 1.h),
              height: 3.h,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: MyText(
                          color: AppThemes().primary,
                          fontSize: 12.sp,
                          text: 'day'.tr,
                          type: FontType.semibold,
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: MyText(
                          color: AppThemes().primary,
                          fontSize: 12.sp,
                          text: 'opening'.tr,
                          type: FontType.semibold,
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: MyText(
                          color: AppThemes().primary,
                          fontSize: 12.sp,
                          text: 'closing'.tr,
                          type: FontType.semibold,
                        ),
                      )),
                  const Expanded(flex: 1, child: SizedBox())
                ],
              ),
            ),
            ...controller.schedules.asMap().entries.map((e) => Padding(
                  key: Key(e.value.id.toString()),
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: SizedBox(
                                  height: 5.5.h,
                                  child: DayOfWeekSelector(
                                    initialDay: e.value.day,
                                    onChange: (p0) =>
                                        controller.schedules[e.key].day = p0,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: BizneScheduleField(
                                    initial: e.value.start,
                                    onChanged: (value) {
                                      controller.schedules[e.key].start = value;
                                      controller.errors[e.key] =
                                          controller.validator(value);
                                    }),
                              )),
                          Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.w),
                                child: BizneScheduleField(
                                    initial: e.value.end,
                                    onChanged: (value) {
                                      controller.schedules[e.key].end = value;
                                      controller.errors[e.key] =
                                          controller.validator(value);
                                    }),
                              )),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () => controller.removeSchedule(e.key),
                                child: Icon(
                                  Icons.close,
                                  size: 16.sp,
                                ),
                              ))
                        ],
                      ),
                      controller.errors[e.key].isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: MyText(
                                type: FontType.bold,
                                text: controller.errors[e.key],
                                color: AppThemes().negative,
                              ),
                            )
                    ],
                  ),
                )),
            SizedBox(
              height: 1.h,
            ),
            BizneElevatedButton(
              widthFactor: 0.5,
              heightFactor: 0.04,
              onPressed: controller.addSchedule,
              title: 'addSchedules'.tr,
              textSize: 11.sp,
            ),
          ],
        ));
  }
}
