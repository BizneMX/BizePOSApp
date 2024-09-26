import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';

class BizneWebViewController extends LayoutRouteController {
  late WebViewArguments arguments;

  @override
  void onInit() {
    super.onInit();
    arguments = getArguments();
  }
}

class WebViewArguments {
  final String title;
  final String url;

  const WebViewArguments({required this.title, required this.url});
}
