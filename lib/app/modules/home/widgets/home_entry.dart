import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeEntry extends StatelessWidget {
  final String name;
  final String imageName;
  final int count;
  final Function() onTap;
  const HomeEntry(
      {super.key,
      required this.imageName,
      required this.name,
      required this.onTap,
      this.count = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 18.h,
        width: 18.h,
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            borderRadius: AppThemes().borderRadius10,
            color: AppThemes().white,
            boxShadow: [AppThemes().boxShadow]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                count == 0
                    ? SizedBox(
                        height: 3.5.h,
                      )
                    : Container(
                        height: 3.5.h,
                        width: 3.5.h,
                        decoration: BoxDecoration(
                            color: AppThemes().red,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: MyText(
                            text: count.toString(),
                            color: AppThemes().white,
                          ),
                        ),
                      )
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Image.asset(
              'assets/icons/$imageName.png',
              height: 7.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            MyText(
              fontSize: 12.sp,
              type: FontType.bold,
              text: name,
              color: AppThemes().primary,
            )
          ],
        ),
      ),
    );
  }
}
