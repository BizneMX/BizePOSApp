import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// class Footer extends StatelessWidget {
//   final bool inService;
//   final Future<bool> Function(bool) onChange;
//   const Footer({super.key, required this.inService, required this.onChange});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: AppThemes().primary,
//         height: 8.h,
//         width: 100.w,
//         padding: EdgeInsets.symmetric(horizontal: 10.w),
//         child:
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//           MyText(
//               type: FontType.bold,
//               fontSize: 12.sp,
//               text: 'areInService'.tr,
//               color: AppThemes().white),
//           OpenCloseButton(onChange: onChange)
//         ]));
//   }
// }

// class OpenCloseButton extends StatefulWidget {
//   final Future<bool> Function(bool) onChange;
//   const OpenCloseButton({super.key, required this.onChange});

//   @override
//   State<OpenCloseButton> createState() => _OpenCloseButtonState();
// }

// class _OpenCloseButtonState extends State<OpenCloseButton>
//     with SingleTickerProviderStateMixin {
//   bool inService = false;
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(1, 0),
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void onChange(bool value) async {
//     if (await widget.onChange(value)) {
//       setState(() async {
//         inService = value;
//         if (inService) {
//           _controller.forward();
//         } else {
//           _controller.reverse();
//         }
//       });
//     } else {
//       setState(() async {
//         if (inService) {
//           _controller.forward();
//         } else {
//           _controller.reverse();
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         width: 40.w,
//         height: 4.h,
//         child: Stack(children: [
//           Container(
//               height: 4.h,
//               margin: EdgeInsets.symmetric(vertical: 0.25.h, horizontal: 0.5.w),
//               decoration: BoxDecoration(
//                 color: AppThemes().white,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     MyText(
//                         text: 'closed'.tr,
//                         fontSize: 12.sp,
//                         type: FontType.bold),
//                     MyText(
//                         text: 'open'.tr, type: FontType.bold, fontSize: 12.sp)
//                   ])),
//           SlideTransition(
//               position: _animation,
//               child: GestureDetector(
//                   onTap: () => onChange(!inService),
//                   onHorizontalDragUpdate: (details) {
//                     setState(() {
//                       final position =
//                           details.localPosition.dx / context.size!.width;
//                       if (position >= 0 && position <= 1) {
//                         _controller.value = position;
//                       }
//                     });
//                   },
//                   onHorizontalDragEnd: (details) {
//                     if (details.primaryVelocity != null &&
//                         details.primaryVelocity! > 0) {
//                       onChange(true);
//                     } else if (details.primaryVelocity != null &&
//                         details.primaryVelocity! < 0) {
//                       onChange(false);
//                     }
//                   },
//                   child: Container(
//                       height: 4.h,
//                       width: 20.w,
//                       decoration: BoxDecoration(
//                         color: inService ? AppThemes().green : AppThemes().red,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Center(
//                           child: MyText(
//                               fontSize: 12.sp,
//                               color: AppThemes().white,
//                               type: FontType.bold,
//                               text: inService ? 'open'.tr : 'closed'.tr)))))
//         ]));
//   }
// }

class Footer extends StatelessWidget {
  final bool inService;
  final Function(bool) onChange;
  const Footer({super.key, required this.inService, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemes().primary,
      height: 8.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            type: FontType.bold,
            fontSize: 12.sp,
            text: 'areInService'.tr,
            color: AppThemes().white,
          ),
          SizedBox(
            width: 40.w,
            height: 4.h,
            child: Stack(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 0.25.h, horizontal: 0.5.w),
                  decoration: BoxDecoration(
                      color: AppThemes().white,
                      borderRadius: BorderRadius.circular(5)),
                ),
                Positioned(
                    top: 0,
                    left: inService ? null : 0,
                    right: inService ? 0 : null,
                    child: Container(
                      height: 4.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color:
                              inService ? AppThemes().green : AppThemes().red,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: MyText(
                          fontSize: 12.sp,
                          color: AppThemes().white,
                          type: FontType.bold,
                          text: inService ? 'open'.tr : 'closed'.tr,
                        ),
                      ),
                    )),
                Positioned(
                    top: 0,
                    left: !inService ? null : 0,
                    right: !inService ? 0 : null,
                    child: InkWell(
                      onTap: () => onChange(!inService),
                      child: SizedBox(
                        width: 20.w,
                        height: 4.h,
                        child: Center(
                            child: MyText(
                          fontSize: 12.sp,
                          type: FontType.bold,
                          text: !inService ? 'open'.tr : 'closed'.tr,
                        )),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
