import 'package:bizne_fonda_app/app/models/home/reserve.dart';
import 'package:bizne_fonda_app/app/models/response.dart';

abstract class ReservesRepository {
  Future<ResponseRepository<ReserveData>> getReserves(
      int type, int page, int count);
  Future<ResponseRepository> acceptReserve(int id);
  Future<ResponseRepository> rejectReserve(int id);
}
