import 'dart:io';
import 'package:bizne_fonda_app/app/modules/layout/controllers/web_view_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';

class BiznePDFWebViewController extends LayoutRouteController {
  late WebViewArguments arguments;

  @override
  void onInit() {
    super.onInit();
    arguments = getArguments();
  }

  Future<File> downloadAndSavePdf(String url) async {
    EasyLoading.show();
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/downloaded.pdf');
    await file.writeAsBytes(bytes);
    EasyLoading.dismiss(animation: true);
    return file;
  }
}
