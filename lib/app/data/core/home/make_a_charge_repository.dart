import 'package:bizne_fonda_app/app/models/home/scan_qr.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class MakeAChargeRepository {
  Future<ResponseRepository<ScanQr>> scanQr(String qr);

  Future<ResponseRepository> makeACharge(int userId, double total);
}
