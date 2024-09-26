import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/pdf_web_view_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';

class BiznePDFWebView extends GetView<BiznePDFWebViewController> {
  const BiznePDFWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(children: [
          BizneHeader(
            back: () => controller.popNavigate(),
            title: controller.arguments.title,
          ),
          Expanded(
              child: FutureBuilder<File>(
            future: controller.downloadAndSavePdf(controller.arguments.url),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return PDFView(
                    filePath: snapshot.data!.path,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: MyText(
                      text: 'errorLoadingPDF'.tr,
                      fontSize: 12.sp,
                      type: FontType.semibold,
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ))
        ]));
  }
}
