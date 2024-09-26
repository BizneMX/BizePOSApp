import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/success_payment_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:bizne_fonda_app/app/utils/date.dart';
import 'package:bizne_fonda_app/app/utils/number.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SuccessPaymentView extends GetView<SuccessPaymentController> {
  const SuccessPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Image.asset(
          'assets/icons/success.png',
          height: 12.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 70.w,
          child: MyRichText(
              align: TextAlign.center,
              text: MyTextSpan(children: [
                MyTextSpan(
                    text:
                        '${'foodHasBeenPaid'.tr.split(' ').take(6).join(' ')} ',
                    fontSize: 24.sp,
                    color: AppThemes().primary,
                    type: FontType.bold),
                MyTextSpan(
                    text: 'foodHasBeenPaid'.tr.split(' ').skip(6).join(' '),
                    fontSize: 24.sp,
                    color: AppThemes().green,
                    type: FontType.bold)
              ])),
        ),
        SizedBox(
          height: 10.h,
        ),
        MyText(
          text: 'totalPaid'.tr,
          fontSize: 24.sp,
          color: AppThemes().primary,
          type: FontType.semibold,
        ),
        MyText(
          text: '\$${numberFormat(controller.total)}',
          fontSize: 24.sp,
          color: AppThemes().primary,
          type: FontType.semibold,
        ),
        const Expanded(child: SizedBox()),
        MyText(
          text: dateFormat2(DateTime.now().toString()),
          type: FontType.semibold,
          color: AppThemes().primary,
          fontSize: 16.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
          child: BizneElevatedButton(
            onPressed: () => controller.navigate(Routes.home),
            title: 'finish'.tr,
          ),
        )
      ],
    );
  }
}
