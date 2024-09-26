import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/enviroment.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/home_controller.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/home_entry.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: controller.data.value.establishmentPic != null
                        ? Image.network(controller.data.value.establishmentPic!,
                            height: 10.h,
                            width: 10.h,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset("assets/icons/default.png",
                                    height: 10.h, width: 10.h))
                        : Image.asset("assets/icons/default.png",
                            height: 10.h, width: 10.h)),
                Expanded(
                    flex: 5,
                    child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 30.w,
                                    child: MyText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      type: FontType.bold,
                                      text: controller
                                          .data.value.establishmentName,
                                      fontSize: 16.sp,
                                      color: AppThemes().grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.5.h),
                                    child: Icon(
                                      Icons.star,
                                      color: AppThemes().gold,
                                      size: 14.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.5.h),
                                    child: MyText(
                                        type: FontType.bold,
                                        fontSize: 12.sp,
                                        color: AppThemes().grey,
                                        text: numberFormat(
                                            controller.data.value.rating)),
                                  )
                                ]),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              type: FontType.semibold,
                              text: controller.data.value.userName,
                              fontSize: 14.sp,
                              color: AppThemes().grey,
                            )
                          ],
                        ))),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () =>
                          controller.navigate(Routes.notifications),
                      icon: const Icon(
                        Icons.notifications,
                      ),
                    ))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeEntry(
                      onTap: () => controller.navigate(Routes.newOrders),
                      count: controller.data.value.newOrders,
                      imageName: 'new_orders',
                      name: 'newOrders'.tr,
                    ),
                    HomeEntry(
                        onTap: () => controller.navigate(Routes.summary),
                        imageName: 'summary',
                        name: 'summary'.tr)
                  ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeEntry(
                      onTap: () => controller.navigate(Routes.menuOfDay),
                      imageName: 'menu_of_day',
                      name: 'menuOfDay'.tr,
                    ),
                    HomeEntry(
                        onTap: () => controller.navigate(Routes.profile),
                        imageName: 'profile',
                        name: 'profile'.tr)
                  ])),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeEntry(
                        onTap: () => controller.navigate(Routes.makeACharge),
                        imageName: 'make_a_charge',
                        name: 'makeACharge'.tr),
                    HomeEntry(
                        onTap: () => controller.navigate(Routes.reserves),
                        imageName: 'reserves',
                        count: controller.data.value.newBookings,
                        name: 'reserves'.tr)
                  ])),
          Expanded(
              child: Row(children: [
            const Expanded(child: SizedBox()),
            Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: IconButton(
                    onPressed: () async {
                      String url =
                          'whatsapp://send?phone=${Environment.whatsappContact}&text=Hola+necesito+ayuda+en&lang=es';
                      await launchUrl(Uri.parse(url));
                    },
                    icon: Image.asset('assets/icons/support_chat.png',
                        height: 5.h)))
          ]))
        ]));
  }
}
