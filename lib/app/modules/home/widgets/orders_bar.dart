import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrdersBar extends StatelessWidget {
  final bool firstSelected;
  final String textOne;
  final String textTwo;
  final void Function() onChange;

  const OrdersBar(
      {super.key,
      this.firstSelected = true,
      required this.textOne,
      required this.textTwo,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 5.h,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: onChange,
              child: Container(
                decoration: BoxDecoration(
                    color:
                        firstSelected ? AppThemes().primary : AppThemes().white,
                    boxShadow: [AppThemes().boxShadow]),
                child: Center(
                    child: MyText(
                  text: textOne,
                  fontSize: 12.sp,
                  color:
                      !firstSelected ? AppThemes().primary : AppThemes().white,
                  type: FontType.semibold,
                )),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: onChange,
              child: Container(
                decoration: BoxDecoration(
                    color: !firstSelected
                        ? AppThemes().primary
                        : AppThemes().white,
                    boxShadow: [AppThemes().boxShadow]),
                child: Center(
                    child: MyText(
                  text: textTwo,
                  fontSize: 12.sp,
                  color:
                      firstSelected ? AppThemes().primary : AppThemes().white,
                  type: FontType.semibold,
                )),
              ),
            ))
          ],
        ));
  }
}

// class _OrdersBarState extends State<OrdersBar> {
//   late bool firstSelected;

//   @override
//   void initState() {
//     firstSelected = widget.firsSelected;
//     super.initState();
//   }
// }
