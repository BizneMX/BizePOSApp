import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class BizneHeader extends StatelessWidget {
  final Function() back;
  final String title;
  final Widget? rightWidget;
  const BizneHeader(
      {super.key, required this.back, required this.title, this.rightWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BizneBackButton(
                    onPressed: back,
                  ),
                ],
              )),
          Expanded(
            flex: 3,
            child: Center(
              child: MyText(
                align: TextAlign.center,
                text: title,
                fontSize: 16.sp,
                type: FontType.bold,
                color: AppThemes().primary,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  rightWidget ?? const SizedBox(),
                ],
              ))
        ],
      ),
    );
  }
}
