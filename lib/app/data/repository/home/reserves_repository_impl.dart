import 'package:bizne_fonda_app/app/data/core/home/reserves_repository.dart';
import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/reserve.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

class ReservesRepositoryImpl extends ReservesRepository {
  @override
  Future<ResponseRepository> acceptReserve(int id) async {
    final response = await Api().post(Endpoints.acceptReserve, {'id': id});

    return response.toResponseRepository();
  }

  @override
  Future<ResponseRepository<ReserveData>> getReserves(
      int type, int page, int count) async {
    final response = await Api().get(Endpoints.reserves, {
      'type': type.toString(),
      'page': page.toString(),
      'count': count.toString()
    });

    return response.toResponseRepository(
        fromJson: (json) => ReserveData.fromJson(json));
  }

  @override
  Future<ResponseRepository> rejectReserve(int id) async {
    final response = await Api().post(Endpoints.rejectReserve, {'id': id});

    return response.toResponseRepository();
  }
}
