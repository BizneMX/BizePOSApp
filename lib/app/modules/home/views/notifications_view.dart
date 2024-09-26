import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/notifications_controller.dart';
import 'package:bizne_fonda_app/app/modules/home/widgets/notification_entry.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BizneHeader(
            back: () => controller.popNavigate(), title: 'notifications'.tr),
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
                      return NotificationEntry(item: controller.data[index]);
                    })))
      ],
    );
  }
}
