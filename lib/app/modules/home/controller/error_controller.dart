import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';

class ErrorController extends LayoutRouteController {
  late ErrorArguments arguments;

  @override
  void onInit() {
    super.onInit();

    arguments = getArguments();
  }
}

class ErrorArguments {
  final String error;
  final String description;

  const ErrorArguments({
    required this.description,
    required this.error,
  });
}
