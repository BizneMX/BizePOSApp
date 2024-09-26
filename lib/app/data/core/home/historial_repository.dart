import 'package:bizne_fonda_app/app/models/pagination_data.dart';
import 'package:bizne_fonda_app/app/models/response.dart';
import '../../../models/home/order.dart';

abstract class HistorialRepository {
  Future<ResponseRepository<PaginationData<Order>>> getHistorial(
      String search, String initDate, String endDate, int page, int count);
}
