import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/profile/training.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:bizne_fonda_app/app/utils/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class TrainingEntry extends StatelessWidget {
  final Training item;
  final Function() onTap;
  const TrainingEntry({super.key, required this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: AppThemes().borderRadius10,
            border: Border.all(color: AppThemes().primary, width: 1.5)),
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              fontSize: 13.sp,
              text: item.title,
              color: AppThemes().primary,
              type: FontType.bold,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            MyText(
                fontSize: 12.sp,
                type: FontType.semibold,
                color: AppThemes().secondary,
                text: dateFormat2(item.date))
          ],
        ),
      ),
    );
  }
}
