import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/enviroment.dart';
import 'package:bizne_fonda_app/app/models/home/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/buttons.dart';
import '../../../components/my_text.dart';
import '../../../themes/app_themes.dart';
import '../../../utils/formatters.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  final bool showDeliveryBtn;
  final void Function(Order) acceptOrder;
  const OrderWidget(
      {super.key,
      required this.showDeliveryBtn,
      required this.order,
      required this.acceptOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 10.h,
                        child: Center(
                            child: order.pic.isEmpty
                                ? Icon(Icons.image,
                                    color: AppThemes().grey, size: 30.sp)
                                : Image.network(order.pic,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                            Icons.image,
                                            color: AppThemes().grey,
                                            size: 30.sp))))
                  ])),
          SizedBox(width: 2.w),
          Expanded(
              flex: 5,
              child: Column(children: [
                Row(children: [
                  Expanded(
                      flex: 5,
                      child: MyText(
                          type: FontType.bold,
                          fontSize: 12.sp,
                          color: AppThemes().primary,
                          text: '${order.fullName} (${order.userType})')),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                      flex: 2,
                      child: MyText(
                          text: order.date.isEmpty ? '' : order.date,
                          type: FontType.semibold,
                          fontSize: 12.sp,
                          color: AppThemes().primary,
                          align: TextAlign.right))
                ]),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          text:
                              '${'noEmployee'.tr} ${order.employeeNumber.isEmpty ? '' : order.employeeNumber}',
                          color: AppThemes().primary,
                          fontSize: 12.sp,
                          type: FontType.medium),
                      !order.isBooking
                          ? MyText(
                              text: (order.delivery
                                  ? 'forDelivery'.tr
                                  : 'inPlace'.tr),
                              fontSize: 14.sp,
                              color: !order.delivery
                                  ? AppThemes().primary
                                  : AppThemes().orange,
                              type: FontType.bold)
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    text: 'reserve'.tr,
                                    fontSize: 14.sp,
                                    color: !order.delivery
                                        ? AppThemes().primary
                                        : AppThemes().orange,
                                    type: FontType.bold),
                                MyText(
                                    text: '${'menu'.tr} ${order.noMenu}',
                                    fontSize: 14.sp,
                                    color: !order.delivery
                                        ? AppThemes().primary
                                        : AppThemes().orange,
                                    type: FontType.bold),
                              ],
                            )
                    ]),
                SizedBox(
                  height: 0.5.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyRichText(
                          text: MyTextSpan(
                              text: '${'payCash'.tr}: ',
                              fontSize: 12.sp,
                              type: FontType.medium,
                              children: [
                            MyTextSpan(
                                text: formatMoney(order.cash),
                                fontSize: 12.sp,
                                color: AppThemes().red,
                                type: FontType.bold)
                          ])),
                      MyRichText(
                          text: MyTextSpan(
                              text: '${'total'.tr}: ',
                              fontSize: 14.sp,
                              type: FontType.bold,
                              children: [
                            MyTextSpan(
                                text: formatMoney(order.total),
                                fontSize: 14.sp,
                                color: AppThemes().green,
                                type: FontType.bold)
                          ]))
                    ]),
                if (showDeliveryBtn)
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: BizneElevatedButton(
                        onPressed: () {
                          Get.dialog(BizneDialog(
                              text: 'doYouWantDeliverOrder'.tr,
                              okText: 'accept'.tr,
                              onCancel: () => Get.back(),
                              onOk: () {
                                Get.back();
                                if (order.cash > 0) {
                                  Get.dialog(AcceptOrderDialog(
                                    order: order,
                                    onAccept: acceptOrder,
                                  ));
                                } else {
                                  acceptOrder(order);
                                }
                              }));
                        },
                        title: 'deliverOrder'.tr,
                        widthFactor: 0.6),
                  )
              ]))
        ]));
  }
}

class AcceptOrderDialog extends StatelessWidget {
  final Order order;
  final void Function(Order) onAccept;
  const AcceptOrderDialog(
      {super.key, required this.order, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
            decoration: BoxDecoration(
                color: AppThemes().background,
                borderRadius: AppThemes().borderRadius),
            width: 80.w,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              MyText(
                  text: 'atention'.tr,
                  align: TextAlign.center,
                  color: AppThemes().primary,
                  type: FontType.bold,
                  fontSize: 24.sp),
              SizedBox(height: 1.5.h),
              MyText(
                  text: 'mustChargeUser'.tr,
                  align: TextAlign.center,
                  color: AppThemes().primary,
                  type: FontType.medium,
                  fontSize: 14.sp),
              SizedBox(height: 1.5.h),
              MyText(
                  text: '${formatMoney(order.cash)} MXN',
                  align: TextAlign.center,
                  color: AppThemes().primary,
                  type: FontType.bold,
                  fontSize: 24.sp),
              SizedBox(height: 1.5.h),
              MyText(
                  text: 'askForCash'.tr,
                  align: TextAlign.center,
                  color: AppThemes().primary,
                  type: FontType.bold,
                  fontSize: 14.sp),
              SizedBox(height: 2.h),
              BizneElevatedButton(
                  heightFactor: 0.04,
                  onPressed: () {
                    Get.back();
                    onAccept(order);
                  },
                  title: 'finishTransaction'.tr),
              SizedBox(height: 1.5.h),
              BizneElevatedButton(
                secondary: true,
                onPressed: () async {
                  String url =
                      'whatsapp://send?phone=${Environment.whatsappContact}&text=Hola+necesito+ayuda+en&lang=es';
                  await launchUrl(Uri.parse(url));
                },
                title: 'needHelpOrder'.tr,
                heightFactor: 0.04,
              )
            ])));
  }
}
