import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/my_text.dart';
import '../../../models/home/order.dart';
import '../../../themes/app_themes.dart';
import '../../../utils/formatters.dart';

class HistorialWidget extends StatelessWidget {
  final Order order;
  const HistorialWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppThemes().grey, width: 0.5)),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    flex: 6,
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.all(2.w),
                          child: SizedBox(
                            height: 6.h,
                            child: Center(
                                child: order.pic.isEmpty
                                    ? Icon(Icons.image,
                                        color: AppThemes().grey, size: 30.sp)
                                    : Image.network(order.pic,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Icon(Icons.image,
                                                    color: AppThemes().grey,
                                                    size: 30.sp))),
                          )),
                      SizedBox(
                          width: 50.w,
                          child: MyText(
                              type: FontType.bold,
                              fontSize: 14.sp,
                              color: AppThemes().primary,
                              text: '${order.fullName} (${order.userType})'))
                    ])),
                MyText(
                    text: order.date.isEmpty ? '' : order.date,
                    type: FontType.semibold,
                    fontSize: 10.sp,
                    color: AppThemes().primary,
                    align: TextAlign.right)
              ]),
              SizedBox(height: 0.5.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  MyText(text: 'payCash'.tr, fontSize: 12.sp),
                  MyText(
                      text: formatMoney(order.cash),
                      type: FontType.bold,
                      fontSize: 14.sp,
                      color: AppThemes().secondary)
                ]),
                Column(children: [
                  MyText(text: 'payBzcoins'.tr, fontSize: 12.sp),
                  MyText(
                      text: formatMoney(order.total - order.cash),
                      type: FontType.bold,
                      fontSize: 14.sp)
                ]),
                Column(children: [
                  MyText(text: 'payTotal'.tr, fontSize: 12.sp),
                  MyText(
                      text: formatMoney(order.total),
                      type: FontType.bold,
                      fontSize: 14.sp)
                ])
              ])
            ])));
  }
}
