import 'package:bizne_fonda_app/app/data/core/home/make_a_charge_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/scan_qr.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class MakeAChargeRepositoryImpl extends MakeAChargeRepository {
  @override
  Future<ResponseRepository> makeACharge(int userId, double total) async {
    final response = await Api()
        .post(Endpoints.makeACharge, {'user_id': userId, 'total': total});

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository<ScanQr>> scanQr(String qr) async {
    final response = await Api().post(Endpoints.scanQr, {'qr': qr});

    return response.toResponseRepository(
        fromJson: (data) => ScanQr.fromJson(data));
  }
}
