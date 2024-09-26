import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/auth/controllers/banner_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:bizne_fonda_app/app/models/auth/banner.dart';

class BannerView extends GetView<BannerController> {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.banners.asMap().entries.map((e) {
              int ind = e.key;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                child: Container(
                  height: 2.h,
                  width: 2.h,
                  decoration: BoxDecoration(
                      color: ind == controller.step.value
                          ? AppThemes().green
                          : AppThemes().grey,
                      borderRadius: BorderRadius.circular(50)),
                ),
              );
            })
          ],
        ));

    Widget getBanner(BannerModel banner) => Column(
          children: [
            MyText(
              text: banner.title,
              color: AppThemes().primary,
              fontSize: 24.sp,
              align: TextAlign.center,
              type: FontType.bold,
            ),
            SizedBox(
              height: 3.h,
            ),
            MyText(
              text: banner.text,
              color: AppThemes().primary,
              fontSize: 14.sp,
              align: TextAlign.center,
              type: FontType.semibold,
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(child: Image.network(banner.pic))
          ],
        );

    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Image.asset(
                'assets/icons/logo1.png',
                height: 8.h,
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 70.h,
                width: 90.w,
                child: Obx(() => PageView(
                      controller: controller.pageController,
                      physics: const BouncingScrollPhysics(),
                      children: [...controller.banners.map(getBanner)],
                    )),
              ),
              const Expanded(child: SizedBox()),
              steps,
              SizedBox(
                height: 4.h,
              )
            ],
          ),
        ),
        Positioned(
          top: 1.5.h,
          right: 1.5.h,
          child: Obx(() =>
              controller.step.value == controller.banners.length - 1 ||
                      !controller.fistLogin
                  ? BizneElevatedButton(
                      textSize: 12.sp,
                      widthFactor: 0.3,
                      onPressed: controller.finish,
                      title: 'finish'.tr,
                      secondary: true,
                    )
                  : const SizedBox()),
        )
      ],
    );
  }
}
