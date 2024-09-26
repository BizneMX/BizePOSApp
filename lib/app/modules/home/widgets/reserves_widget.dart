import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/home/reserve.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
// import 'package:bizne_fonda_app/app/utils/number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReservesWidget extends StatelessWidget {
  final List<Reserve> reserves;
  final void Function(int id)? accept;
  final void Function(int id)? reject;
  const ReservesWidget({
    super.key,
    required this.reserves,
    this.accept,
    this.reject,
  });

  @override
  Widget build(BuildContext context) {
    Widget getReserve(Reserve reserve, {bool last = false}) {
      Widget getRow(String name, String value, {Color? color, String? pic}) =>
          Padding(
            padding: EdgeInsets.only(top: 1.h, left: 3.w, right: 3.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 1.w),
                      child: MyText(
                        type: FontType.semibold,
                        fontSize: 12.sp,
                        color: AppThemes().secondary,
                        text: '$name:',
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      if (pic != null)
                        Padding(
                          padding: EdgeInsets.only(right: 1.w),
                          child: Image.network(height: 20.sp, pic),
                        ),
                      Expanded(
                        child: MyText(
                          type: FontType.semibold,
                          fontSize: 12.sp,
                          color: color,
                          text: value,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
      return Column(
        children: [
          ...[
            ('client'.tr, reserve.clientName, AppThemes().green),
            ('organization'.tr, reserve.organization, AppThemes().green),
            (
              'appPayment'.tr,
              '${reserve.appPayment} Bz coins',
              AppThemes().green
            ),
            (
              'menuOption'.tr,
              '${'menu'.tr} ${reserve.noMenu}',
              AppThemes().secondary
            ),
            // (
            //   'pendingPayment'.tr,
            //   '\$${numberFormat(reserve.cashPayment)} MXN ${'inCash'.tr}'
            // ),
            // ('deliveryAddress'.tr, reserve.deliveryAddress),
            // ('deliveryInstructions'.tr, reserve.deliveryInstructions)
            ('details'.tr, reserve.details, AppThemes().green)
          ].map(
            (e) => getRow(e.$1, e.$2,
                color: e.$3,
                pic: e.$1 == 'organization'.tr ? reserve.pic : null),
          ),
          if (accept != null && reject != null)
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: BizneElevatedButton(
                          onPressed: () {
                            Get.dialog(BizneDialog(
                                text: 'doYouWantRejectReserve'.tr,
                                onCancel: () => Get.back(),
                                onOk: () {
                                  Get.back();
                                  reject!(reserve.id);
                                }));
                          },
                          title: 'reject'.tr,
                          secondary: true,
                          autoWidth: true,
                          textSize: 12.sp,
                          heightFactor: 0.04,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: BizneElevatedButton(
                          autoWidth: true,
                          heightFactor: 0.04,
                          textSize: 12.sp,
                          onPressed: () {
                            Get.dialog(BizneDialog(
                                text: 'doYouWantAcceptReserve'.tr,
                                onCancel: () => Get.back(),
                                onOk: () {
                                  Get.back();
                                  accept!(reserve.id);
                                }));
                          },
                          title: 'accept'.tr,
                        ),
                      ))
                ],
              ),
            ),
          if (!last) ...[
            SizedBox(
              height: 1.h,
            ),
            Divider(color: AppThemes().grey, height: 1, thickness: 0.3)
          ]
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
            color: AppThemes().whiteInputs,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  fontSize: 12.sp,
                  text: reserves.first.date,
                  type: FontType.bold,
                ),
                MyText(
                    fontSize: 12.sp,
                    type: FontType.bold,
                    text: reserves.first.hour)
              ],
            ),
          ),
          ...reserves.asMap().entries.map(
              (r) => getReserve(r.value, last: r.key == reserves.length - 1))
        ],
      ),
    );
  }
}

class ReserveBar extends StatelessWidget {
  final int cant;
  final int number;
  const ReserveBar({super.key, required this.cant, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
      color: AppThemes().whiteInputs,
      child: Column(
        children: [
          MyText(
            text: '$cant',
            fontSize: 16.sp,
            type: FontType.bold,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          MyText(
            type: FontType.semibold,
            text: '${'menu'.tr.toUpperCase()} $number',
            fontSize: 12.sp,
          )
        ],
      ),
    );
  }
}
