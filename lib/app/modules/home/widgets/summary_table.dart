import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/home/summary_week.dart';
import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/services/user_service.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SummaryTable extends StatelessWidget {
  final SummaryWeek item;
  final Function()? left;
  final Function()? right;
  const SummaryTable(
      {super.key, required this.item, required this.left, required this.right});

  Color darkenColor(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final inCharge = UserService.service.user!.inCharge;

    Widget row(Widget left, Widget right) => Container(
          height: 4.5.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [left, right],
          ),
        );

    return SizedBox(
      width: 90.w,
      height: 50.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: left,
                  icon: Icon(
                    size: 28.sp,
                    Icons.keyboard_arrow_left,
                    color: AppThemes().secondary,
                  )),
              MyText(
                color: AppThemes().secondary,
                text: item.week,
                fontSize: 12.sp,
                type: FontType.semibold,
              ),
              IconButton(
                  onPressed: right,
                  icon: Icon(
                    size: 28.sp,
                    Icons.keyboard_arrow_right,
                    color: AppThemes().secondary,
                  ))
            ],
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: item.days.length,
                itemBuilder: (buildContext, index) {
                  final totalDay = item.days[index].total -
                      item.days[index].fee -
                      item.days[index].cash;

                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        color: AppThemes().whiteInputs,
                        height: 5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: dayOfWeekToStr(item.days[index].day),
                              fontSize: 14.sp,
                              type: FontType.bold,
                            ),
                            MyText(
                                fontSize: 14.sp,
                                type: FontType.bold,
                                color: AppThemes().green,
                                text: inCharge
                                    ? '+\$${numberFormat(totalDay)}'
                                    : '-')
                          ],
                        ),
                      ),
                      ...[
                        (
                          Row(children: [
                            MyText(
                              text: 'totalSale'.tr,
                              type: FontType.semibold,
                              fontSize: 12.sp,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            MyText(
                              text: '(${item.days[index].foods} ${'foods'.tr})',
                              type: FontType.semibold,
                              fontSize: 12.sp,
                            )
                          ]),
                          MyText(
                            text: inCharge
                                ? '\$${numberFormat(item.days[index].total)}'
                                : '-',
                            type: FontType.bold,
                            fontSize: 12.sp,
                          )
                        ),
                        (
                          MyText(
                            text: 'cash'.tr,
                            fontSize: 12.sp,
                            type: FontType.semibold,
                          ),
                          MyText(
                            text: inCharge
                                ? '-\$${numberFormat(item.days[index].cash)}'
                                : '-',
                            fontSize: 12.sp,
                            type: FontType.semibold,
                            color: AppThemes().secondary,
                          )
                        ),
                        (
                          MyText(
                            text: 'Fee Bizne (20%)'.tr,
                            type: FontType.semibold,
                            fontSize: 12.sp,
                          ),
                          MyText(
                            text: inCharge
                                ? '-\$${numberFormat(item.days[index].fee)}'
                                : '-',
                            fontSize: 12.sp,
                            type: FontType.semibold,
                          )
                        )
                      ].map((e) => row(e.$1, e.$2))
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
