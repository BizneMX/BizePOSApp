import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/profile/controllers/training_controller.dart';
import 'package:bizne_fonda_app/app/modules/profile/widgets/training_entry.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/web_view_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TrainingView extends GetView<TrainingController> {
  const TrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BizneHeader(back: () => controller.popNavigate(), title: 'training'.tr),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          width: 80.w,
          child: MyText(
            fontSize: 12.sp,
            color: AppThemes().secondary,
            align: TextAlign.center,
            type: FontType.semibold,
            text: 'trainingInfo'.tr,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
            child: Obx(() => controller.noData.value
                ? Center(
                    child: MyText(
                      text: 'noData'.tr,
                      fontSize: 12.sp,
                      type: FontType.semibold,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (buildContext, index) {
                      return TrainingEntry(
                          onTap: () => controller.navigate(Routes.pdfWebView,
                              arguments: WebViewArguments(
                                  title: controller.data[index].title,
                                  url: controller.data[index].file)),
                          item: controller.data[index]);
                    })))
      ],
    );
  }
}
