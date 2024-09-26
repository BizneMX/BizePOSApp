import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:bizne_fonda_app/app/utils/date.dart';
import 'package:flutter/widgets.dart';
import 'package:bizne_fonda_app/app/models/home/notification.dart'
    as notificationModel;
import 'package:sizer/sizer.dart';

class NotificationEntry extends StatelessWidget {
  final notificationModel.Notification item;
  const NotificationEntry({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
      decoration: BoxDecoration(
          borderRadius: AppThemes().borderRadius10,
          border: Border.all(width: 1.5, color: AppThemes().primary)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: item.title,
            fontSize: 13.sp,
            type: FontType.bold,
            color: AppThemes().primary,
          ),
          SizedBox(
            height: 1.h,
          ),
          MyText(
            text: item.description,
            fontSize: 12.sp,
            type: FontType.semibold,
            color: AppThemes().primary,
          ),
          SizedBox(
            height: 0.5.h,
          ),
          MyText(
            text: dateFormat2(item.date),
            fontSize: 12.sp,
            type: FontType.semibold,
            color: AppThemes().primary,
          )
        ],
      ),
    );
  }
}
