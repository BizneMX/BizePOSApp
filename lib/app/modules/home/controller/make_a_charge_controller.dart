import 'package:bizne_fonda_app/app/data/core/home/make_a_charge_repository.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/error_controller.dart';
import 'package:bizne_fonda_app/app/modules/layout/controllers/layout_controller.dart';
import 'package:bizne_fonda_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MakeAChargeController extends LayoutRouteController {
  final MakeAChargeRepository repository;

  MakeAChargeController({required this.repository});

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  var onScan = false;

  String cleanScanData(String data) {
    return data.replaceAll('\u00a0', ' ').replaceAll('\/', '/');
  }

  Future<void> scanQr(String? code) async {
    if (onScan || code == null) return;

    onScan = true;
    final response = await repository.scanQr(cleanScanData(code));
    onScan = false;

    controller?.dispose();

    if (!response.success || response.data == null) {
      navigate(
        Routes.error,
        arguments: ErrorArguments(
            description: response.message ?? 'unexpectedError'.tr,
            error: 'notPossibleToScantQr'.tr),
      );
      return;
    }

    navigate(Routes.payFood, arguments: response.data!);
  }

  @override
  void dispose() {
    controller?.dispose();
    onScan = false;

    super.dispose();
  }
}
