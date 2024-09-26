import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/modules/home/controller/make_a_charge_controller.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class MakeAChargeView extends GetView<MakeAChargeController> {
  const MakeAChargeView({super.key});

  @override
  Widget build(BuildContext context) {
    var scanArea = 70.w;
    return Stack(
      children: [
        Column(
          children: <Widget>[
            Expanded(
                child: QRView(
                    key: controller.qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                        borderColor: AppThemes().white,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: scanArea),
                    onPermissionSet: (ctrl, p) =>
                        _onPermissionSet(context, ctrl, p))),
          ],
        ),
        Positioned(
            top: 1.h,
            right: 1.h,
            child: IconButton(
              icon: Icon(
                size: 5.h,
                Icons.close,
                color: AppThemes().white,
              ),
              onPressed: () => controller.popNavigate(),
            )),
        Positioned(
            bottom: 15.h,
            child: SizedBox(
              width: 100.w,
              child: Center(
                child: MyText(
                  align: TextAlign.center,
                  text: 'scanQrCode'.tr,
                  fontSize: 16.sp,
                  type: FontType.bold,
                  color: AppThemes().white,
                ),
              ),
            ))
      ],
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No cuenta con permisos de cámara')),
      );
    }
  }

  void _onQRViewCreated(QRViewController qrController) {
    controller.controller = qrController;
    qrController.scannedDataStream.listen((scanData) {
      controller.scanQr(scanData.code);
    });
  }
}
