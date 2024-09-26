import 'package:bizne_fonda_app/app/modules/layout/controllers/web_view_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/widgets/bizne_header.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BizneWebView extends GetView<BizneWebViewController> {
  const BizneWebView({super.key});

  @override
  Widget build(BuildContext context) {
    final webController = WebViewController();

    webController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppThemes().white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {
              EasyLoading.dismiss(animation: true);
            } else {
              if (!EasyLoading.isShow) EasyLoading.show();
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );

    webController.loadRequest(Uri.parse(controller.arguments.url));

    return SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(children: [
          BizneHeader(
            back: () => controller.popNavigate(),
            title: controller.arguments.title,
          ),
          Expanded(child: WebViewWidget(controller: webController))
        ]));
  }
}
