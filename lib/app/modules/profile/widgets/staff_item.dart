import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/profile/staff.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StaffItem extends StatelessWidget {
  final Staff item;
  final Function() action;
  const StaffItem({super.key, required this.item, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
      decoration: BoxDecoration(
          color: AppThemes().white,
          boxShadow: [AppThemes().boxShadow],
          borderRadius: AppThemes().borderRadius10),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: CircleAvatar(
                  radius: 4.h,
                  backgroundColor: AppThemes().grey.withOpacity(0.5),
                  backgroundImage:
                      item.pic == null ? null : NetworkImage(item.pic!))),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      type: FontType.semibold,
                      text: item.name,
                      color: AppThemes().secondary,
                      fontSize: 12.sp,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    MyText(
                        type: FontType.semibold,
                        text: item.phone,
                        color: AppThemes().secondary,
                        fontSize: 12.sp)
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: action,
                    child: Container(
                      padding: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                          color: item.isBlock
                              ? AppThemes().red
                              : AppThemes().secondary,
                          borderRadius: AppThemes().borderRadius10),
                      child: Center(
                        child: MyText(
                          type: FontType.semibold,
                          fontSize: 10.sp,
                          color: AppThemes().white,
                          text: item.isBlock ? 'unBlock'.tr : 'block'.tr,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
