import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/qr_code_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class QrCodeView extends GetView<QrCodeController> {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BizneHeader(back: () => controller.popNavigate(), title: 'qrCode'.tr),
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          width: 80.w,
          child: MyText(
            fontSize: 14.sp,
            color: AppThemes().secondary,
            type: FontType.semibold,
            text: 'thisIsTheQr'.tr,
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        Obx(() => QrImageView(
              data: controller.data.value,
              version: QrVersions.auto,
              size: 60.w,
            ))
      ],
    );
  }
}
