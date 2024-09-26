import 'package:bizne_fonda_app/app/endpoints.dart';
import 'package:bizne_fonda_app/app/models/home/order.dart';
import 'package:bizne_fonda_app/app/models/pagination_data.dart';

import 'package:bizne_fonda_app/app/models/response.dart';
import 'package:bizne_fonda_app/app/services/api_service.dart';

import '../../core/home/historial_repository.dart';

class HistorialRepositoryImpl extends HistorialRepository {
  @override
  Future<ResponseRepository<PaginationData<Order>>> getHistorial(String search,
      String initDate, String endDate, int page, int count) async {
    final response = await Api().get(Endpoints.historial, {
      'search': search,
      'initDate': initDate,
      'endDate': endDate,
      'count': count.toString(),
      'page': page.toString()
    });

    return response.toResponseRepository(
        fromJson: (json) => PaginationData.fromJson(json, Order.fromJson));
  }
}
