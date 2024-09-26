import 'package:bizne_fonda_app/app/components/buttons.dart';
import 'package:bizne_fonda_app/app/components/dialog.dart';
import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../components/selector.dart';
import '../../../models/home/menu.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;
  final Function(int id, MyFile file) setMenu;
  final Function(int id) deleteMenu;
  const MenuWidget(
      {super.key,
      required this.menu,
      required this.deleteMenu,
      required this.setMenu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if (menu.pic.isNotEmpty) await Get.dialog(ImageDialog(url: menu.pic));
        },
        child: Container(
            height: 7.h,
            decoration: BoxDecoration(
                color: AppThemes().whiteInputs,
                borderRadius: AppThemes().borderRadius),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Row(children: [
                  Expanded(
                      flex: 1,
                      child: Image.asset('assets/icons/photo.png', scale: 3)),
                  Expanded(
                      flex: 4,
                      child: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: MyText(
                              text: menu.name,
                              fontSize: 12.sp,
                              color: AppThemes().primary,
                              type: FontType.bold))),
                  Expanded(
                      flex: 1,
                      child: menu.pic.isEmpty
                          ? FileSelector(
                              onChange: (MyFile file) => setMenu(menu.id, file),
                              child:
                                  Image.asset('assets/icons/add.png', scale: 3))
                          : IconButton(
                              onPressed: () => Get.dialog(BizneDialog(
                                    text: 'deleteMenu'.tr,
                                    onOk: () {
                                      Get.back();
                                      deleteMenu(menu.id);
                                    },
                                    okText: 'delete'.tr,
                                    onCancel: () => Get.back(),
                                  )),
                              icon: Image.asset('assets/icons/delete.png',
                                  scale: 3)))
                ]))));
  }
}

class ImageDialog extends StatelessWidget {
  final String url;
  const ImageDialog({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: AppThemes().borderRadius,
            ),
            width: 80.w,
            child: ClipRRect(
                borderRadius: AppThemes().borderRadius,
                child: Image.network(url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppThemes().primary,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ));
                    },
                    errorBuilder: (context, error, stackTrace) => Center(
                        child: Dialog(
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                decoration: BoxDecoration(
                                    color: AppThemes().white,
                                    borderRadius: AppThemes().borderRadius),
                                height: 20.h,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.error,
                                          color: AppThemes().primary, size: 50),
                                      MyText(
                                          text: 'failMenuPic'.tr,
                                          fontSize: 14.sp,
                                          color: AppThemes().primary,
                                          type: FontType.bold),
                                      BizneElevatedButton(
                                          onPressed: () => Get.back(),
                                          title: 'back'.tr)
                                    ]))))))));
  }
}
